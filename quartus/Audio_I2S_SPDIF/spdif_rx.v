module spdif_rx (
    output reg          oDatavalidL, oDatavalidR,
    output reg [23 :0]  oDataL, oDataR,
    input               iClk,// main system clock used to sample spdif data
    input               rst_i,
    input               iSPDIFin
);

    reg [2:0]   inputsr;        // input shift register
    reg         datatoggle;     // register pulses high when data toggles
    // counts the width between data transitions
    reg [9:0]   pulsewidthcnt;
    // register to hold width between transitions
    reg [9:0]   pulsewidth;
    reg [9:0]   onebitwidth;    // 1-bit width reference
    // signals that pulsewidth has just become valid
    reg         pulsewidthvalid;
    reg         bitonedet;      // detect logic-1 capture
    reg         newbitreg;      // new data registered
    reg [27:0]  framecapture;   // captured frame
    reg         preambledetect;
    reg         preamblesyncen;
    reg         channelsel;     // select channel based on preamble
    reg [5:0]   bitnum;
    reg [10:0]  onebitwidth1p5;
    reg         onebitload;     // load 1-bit reference width
    reg         onebitupdown;   // 1: reference width should increment
    // width used for comparison against reference
    reg [9:0]   pulsewidthcomp;
    reg         onebitgood;     // reference is equal to input width
    reg         preamblesync;   // flags preamble in spdif stream
    reg         shiftnewdat;    // ok to capture
    // load data into output buffer
    reg         outputload, outputloadprev;
    reg         pulsewidthsmall, pulsewidthlarge;
    reg [11:0]  onebitwidth2p5;
    wire        trigviolation;
    wire        newbit;         // raw data decoded from stream

    // flag a violation in BMC code
    assign trigviolation = {1'b0, pulsewidth[9:0], 1'b0} > onebitwidth2p5;
    // if width is small， data is 1.Otherwise data is 0
    assign newbit = ({pulsewidth[9:0], 1'b0} < onebitwidth1p5[10:0]);

    always @ (posedge iClk or posedge rst_i) begin
        if (rst_i) begin
            inputsr <= 0;
            datatoggle <= 0;
            pulsewidth <= 0;
            pulsewidthcnt <= 0;
            onebitwidth <= 0;
            pulsewidthvalid <= 0;
            bitonedet <= 0;    
            newbitreg <= 0;      
            framecapture <= 0;   
            preambledetect <= 0;
            preamblesyncen <= 0;
            channelsel <= 0;     
            bitnum <= 0;
            onebitwidth1p5 <= 0;
            onebitload <= 0;     
            onebitupdown <= 0;   
            pulsewidthcomp <= 0;
            onebitgood <= 0;    
            preamblesync <= 0;  
            shiftnewdat <= 0;   
            outputload <= 0;
            outputloadprev <= 0;
            pulsewidthsmall <= 0;
            pulsewidthlarge <= 0;
            onebitwidth2p5 <= 0; 
            oDatavalidL <= 0;
            oDatavalidR <= 0;
            oDataL <= 0;
            oDataR <= 0;
        end
        else begin
            inputsr <= {inputsr[1:0], iSPDIFin} ;
            // shift data in    
            // trigger on change in data
            datatoggle <= inputsr[2] ^ inputsr[1]; 

            // counter for pulse width
            if (datatoggle) begin
                // counter resets when input toggles
                pulsewidth[9:0] <= pulsewidthcnt[9:0];
                pulsewidthcnt <= 2;
            end
            else
                pulsewidthcnt <= pulsewidthcnt + 10'd2;

            // width register will be valid 1 clock after the data toggles
            pulsewidthvalid <= datatoggle;

            // onebitload checks to see if input period is out of bounds
            // current width is 1/2 1-bit width
            pulsewidthsmall <= ({1'b0, onebitwidth[9:1]} > pulsewidth[9:0]);
            // current width is 4x 1-bit width
            pulsewidthlarge <= ({2'b0, pulsewidth[9:2]} > onebitwidth);
            // load new reference if out of bounds
            onebitload <= pulsewidthlarge || pulsewidthsmall;

            // register width comparison value
            if(!newbit)
                pulsewidthcomp <= {1'b0, pulsewidth[9:1]};
            else
                pulsewidthcomp <= pulsewidth[9:0];

            // checks to see if reference is equal to input width
            onebitgood <= (pulsewidthcomp == onebitwidth);
            // increment reference if input width is greater than reference
            onebitupdown <= (pulsewidthcomp > onebitwidth);

            // keep track of 1-bit width
            // load reference if input width is out of bounds
            if (onebitload)
                onebitwidth <= pulsewidth[9:0];
            else if(!onebitgood && pulsewidthvalid) begin
                // adjust reference
                if (onebitupdown)
                    onebitwidth <= onebitwidth+10'd1;
                else
                    onebitwidth <= onebitwidth-10'd1;
            end

            // set onebitwidth*1.5 and onebitwidth*2.5
            onebitwidth1p5 <= ({onebitwidth[9:0], 1'b0} + {1'b0, onebitwidth[9:0]});
            onebitwidth2p5 <= ({onebitwidth[9:0], 2'b0} + {2'b0, onebitwidth[9:0]});
            // preamblesync is valid only when last frame has completed
            preamblesyncen <= (bitnum == 0) && datatoggle;
            // trigger on preamble in spdif header if input width > 2.5*reference
            preamblesync <= preamblesyncen && trigviolation;

            // capture preamble
            if (preamblesync)
                preambledetect <= 1;
            else if (preambledetect && pulsewidthvalid)
                preambledetect <= 0;

            // set channel
            if (preambledetect && pulsewidthvalid)
                channelsel <= !trigviolation;
            else if (trigviolation && pulsewidthvalid)
                channelsel <= 0;

            newbitreg <= newbit;
            // only trigger on a bit-1 capture every other transition
            if(!newbitreg)
                bitonedet <= 0;
            else if(newbit && datatoggle)
                bitonedet <= !bitonedet;
            
            // set flag to capture data when bit-0 or bit-1 is valid
            shiftnewdat <= pulsewidthvalid && (!newbit || bitonedet);

            // shift register for capture data
            if (shiftnewdat)
                framecapture[27:0] <= {newbit, framecapture[27:1]};
            
            // increment bit counter when new bit is valid
            // reset bit counter when previous frame has finished
            if (outputload)
                bitnum <= 0;
            else if (preamblesync)
                bitnum <= 1;
            else if(shiftnewdat && (bitnum != 0))
                bitnum <= bitnum + 6'd1;

            // data for current frame is ready
            outputload <= (bitnum == 31);
            outputloadprev <= outputload;
            
            // load captured data into output register 
            if (outputload & !outputloadprev) begin
                if (channelsel) begin
                    oDataR <= framecapture[23:0];
                    oDatavalidR <= 1;
                end
                else begin
                    oDataL <= framecapture[23:0];
                    oDatavalidL <= 1;
                end
            end
            else begin
                oDatavalidR <= 0;
                oDatavalidL <= 0;
            end
        end  
    end

endmodule
