// 测频/测周：等精度测量法
// 	    待测频率=时钟工作频率*待测信号计数值/标准信号计数值
// 	    待测周期=1/待测频率
// 测占空比：多周期平均测量方案
// 	    占空比=待测信号占空比计数值/标准信号计数值*100%
// 测时间间隔：多周期平均测量方案
// 	    时间间隔=时间间隔计数值/标准信号计数值*待测周期
module freq_measure(
    input               clk,       //系统时钟
    input               clk_pll,   //倍频时钟
    input               rst_n,	
    input               start_sig,  //接收到MCU发送的开始命令(高电平有效)
	input               fx,         //待测信号
    input               fxB,        //与待测信号同频的方波信号

    output              led,        //led显示闸门开启
    output              done_sig,   //测量结束信号，高电平有效
    output reg [31:0]   fx_cnt,     //待测信号频率计数值
    output reg [31:0]   fbase_cnt,  //标准信号频率计数值
    output reg [31:0]   time_cnt,   //双通道同频率信号的时间间隔计数值
    output reg [31:0]   duty_cnt    //待测信号占空比计数值 
);
//————————————————————————
parameter   GATE_TIME = 32'd19_999_999;//0.1s 的闸门时间
//————————————————————————
wire    start_pulse;       //预置闸门开启命令，高电平有效
reg	    gate;              //预置闸门信号
reg     gatebuf;           //实际闸门信号
//————————————————————————
//检测从MCU接收到的开始信号，上升沿输出高电平
reg MCU_sig1, MCU_sig2;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        MCU_sig1 <= 1'b0;
        MCU_sig2 <= 1'b0;
    end
    else begin
        MCU_sig1 <= start_sig;
        MCU_sig2 <= MCU_sig1;			
    end	
end

assign start_pulse = MCU_sig1 & !MCU_sig2;//上升沿输出高电平
//————————————————————————
//预置闸门
reg [31:0]	cnt1;   //产生 预置闸门 信号的计数器
always @(posedge clk_pll or negedge rst_n) begin//产生 预置闸门 信号
    if (!rst_n) begin
        cnt1 <= 32'd0;
        gate <= 1'b0;
    end 
    else if (cnt1 >= GATE_TIME) begin
		cnt1 <= 32'd0;
		gate <= 1'b0;
    end
	else if (gate == 1'b1)
		cnt1 <= cnt1 + 1'b1; 
    else if (start_pulse == 1'b1)
        gate <= 1'b1;
end

assign led = gate;//led显示闸门开启
//————————————————————————
//实际闸门
always @(posedge fx) begin//产生 实际闸门 信号
    if(gate == 1'b1)
        gatebuf <= 1'b1;
    else
        gatebuf <= 1'b0;
end
//*************************************测频*****************************************//
//等精度测频法
//————————————————————————
//在实际闸门中计数
reg [31:0]  fx_cnt_temp;//待测信号计数值
always @(posedge fx or negedge rst_n) begin//待测信号
    if (!rst_n)
        fx_cnt_temp <= 32'd0;
    else if (gatebuf == 1'b1)
        fx_cnt_temp <= fx_cnt_temp + 1'b1;
    else
        fx_cnt_temp <= 32'd0;
end

reg [31:0]  fbase_cnt_temp;//标准信号计数值
always @(posedge clk_pll or negedge rst_n) begin//标准信号
    if (!rst_n)
        fbase_cnt_temp <= 32'd0;
    else if (gatebuf == 1'b1)
        fbase_cnt_temp <= fbase_cnt_temp + 1'b1;
    else
        fbase_cnt_temp <= 32'd0;
end
/*************************************************************************************/

//*************************************测占空比***************************************//
//计数所有待测信号高电平脉冲，数据处理时除以待测信号周期数，取平均值提高精度
reg [31:0]  duty_cnt_temp;//待测信号占空比计数值
always @(posedge clk_pll or negedge rst_n) begin
    if (!rst_n)
        duty_cnt_temp <= 32'd0;
    else if(gatebuf == 1'b0)
        duty_cnt_temp <= 32'd0;
    else if (gatebuf == 1'b1 && fx == 1'b1)//计数待测信号高电平脉冲
		duty_cnt_temp <= duty_cnt_temp + 1'b1;
    else
        duty_cnt_temp <= duty_cnt_temp;
end
/*************************************************************************************/

//*************************************测时间间隔*************************************//
//多周期平均测量方案
wire        start_fxA;      //以预置闸门开启后 fxA信号的上升沿 作为时间间隔检测的开始标志
wire        end_fxB;        //fxB信号的上升沿 作为时间间隔检测的结束标志
reg         delay_gate;     //时间间隔检测闸门
reg [31:0]  time_cnt_temp;  //双通道同频率信号的时间间隔计数值
//————————————————————————
//以预置闸门开启后 fxA信号的上升沿 作为时间间隔检测的开始标志
reg fxA_r1, fxA_r2;
always @(posedge clk_pll) begin
    fxA_r1 <= fx;
    fxA_r2 <= fxA_r1;	
end

assign start_fxA = fxA_r1 & !fxA_r2;//上升沿输出高电平
//————————————————————————
//fxB信号的上升沿 作为时间间隔检测的结束标志
reg fxB_r1, fxB_r2;
always @(posedge clk_pll) begin
    fxB_r1 <= fxB;
    fxB_r2 <= fxB_r1;	
end

assign end_fxB = fxB_r1 & !fxB_r2;//上升沿输出高电平
//————————————————————————
//时间间隔检测闸门
always @(posedge clk_pll or negedge rst_n) begin
    if (!rst_n)
        delay_gate <= 1'b0;
    else if (start_fxA == 1'b1)  //闸门开启
        delay_gate <= 1'b1;
    else if (end_fxB == 1'b1)    //闸门关闭
        delay_gate <= 1'b0;
    else
        delay_gate <= delay_gate;
end
//————————————————————————
//进行时间间隔检测计数(标准信号的个数)
//计数预置闸门开启后两方波所有时间间隔，数据处理时除以待测信号周期数，取平均值提高精度
always @(posedge clk_pll or negedge rst_n) begin
    if (!rst_n)
        time_cnt_temp <= 32'd0;
    else if (delay_gate == 1'b1 && gate == 1'b1)
		time_cnt_temp <= time_cnt_temp + 1'b1;//当预置闸门和时间间隔检测闸门开启，开始对标准信号计数
    else if (gatebuf == 1'b0)
        time_cnt_temp <= 32'd0;	
end
/*************************************************************************************/

//————————————————————————
//产生结束标志(高电平)
reg done1, done2;
always @(posedge clk_pll) begin
    done1 <= gatebuf;
    done2 <= done1;	
end

assign done_sig = done2 & !done1;//下降沿输出高电平
//————————————————————————
//锁存输出
always @(negedge gatebuf) begin
    fx_cnt    <= fx_cnt_temp;
    fbase_cnt <= fbase_cnt_temp;
    duty_cnt  <= duty_cnt_temp;
    time_cnt  <= time_cnt_temp;
end

endmodule
