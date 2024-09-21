// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Thu Jun  4 14:21:32 2020
// Host        : DESKTOP-GUJ90GN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dds_hdu_ip_0_sim_netlist.v
// Design      : dds_hdu_ip_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dds_hdu_ip_0,read_write_data,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "read_write_data,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    rst_n,
    spi_sck,
    spi_cs_n,
    spi_mosi,
    spi_miso,
    change_flag,
    ch1_wave,
    ch2_wave,
    amp1,
    freq1,
    phase1,
    amp2,
    freq2,
    phase2);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.000" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW" *) input rst_n;
  input spi_sck;
  input spi_cs_n;
  input spi_mosi;
  output spi_miso;
  output change_flag;
  output [15:0]ch1_wave;
  output [15:0]ch2_wave;
  output [31:0]amp1;
  output [31:0]freq1;
  output [31:0]phase1;
  output [31:0]amp2;
  output [31:0]freq2;
  output [31:0]phase2;

  wire [31:0]amp1;
  wire [31:0]amp2;
  wire [15:0]ch1_wave;
  wire [15:0]ch2_wave;
  wire change_flag;
  wire clk;
  wire [31:0]freq1;
  wire [31:0]freq2;
  wire [31:0]phase1;
  wire [31:0]phase2;
  wire rst_n;
  wire spi_cs_n;
  wire spi_mosi;
  wire spi_sck;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_read_write_data inst
       (.amp1(amp1),
        .amp2(amp2),
        .ch1_wave(ch1_wave),
        .ch2_wave(ch2_wave),
        .change_flag(change_flag),
        .clk(clk),
        .freq1(freq1),
        .freq2(freq2),
        .phase1(phase1),
        .phase2(phase2),
        .rst_n(rst_n),
        .spi_cs_n(spi_cs_n),
        .spi_mosi(spi_mosi),
        .spi_sck(spi_sck));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_read_write_data
   (change_flag,
    ch1_wave,
    ch2_wave,
    amp1,
    freq1,
    phase1,
    amp2,
    freq2,
    phase2,
    rst_n,
    spi_cs_n,
    clk,
    spi_sck,
    spi_mosi);
  output change_flag;
  output [15:0]ch1_wave;
  output [15:0]ch2_wave;
  output [31:0]amp1;
  output [31:0]freq1;
  output [31:0]phase1;
  output [31:0]amp2;
  output [31:0]freq2;
  output [31:0]phase2;
  input rst_n;
  input spi_cs_n;
  input clk;
  input spi_sck;
  input spi_mosi;

  wire \FSM_sequential_i[0]_i_4_n_0 ;
  wire \FSM_sequential_i[1]_i_2_n_0 ;
  wire \FSM_sequential_i[2]_i_1_n_0 ;
  wire \FSM_sequential_i[3]_i_1_n_0 ;
  wire \FSM_sequential_i[4]_i_4_n_0 ;
  wire \FSM_sequential_i[4]_i_7_n_0 ;
  wire [31:0]amp1;
  wire [31:0]amp2;
  wire [15:0]ch1_wave;
  wire [15:0]ch2_wave;
  wire change_flag;
  wire change_flag_r1;
  wire change_flag_r2;
  wire clk;
  wire [31:0]freq1;
  wire [31:0]freq2;
  (* RTL_KEEP = "yes" *) wire [4:0]i;
  wire [15:0]p_0_in;
  wire [31:0]phase1;
  wire [31:0]phase2;
  wire read_done;
  wire [207:15]receive_data;
  wire \receive_data_reg_n_0_[0] ;
  wire \receive_data_reg_n_0_[100] ;
  wire \receive_data_reg_n_0_[101] ;
  wire \receive_data_reg_n_0_[102] ;
  wire \receive_data_reg_n_0_[103] ;
  wire \receive_data_reg_n_0_[104] ;
  wire \receive_data_reg_n_0_[105] ;
  wire \receive_data_reg_n_0_[106] ;
  wire \receive_data_reg_n_0_[107] ;
  wire \receive_data_reg_n_0_[108] ;
  wire \receive_data_reg_n_0_[109] ;
  wire \receive_data_reg_n_0_[10] ;
  wire \receive_data_reg_n_0_[110] ;
  wire \receive_data_reg_n_0_[111] ;
  wire \receive_data_reg_n_0_[112] ;
  wire \receive_data_reg_n_0_[113] ;
  wire \receive_data_reg_n_0_[114] ;
  wire \receive_data_reg_n_0_[115] ;
  wire \receive_data_reg_n_0_[116] ;
  wire \receive_data_reg_n_0_[117] ;
  wire \receive_data_reg_n_0_[118] ;
  wire \receive_data_reg_n_0_[119] ;
  wire \receive_data_reg_n_0_[11] ;
  wire \receive_data_reg_n_0_[120] ;
  wire \receive_data_reg_n_0_[121] ;
  wire \receive_data_reg_n_0_[122] ;
  wire \receive_data_reg_n_0_[123] ;
  wire \receive_data_reg_n_0_[124] ;
  wire \receive_data_reg_n_0_[125] ;
  wire \receive_data_reg_n_0_[126] ;
  wire \receive_data_reg_n_0_[127] ;
  wire \receive_data_reg_n_0_[128] ;
  wire \receive_data_reg_n_0_[129] ;
  wire \receive_data_reg_n_0_[12] ;
  wire \receive_data_reg_n_0_[130] ;
  wire \receive_data_reg_n_0_[131] ;
  wire \receive_data_reg_n_0_[132] ;
  wire \receive_data_reg_n_0_[133] ;
  wire \receive_data_reg_n_0_[134] ;
  wire \receive_data_reg_n_0_[135] ;
  wire \receive_data_reg_n_0_[136] ;
  wire \receive_data_reg_n_0_[137] ;
  wire \receive_data_reg_n_0_[138] ;
  wire \receive_data_reg_n_0_[139] ;
  wire \receive_data_reg_n_0_[13] ;
  wire \receive_data_reg_n_0_[140] ;
  wire \receive_data_reg_n_0_[141] ;
  wire \receive_data_reg_n_0_[142] ;
  wire \receive_data_reg_n_0_[143] ;
  wire \receive_data_reg_n_0_[144] ;
  wire \receive_data_reg_n_0_[145] ;
  wire \receive_data_reg_n_0_[146] ;
  wire \receive_data_reg_n_0_[147] ;
  wire \receive_data_reg_n_0_[148] ;
  wire \receive_data_reg_n_0_[149] ;
  wire \receive_data_reg_n_0_[14] ;
  wire \receive_data_reg_n_0_[150] ;
  wire \receive_data_reg_n_0_[151] ;
  wire \receive_data_reg_n_0_[152] ;
  wire \receive_data_reg_n_0_[153] ;
  wire \receive_data_reg_n_0_[154] ;
  wire \receive_data_reg_n_0_[155] ;
  wire \receive_data_reg_n_0_[156] ;
  wire \receive_data_reg_n_0_[157] ;
  wire \receive_data_reg_n_0_[158] ;
  wire \receive_data_reg_n_0_[159] ;
  wire \receive_data_reg_n_0_[15] ;
  wire \receive_data_reg_n_0_[160] ;
  wire \receive_data_reg_n_0_[161] ;
  wire \receive_data_reg_n_0_[162] ;
  wire \receive_data_reg_n_0_[163] ;
  wire \receive_data_reg_n_0_[164] ;
  wire \receive_data_reg_n_0_[165] ;
  wire \receive_data_reg_n_0_[166] ;
  wire \receive_data_reg_n_0_[167] ;
  wire \receive_data_reg_n_0_[168] ;
  wire \receive_data_reg_n_0_[169] ;
  wire \receive_data_reg_n_0_[16] ;
  wire \receive_data_reg_n_0_[170] ;
  wire \receive_data_reg_n_0_[171] ;
  wire \receive_data_reg_n_0_[172] ;
  wire \receive_data_reg_n_0_[173] ;
  wire \receive_data_reg_n_0_[174] ;
  wire \receive_data_reg_n_0_[175] ;
  wire \receive_data_reg_n_0_[176] ;
  wire \receive_data_reg_n_0_[177] ;
  wire \receive_data_reg_n_0_[178] ;
  wire \receive_data_reg_n_0_[179] ;
  wire \receive_data_reg_n_0_[17] ;
  wire \receive_data_reg_n_0_[180] ;
  wire \receive_data_reg_n_0_[181] ;
  wire \receive_data_reg_n_0_[182] ;
  wire \receive_data_reg_n_0_[183] ;
  wire \receive_data_reg_n_0_[184] ;
  wire \receive_data_reg_n_0_[185] ;
  wire \receive_data_reg_n_0_[186] ;
  wire \receive_data_reg_n_0_[187] ;
  wire \receive_data_reg_n_0_[188] ;
  wire \receive_data_reg_n_0_[189] ;
  wire \receive_data_reg_n_0_[18] ;
  wire \receive_data_reg_n_0_[190] ;
  wire \receive_data_reg_n_0_[191] ;
  wire \receive_data_reg_n_0_[192] ;
  wire \receive_data_reg_n_0_[193] ;
  wire \receive_data_reg_n_0_[194] ;
  wire \receive_data_reg_n_0_[195] ;
  wire \receive_data_reg_n_0_[196] ;
  wire \receive_data_reg_n_0_[197] ;
  wire \receive_data_reg_n_0_[198] ;
  wire \receive_data_reg_n_0_[199] ;
  wire \receive_data_reg_n_0_[19] ;
  wire \receive_data_reg_n_0_[1] ;
  wire \receive_data_reg_n_0_[200] ;
  wire \receive_data_reg_n_0_[201] ;
  wire \receive_data_reg_n_0_[202] ;
  wire \receive_data_reg_n_0_[203] ;
  wire \receive_data_reg_n_0_[204] ;
  wire \receive_data_reg_n_0_[205] ;
  wire \receive_data_reg_n_0_[206] ;
  wire \receive_data_reg_n_0_[207] ;
  wire \receive_data_reg_n_0_[20] ;
  wire \receive_data_reg_n_0_[21] ;
  wire \receive_data_reg_n_0_[22] ;
  wire \receive_data_reg_n_0_[23] ;
  wire \receive_data_reg_n_0_[24] ;
  wire \receive_data_reg_n_0_[25] ;
  wire \receive_data_reg_n_0_[26] ;
  wire \receive_data_reg_n_0_[27] ;
  wire \receive_data_reg_n_0_[28] ;
  wire \receive_data_reg_n_0_[29] ;
  wire \receive_data_reg_n_0_[2] ;
  wire \receive_data_reg_n_0_[30] ;
  wire \receive_data_reg_n_0_[31] ;
  wire \receive_data_reg_n_0_[32] ;
  wire \receive_data_reg_n_0_[33] ;
  wire \receive_data_reg_n_0_[34] ;
  wire \receive_data_reg_n_0_[35] ;
  wire \receive_data_reg_n_0_[36] ;
  wire \receive_data_reg_n_0_[37] ;
  wire \receive_data_reg_n_0_[38] ;
  wire \receive_data_reg_n_0_[39] ;
  wire \receive_data_reg_n_0_[3] ;
  wire \receive_data_reg_n_0_[40] ;
  wire \receive_data_reg_n_0_[41] ;
  wire \receive_data_reg_n_0_[42] ;
  wire \receive_data_reg_n_0_[43] ;
  wire \receive_data_reg_n_0_[44] ;
  wire \receive_data_reg_n_0_[45] ;
  wire \receive_data_reg_n_0_[46] ;
  wire \receive_data_reg_n_0_[47] ;
  wire \receive_data_reg_n_0_[48] ;
  wire \receive_data_reg_n_0_[49] ;
  wire \receive_data_reg_n_0_[4] ;
  wire \receive_data_reg_n_0_[50] ;
  wire \receive_data_reg_n_0_[51] ;
  wire \receive_data_reg_n_0_[52] ;
  wire \receive_data_reg_n_0_[53] ;
  wire \receive_data_reg_n_0_[54] ;
  wire \receive_data_reg_n_0_[55] ;
  wire \receive_data_reg_n_0_[56] ;
  wire \receive_data_reg_n_0_[57] ;
  wire \receive_data_reg_n_0_[58] ;
  wire \receive_data_reg_n_0_[59] ;
  wire \receive_data_reg_n_0_[5] ;
  wire \receive_data_reg_n_0_[60] ;
  wire \receive_data_reg_n_0_[61] ;
  wire \receive_data_reg_n_0_[62] ;
  wire \receive_data_reg_n_0_[63] ;
  wire \receive_data_reg_n_0_[64] ;
  wire \receive_data_reg_n_0_[65] ;
  wire \receive_data_reg_n_0_[66] ;
  wire \receive_data_reg_n_0_[67] ;
  wire \receive_data_reg_n_0_[68] ;
  wire \receive_data_reg_n_0_[69] ;
  wire \receive_data_reg_n_0_[6] ;
  wire \receive_data_reg_n_0_[70] ;
  wire \receive_data_reg_n_0_[71] ;
  wire \receive_data_reg_n_0_[72] ;
  wire \receive_data_reg_n_0_[73] ;
  wire \receive_data_reg_n_0_[74] ;
  wire \receive_data_reg_n_0_[75] ;
  wire \receive_data_reg_n_0_[76] ;
  wire \receive_data_reg_n_0_[77] ;
  wire \receive_data_reg_n_0_[78] ;
  wire \receive_data_reg_n_0_[79] ;
  wire \receive_data_reg_n_0_[7] ;
  wire \receive_data_reg_n_0_[80] ;
  wire \receive_data_reg_n_0_[81] ;
  wire \receive_data_reg_n_0_[82] ;
  wire \receive_data_reg_n_0_[83] ;
  wire \receive_data_reg_n_0_[84] ;
  wire \receive_data_reg_n_0_[85] ;
  wire \receive_data_reg_n_0_[86] ;
  wire \receive_data_reg_n_0_[87] ;
  wire \receive_data_reg_n_0_[88] ;
  wire \receive_data_reg_n_0_[89] ;
  wire \receive_data_reg_n_0_[8] ;
  wire \receive_data_reg_n_0_[90] ;
  wire \receive_data_reg_n_0_[91] ;
  wire \receive_data_reg_n_0_[92] ;
  wire \receive_data_reg_n_0_[93] ;
  wire \receive_data_reg_n_0_[94] ;
  wire \receive_data_reg_n_0_[95] ;
  wire \receive_data_reg_n_0_[96] ;
  wire \receive_data_reg_n_0_[97] ;
  wire \receive_data_reg_n_0_[98] ;
  wire \receive_data_reg_n_0_[99] ;
  wire \receive_data_reg_n_0_[9] ;
  wire rst_n;
  wire spi_cs_n;
  wire spi_done;
  wire spi_mosi;
  wire spi_sck;
  wire u_spi_stm32_n_0;
  wire u_spi_stm32_n_100;
  wire u_spi_stm32_n_101;
  wire u_spi_stm32_n_102;
  wire u_spi_stm32_n_103;
  wire u_spi_stm32_n_104;
  wire u_spi_stm32_n_105;
  wire u_spi_stm32_n_106;
  wire u_spi_stm32_n_107;
  wire u_spi_stm32_n_108;
  wire u_spi_stm32_n_109;
  wire u_spi_stm32_n_110;
  wire u_spi_stm32_n_111;
  wire u_spi_stm32_n_112;
  wire u_spi_stm32_n_113;
  wire u_spi_stm32_n_114;
  wire u_spi_stm32_n_115;
  wire u_spi_stm32_n_116;
  wire u_spi_stm32_n_117;
  wire u_spi_stm32_n_118;
  wire u_spi_stm32_n_119;
  wire u_spi_stm32_n_120;
  wire u_spi_stm32_n_121;
  wire u_spi_stm32_n_122;
  wire u_spi_stm32_n_123;
  wire u_spi_stm32_n_124;
  wire u_spi_stm32_n_125;
  wire u_spi_stm32_n_126;
  wire u_spi_stm32_n_127;
  wire u_spi_stm32_n_128;
  wire u_spi_stm32_n_129;
  wire u_spi_stm32_n_130;
  wire u_spi_stm32_n_131;
  wire u_spi_stm32_n_132;
  wire u_spi_stm32_n_133;
  wire u_spi_stm32_n_134;
  wire u_spi_stm32_n_135;
  wire u_spi_stm32_n_136;
  wire u_spi_stm32_n_137;
  wire u_spi_stm32_n_138;
  wire u_spi_stm32_n_139;
  wire u_spi_stm32_n_140;
  wire u_spi_stm32_n_141;
  wire u_spi_stm32_n_142;
  wire u_spi_stm32_n_143;
  wire u_spi_stm32_n_144;
  wire u_spi_stm32_n_145;
  wire u_spi_stm32_n_146;
  wire u_spi_stm32_n_147;
  wire u_spi_stm32_n_148;
  wire u_spi_stm32_n_149;
  wire u_spi_stm32_n_150;
  wire u_spi_stm32_n_151;
  wire u_spi_stm32_n_152;
  wire u_spi_stm32_n_153;
  wire u_spi_stm32_n_154;
  wire u_spi_stm32_n_155;
  wire u_spi_stm32_n_156;
  wire u_spi_stm32_n_157;
  wire u_spi_stm32_n_158;
  wire u_spi_stm32_n_159;
  wire u_spi_stm32_n_16;
  wire u_spi_stm32_n_160;
  wire u_spi_stm32_n_161;
  wire u_spi_stm32_n_162;
  wire u_spi_stm32_n_163;
  wire u_spi_stm32_n_164;
  wire u_spi_stm32_n_165;
  wire u_spi_stm32_n_166;
  wire u_spi_stm32_n_167;
  wire u_spi_stm32_n_168;
  wire u_spi_stm32_n_169;
  wire u_spi_stm32_n_17;
  wire u_spi_stm32_n_170;
  wire u_spi_stm32_n_171;
  wire u_spi_stm32_n_172;
  wire u_spi_stm32_n_173;
  wire u_spi_stm32_n_174;
  wire u_spi_stm32_n_175;
  wire u_spi_stm32_n_176;
  wire u_spi_stm32_n_177;
  wire u_spi_stm32_n_178;
  wire u_spi_stm32_n_179;
  wire u_spi_stm32_n_18;
  wire u_spi_stm32_n_180;
  wire u_spi_stm32_n_181;
  wire u_spi_stm32_n_182;
  wire u_spi_stm32_n_183;
  wire u_spi_stm32_n_184;
  wire u_spi_stm32_n_185;
  wire u_spi_stm32_n_186;
  wire u_spi_stm32_n_187;
  wire u_spi_stm32_n_188;
  wire u_spi_stm32_n_189;
  wire u_spi_stm32_n_19;
  wire u_spi_stm32_n_190;
  wire u_spi_stm32_n_191;
  wire u_spi_stm32_n_192;
  wire u_spi_stm32_n_193;
  wire u_spi_stm32_n_194;
  wire u_spi_stm32_n_195;
  wire u_spi_stm32_n_196;
  wire u_spi_stm32_n_197;
  wire u_spi_stm32_n_198;
  wire u_spi_stm32_n_199;
  wire u_spi_stm32_n_2;
  wire u_spi_stm32_n_20;
  wire u_spi_stm32_n_200;
  wire u_spi_stm32_n_201;
  wire u_spi_stm32_n_202;
  wire u_spi_stm32_n_203;
  wire u_spi_stm32_n_204;
  wire u_spi_stm32_n_205;
  wire u_spi_stm32_n_206;
  wire u_spi_stm32_n_207;
  wire u_spi_stm32_n_208;
  wire u_spi_stm32_n_209;
  wire u_spi_stm32_n_21;
  wire u_spi_stm32_n_210;
  wire u_spi_stm32_n_211;
  wire u_spi_stm32_n_212;
  wire u_spi_stm32_n_213;
  wire u_spi_stm32_n_214;
  wire u_spi_stm32_n_215;
  wire u_spi_stm32_n_216;
  wire u_spi_stm32_n_217;
  wire u_spi_stm32_n_218;
  wire u_spi_stm32_n_219;
  wire u_spi_stm32_n_22;
  wire u_spi_stm32_n_220;
  wire u_spi_stm32_n_221;
  wire u_spi_stm32_n_222;
  wire u_spi_stm32_n_223;
  wire u_spi_stm32_n_224;
  wire u_spi_stm32_n_225;
  wire u_spi_stm32_n_226;
  wire u_spi_stm32_n_227;
  wire u_spi_stm32_n_228;
  wire u_spi_stm32_n_229;
  wire u_spi_stm32_n_23;
  wire u_spi_stm32_n_230;
  wire u_spi_stm32_n_231;
  wire u_spi_stm32_n_232;
  wire u_spi_stm32_n_233;
  wire u_spi_stm32_n_234;
  wire u_spi_stm32_n_235;
  wire u_spi_stm32_n_236;
  wire u_spi_stm32_n_237;
  wire u_spi_stm32_n_238;
  wire u_spi_stm32_n_239;
  wire u_spi_stm32_n_24;
  wire u_spi_stm32_n_240;
  wire u_spi_stm32_n_241;
  wire u_spi_stm32_n_242;
  wire u_spi_stm32_n_243;
  wire u_spi_stm32_n_244;
  wire u_spi_stm32_n_25;
  wire u_spi_stm32_n_26;
  wire u_spi_stm32_n_27;
  wire u_spi_stm32_n_28;
  wire u_spi_stm32_n_29;
  wire u_spi_stm32_n_30;
  wire u_spi_stm32_n_31;
  wire u_spi_stm32_n_32;
  wire u_spi_stm32_n_33;
  wire u_spi_stm32_n_34;
  wire u_spi_stm32_n_35;
  wire u_spi_stm32_n_36;
  wire u_spi_stm32_n_37;
  wire u_spi_stm32_n_38;
  wire u_spi_stm32_n_39;
  wire u_spi_stm32_n_4;
  wire u_spi_stm32_n_40;
  wire u_spi_stm32_n_41;
  wire u_spi_stm32_n_42;
  wire u_spi_stm32_n_43;
  wire u_spi_stm32_n_44;
  wire u_spi_stm32_n_45;
  wire u_spi_stm32_n_46;
  wire u_spi_stm32_n_47;
  wire u_spi_stm32_n_48;
  wire u_spi_stm32_n_49;
  wire u_spi_stm32_n_50;
  wire u_spi_stm32_n_51;
  wire u_spi_stm32_n_52;
  wire u_spi_stm32_n_53;
  wire u_spi_stm32_n_54;
  wire u_spi_stm32_n_55;
  wire u_spi_stm32_n_56;
  wire u_spi_stm32_n_57;
  wire u_spi_stm32_n_58;
  wire u_spi_stm32_n_59;
  wire u_spi_stm32_n_60;
  wire u_spi_stm32_n_61;
  wire u_spi_stm32_n_62;
  wire u_spi_stm32_n_63;
  wire u_spi_stm32_n_64;
  wire u_spi_stm32_n_65;
  wire u_spi_stm32_n_66;
  wire u_spi_stm32_n_67;
  wire u_spi_stm32_n_68;
  wire u_spi_stm32_n_69;
  wire u_spi_stm32_n_70;
  wire u_spi_stm32_n_71;
  wire u_spi_stm32_n_72;
  wire u_spi_stm32_n_73;
  wire u_spi_stm32_n_74;
  wire u_spi_stm32_n_75;
  wire u_spi_stm32_n_76;
  wire u_spi_stm32_n_77;
  wire u_spi_stm32_n_78;
  wire u_spi_stm32_n_79;
  wire u_spi_stm32_n_80;
  wire u_spi_stm32_n_81;
  wire u_spi_stm32_n_82;
  wire u_spi_stm32_n_83;
  wire u_spi_stm32_n_84;
  wire u_spi_stm32_n_85;
  wire u_spi_stm32_n_86;
  wire u_spi_stm32_n_87;
  wire u_spi_stm32_n_88;
  wire u_spi_stm32_n_89;
  wire u_spi_stm32_n_90;
  wire u_spi_stm32_n_91;
  wire u_spi_stm32_n_92;
  wire u_spi_stm32_n_93;
  wire u_spi_stm32_n_94;
  wire u_spi_stm32_n_95;
  wire u_spi_stm32_n_96;
  wire u_spi_stm32_n_97;
  wire u_spi_stm32_n_98;
  wire u_spi_stm32_n_99;

  LUT2 #(
    .INIT(4'hE)) 
    \FSM_sequential_i[0]_i_4 
       (.I0(i[3]),
        .I1(i[2]),
        .O(\FSM_sequential_i[0]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \FSM_sequential_i[1]_i_2 
       (.I0(i[3]),
        .I1(i[2]),
        .I2(i[1]),
        .O(\FSM_sequential_i[1]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h006C)) 
    \FSM_sequential_i[2]_i_1 
       (.I0(i[0]),
        .I1(i[2]),
        .I2(i[1]),
        .I3(i[4]),
        .O(\FSM_sequential_i[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00006AAA)) 
    \FSM_sequential_i[3]_i_1 
       (.I0(i[3]),
        .I1(i[1]),
        .I2(i[2]),
        .I3(i[0]),
        .I4(i[4]),
        .O(\FSM_sequential_i[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \FSM_sequential_i[4]_i_4 
       (.I0(i[0]),
        .I1(i[1]),
        .I2(i[2]),
        .I3(i[3]),
        .O(\FSM_sequential_i[4]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \FSM_sequential_i[4]_i_7 
       (.I0(i[0]),
        .I1(i[2]),
        .I2(i[3]),
        .O(\FSM_sequential_i[4]_i_7_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:00000,iSTATE0:00001,iSTATE1:00010,iSTATE2:00011,iSTATE3:00100,iSTATE4:00101,iSTATE5:00110,iSTATE6:00111,iSTATE7:01000,iSTATE8:01001,iSTATE9:01010,iSTATE10:01011,iSTATE11:01100,iSTATE12:01101,iSTATE13:01110,iSTATE14:01111,iSTATE15:10000,iSTATE16:10001" *) 
  (* KEEP = "yes" *) 
  FDCE \FSM_sequential_i_reg[0] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_241),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_242),
        .Q(i[0]));
  (* FSM_ENCODED_STATES = "iSTATE:00000,iSTATE0:00001,iSTATE1:00010,iSTATE2:00011,iSTATE3:00100,iSTATE4:00101,iSTATE5:00110,iSTATE6:00111,iSTATE7:01000,iSTATE8:01001,iSTATE9:01010,iSTATE10:01011,iSTATE11:01100,iSTATE12:01101,iSTATE13:01110,iSTATE14:01111,iSTATE15:10000,iSTATE16:10001" *) 
  (* KEEP = "yes" *) 
  FDCE \FSM_sequential_i_reg[1] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_241),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_240),
        .Q(i[1]));
  (* FSM_ENCODED_STATES = "iSTATE:00000,iSTATE0:00001,iSTATE1:00010,iSTATE2:00011,iSTATE3:00100,iSTATE4:00101,iSTATE5:00110,iSTATE6:00111,iSTATE7:01000,iSTATE8:01001,iSTATE9:01010,iSTATE10:01011,iSTATE11:01100,iSTATE12:01101,iSTATE13:01110,iSTATE14:01111,iSTATE15:10000,iSTATE16:10001" *) 
  (* KEEP = "yes" *) 
  FDCE \FSM_sequential_i_reg[2] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_241),
        .CLR(u_spi_stm32_n_0),
        .D(\FSM_sequential_i[2]_i_1_n_0 ),
        .Q(i[2]));
  (* FSM_ENCODED_STATES = "iSTATE:00000,iSTATE0:00001,iSTATE1:00010,iSTATE2:00011,iSTATE3:00100,iSTATE4:00101,iSTATE5:00110,iSTATE6:00111,iSTATE7:01000,iSTATE8:01001,iSTATE9:01010,iSTATE10:01011,iSTATE11:01100,iSTATE12:01101,iSTATE13:01110,iSTATE14:01111,iSTATE15:10000,iSTATE16:10001" *) 
  (* KEEP = "yes" *) 
  FDCE \FSM_sequential_i_reg[3] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_241),
        .CLR(u_spi_stm32_n_0),
        .D(\FSM_sequential_i[3]_i_1_n_0 ),
        .Q(i[3]));
  (* FSM_ENCODED_STATES = "iSTATE:00000,iSTATE0:00001,iSTATE1:00010,iSTATE2:00011,iSTATE3:00100,iSTATE4:00101,iSTATE5:00110,iSTATE6:00111,iSTATE7:01000,iSTATE8:01001,iSTATE9:01010,iSTATE10:01011,iSTATE11:01100,iSTATE12:01101,iSTATE13:01110,iSTATE14:01111,iSTATE15:10000,iSTATE16:10001" *) 
  (* KEEP = "yes" *) 
  FDCE \FSM_sequential_i_reg[4] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_241),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_243),
        .Q(i[4]));
  FDCE \amp1_reg[0] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[160] ),
        .Q(amp1[0]));
  FDCE \amp1_reg[10] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[170] ),
        .Q(amp1[10]));
  FDCE \amp1_reg[11] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[171] ),
        .Q(amp1[11]));
  FDCE \amp1_reg[12] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[172] ),
        .Q(amp1[12]));
  FDCE \amp1_reg[13] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[173] ),
        .Q(amp1[13]));
  FDCE \amp1_reg[14] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[174] ),
        .Q(amp1[14]));
  FDCE \amp1_reg[15] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[175] ),
        .Q(amp1[15]));
  FDCE \amp1_reg[16] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[176] ),
        .Q(amp1[16]));
  FDCE \amp1_reg[17] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[177] ),
        .Q(amp1[17]));
  FDCE \amp1_reg[18] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[178] ),
        .Q(amp1[18]));
  FDCE \amp1_reg[19] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[179] ),
        .Q(amp1[19]));
  FDCE \amp1_reg[1] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[161] ),
        .Q(amp1[1]));
  FDCE \amp1_reg[20] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[180] ),
        .Q(amp1[20]));
  FDCE \amp1_reg[21] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[181] ),
        .Q(amp1[21]));
  FDCE \amp1_reg[22] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[182] ),
        .Q(amp1[22]));
  FDCE \amp1_reg[23] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[183] ),
        .Q(amp1[23]));
  FDCE \amp1_reg[24] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[184] ),
        .Q(amp1[24]));
  FDCE \amp1_reg[25] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[185] ),
        .Q(amp1[25]));
  FDCE \amp1_reg[26] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[186] ),
        .Q(amp1[26]));
  FDCE \amp1_reg[27] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[187] ),
        .Q(amp1[27]));
  FDCE \amp1_reg[28] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[188] ),
        .Q(amp1[28]));
  FDCE \amp1_reg[29] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[189] ),
        .Q(amp1[29]));
  FDCE \amp1_reg[2] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[162] ),
        .Q(amp1[2]));
  FDCE \amp1_reg[30] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[190] ),
        .Q(amp1[30]));
  FDCE \amp1_reg[31] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[191] ),
        .Q(amp1[31]));
  FDCE \amp1_reg[3] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[163] ),
        .Q(amp1[3]));
  FDCE \amp1_reg[4] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[164] ),
        .Q(amp1[4]));
  FDCE \amp1_reg[5] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[165] ),
        .Q(amp1[5]));
  FDCE \amp1_reg[6] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[166] ),
        .Q(amp1[6]));
  FDCE \amp1_reg[7] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[167] ),
        .Q(amp1[7]));
  FDCE \amp1_reg[8] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[168] ),
        .Q(amp1[8]));
  FDCE \amp1_reg[9] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[169] ),
        .Q(amp1[9]));
  FDCE \amp2_reg[0] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[64] ),
        .Q(amp2[0]));
  FDCE \amp2_reg[10] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[74] ),
        .Q(amp2[10]));
  FDCE \amp2_reg[11] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[75] ),
        .Q(amp2[11]));
  FDCE \amp2_reg[12] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[76] ),
        .Q(amp2[12]));
  FDCE \amp2_reg[13] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[77] ),
        .Q(amp2[13]));
  FDCE \amp2_reg[14] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[78] ),
        .Q(amp2[14]));
  FDCE \amp2_reg[15] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[79] ),
        .Q(amp2[15]));
  FDCE \amp2_reg[16] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[80] ),
        .Q(amp2[16]));
  FDCE \amp2_reg[17] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[81] ),
        .Q(amp2[17]));
  FDCE \amp2_reg[18] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[82] ),
        .Q(amp2[18]));
  FDCE \amp2_reg[19] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[83] ),
        .Q(amp2[19]));
  FDCE \amp2_reg[1] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[65] ),
        .Q(amp2[1]));
  FDCE \amp2_reg[20] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[84] ),
        .Q(amp2[20]));
  FDCE \amp2_reg[21] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[85] ),
        .Q(amp2[21]));
  FDCE \amp2_reg[22] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[86] ),
        .Q(amp2[22]));
  FDCE \amp2_reg[23] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[87] ),
        .Q(amp2[23]));
  FDCE \amp2_reg[24] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[88] ),
        .Q(amp2[24]));
  FDCE \amp2_reg[25] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[89] ),
        .Q(amp2[25]));
  FDCE \amp2_reg[26] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[90] ),
        .Q(amp2[26]));
  FDCE \amp2_reg[27] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[91] ),
        .Q(amp2[27]));
  FDCE \amp2_reg[28] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[92] ),
        .Q(amp2[28]));
  FDCE \amp2_reg[29] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[93] ),
        .Q(amp2[29]));
  FDCE \amp2_reg[2] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[66] ),
        .Q(amp2[2]));
  FDCE \amp2_reg[30] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[94] ),
        .Q(amp2[30]));
  FDCE \amp2_reg[31] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[95] ),
        .Q(amp2[31]));
  FDCE \amp2_reg[3] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[67] ),
        .Q(amp2[3]));
  FDCE \amp2_reg[4] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[68] ),
        .Q(amp2[4]));
  FDCE \amp2_reg[5] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[69] ),
        .Q(amp2[5]));
  FDCE \amp2_reg[6] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[70] ),
        .Q(amp2[6]));
  FDCE \amp2_reg[7] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[71] ),
        .Q(amp2[7]));
  FDCE \amp2_reg[8] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[72] ),
        .Q(amp2[8]));
  FDCE \amp2_reg[9] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[73] ),
        .Q(amp2[9]));
  FDCE \ch1_wave_reg[0] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(p_0_in[0]),
        .Q(ch1_wave[0]));
  FDCE \ch1_wave_reg[10] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(p_0_in[10]),
        .Q(ch1_wave[10]));
  FDCE \ch1_wave_reg[11] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(p_0_in[11]),
        .Q(ch1_wave[11]));
  FDCE \ch1_wave_reg[12] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(p_0_in[12]),
        .Q(ch1_wave[12]));
  FDCE \ch1_wave_reg[13] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(p_0_in[13]),
        .Q(ch1_wave[13]));
  FDCE \ch1_wave_reg[14] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(p_0_in[14]),
        .Q(ch1_wave[14]));
  FDCE \ch1_wave_reg[15] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(p_0_in[15]),
        .Q(ch1_wave[15]));
  FDCE \ch1_wave_reg[1] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(p_0_in[1]),
        .Q(ch1_wave[1]));
  FDCE \ch1_wave_reg[2] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(p_0_in[2]),
        .Q(ch1_wave[2]));
  FDCE \ch1_wave_reg[3] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(p_0_in[3]),
        .Q(ch1_wave[3]));
  FDCE \ch1_wave_reg[4] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(p_0_in[4]),
        .Q(ch1_wave[4]));
  FDCE \ch1_wave_reg[5] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(p_0_in[5]),
        .Q(ch1_wave[5]));
  FDCE \ch1_wave_reg[6] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(p_0_in[6]),
        .Q(ch1_wave[6]));
  FDCE \ch1_wave_reg[7] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(p_0_in[7]),
        .Q(ch1_wave[7]));
  FDCE \ch1_wave_reg[8] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(p_0_in[8]),
        .Q(ch1_wave[8]));
  FDCE \ch1_wave_reg[9] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(p_0_in[9]),
        .Q(ch1_wave[9]));
  FDCE \ch2_wave_reg[0] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[192] ),
        .Q(ch2_wave[0]));
  FDCE \ch2_wave_reg[10] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[202] ),
        .Q(ch2_wave[10]));
  FDCE \ch2_wave_reg[11] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[203] ),
        .Q(ch2_wave[11]));
  FDCE \ch2_wave_reg[12] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[204] ),
        .Q(ch2_wave[12]));
  FDCE \ch2_wave_reg[13] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[205] ),
        .Q(ch2_wave[13]));
  FDCE \ch2_wave_reg[14] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[206] ),
        .Q(ch2_wave[14]));
  FDCE \ch2_wave_reg[15] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[207] ),
        .Q(ch2_wave[15]));
  FDCE \ch2_wave_reg[1] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[193] ),
        .Q(ch2_wave[1]));
  FDCE \ch2_wave_reg[2] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[194] ),
        .Q(ch2_wave[2]));
  FDCE \ch2_wave_reg[3] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[195] ),
        .Q(ch2_wave[3]));
  FDCE \ch2_wave_reg[4] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[196] ),
        .Q(ch2_wave[4]));
  FDCE \ch2_wave_reg[5] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[197] ),
        .Q(ch2_wave[5]));
  FDCE \ch2_wave_reg[6] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[198] ),
        .Q(ch2_wave[6]));
  FDCE \ch2_wave_reg[7] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[199] ),
        .Q(ch2_wave[7]));
  FDCE \ch2_wave_reg[8] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[200] ),
        .Q(ch2_wave[8]));
  FDCE \ch2_wave_reg[9] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[201] ),
        .Q(ch2_wave[9]));
  LUT2 #(
    .INIT(4'h2)) 
    change_flag_INST_0
       (.I0(change_flag_r1),
        .I1(change_flag_r2),
        .O(change_flag));
  FDCE change_flag_r1_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(read_done),
        .Q(change_flag_r1));
  FDCE change_flag_r2_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(change_flag_r1),
        .Q(change_flag_r2));
  FDCE \freq1_reg[0] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[128] ),
        .Q(freq1[0]));
  FDCE \freq1_reg[10] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[138] ),
        .Q(freq1[10]));
  FDCE \freq1_reg[11] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[139] ),
        .Q(freq1[11]));
  FDCE \freq1_reg[12] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[140] ),
        .Q(freq1[12]));
  FDCE \freq1_reg[13] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[141] ),
        .Q(freq1[13]));
  FDCE \freq1_reg[14] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[142] ),
        .Q(freq1[14]));
  FDCE \freq1_reg[15] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[143] ),
        .Q(freq1[15]));
  FDCE \freq1_reg[16] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[144] ),
        .Q(freq1[16]));
  FDCE \freq1_reg[17] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[145] ),
        .Q(freq1[17]));
  FDCE \freq1_reg[18] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[146] ),
        .Q(freq1[18]));
  FDCE \freq1_reg[19] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[147] ),
        .Q(freq1[19]));
  FDCE \freq1_reg[1] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[129] ),
        .Q(freq1[1]));
  FDCE \freq1_reg[20] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[148] ),
        .Q(freq1[20]));
  FDCE \freq1_reg[21] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[149] ),
        .Q(freq1[21]));
  FDCE \freq1_reg[22] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[150] ),
        .Q(freq1[22]));
  FDCE \freq1_reg[23] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[151] ),
        .Q(freq1[23]));
  FDCE \freq1_reg[24] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[152] ),
        .Q(freq1[24]));
  FDCE \freq1_reg[25] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[153] ),
        .Q(freq1[25]));
  FDCE \freq1_reg[26] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[154] ),
        .Q(freq1[26]));
  FDCE \freq1_reg[27] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[155] ),
        .Q(freq1[27]));
  FDCE \freq1_reg[28] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[156] ),
        .Q(freq1[28]));
  FDCE \freq1_reg[29] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[157] ),
        .Q(freq1[29]));
  FDCE \freq1_reg[2] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[130] ),
        .Q(freq1[2]));
  FDCE \freq1_reg[30] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[158] ),
        .Q(freq1[30]));
  FDCE \freq1_reg[31] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[159] ),
        .Q(freq1[31]));
  FDCE \freq1_reg[3] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[131] ),
        .Q(freq1[3]));
  FDCE \freq1_reg[4] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[132] ),
        .Q(freq1[4]));
  FDCE \freq1_reg[5] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[133] ),
        .Q(freq1[5]));
  FDCE \freq1_reg[6] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[134] ),
        .Q(freq1[6]));
  FDCE \freq1_reg[7] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[135] ),
        .Q(freq1[7]));
  FDCE \freq1_reg[8] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[136] ),
        .Q(freq1[8]));
  FDCE \freq1_reg[9] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[137] ),
        .Q(freq1[9]));
  FDCE \freq2_reg[0] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[32] ),
        .Q(freq2[0]));
  FDCE \freq2_reg[10] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[42] ),
        .Q(freq2[10]));
  FDCE \freq2_reg[11] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[43] ),
        .Q(freq2[11]));
  FDCE \freq2_reg[12] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[44] ),
        .Q(freq2[12]));
  FDCE \freq2_reg[13] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[45] ),
        .Q(freq2[13]));
  FDCE \freq2_reg[14] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[46] ),
        .Q(freq2[14]));
  FDCE \freq2_reg[15] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[47] ),
        .Q(freq2[15]));
  FDCE \freq2_reg[16] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[48] ),
        .Q(freq2[16]));
  FDCE \freq2_reg[17] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[49] ),
        .Q(freq2[17]));
  FDCE \freq2_reg[18] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[50] ),
        .Q(freq2[18]));
  FDCE \freq2_reg[19] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[51] ),
        .Q(freq2[19]));
  FDCE \freq2_reg[1] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[33] ),
        .Q(freq2[1]));
  FDCE \freq2_reg[20] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[52] ),
        .Q(freq2[20]));
  FDCE \freq2_reg[21] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[53] ),
        .Q(freq2[21]));
  FDCE \freq2_reg[22] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[54] ),
        .Q(freq2[22]));
  FDCE \freq2_reg[23] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[55] ),
        .Q(freq2[23]));
  FDCE \freq2_reg[24] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[56] ),
        .Q(freq2[24]));
  FDCE \freq2_reg[25] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[57] ),
        .Q(freq2[25]));
  FDCE \freq2_reg[26] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[58] ),
        .Q(freq2[26]));
  FDCE \freq2_reg[27] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[59] ),
        .Q(freq2[27]));
  FDCE \freq2_reg[28] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[60] ),
        .Q(freq2[28]));
  FDCE \freq2_reg[29] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[61] ),
        .Q(freq2[29]));
  FDCE \freq2_reg[2] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[34] ),
        .Q(freq2[2]));
  FDCE \freq2_reg[30] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[62] ),
        .Q(freq2[30]));
  FDCE \freq2_reg[31] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[63] ),
        .Q(freq2[31]));
  FDCE \freq2_reg[3] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[35] ),
        .Q(freq2[3]));
  FDCE \freq2_reg[4] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[36] ),
        .Q(freq2[4]));
  FDCE \freq2_reg[5] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[37] ),
        .Q(freq2[5]));
  FDCE \freq2_reg[6] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[38] ),
        .Q(freq2[6]));
  FDCE \freq2_reg[7] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[39] ),
        .Q(freq2[7]));
  FDCE \freq2_reg[8] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[40] ),
        .Q(freq2[8]));
  FDCE \freq2_reg[9] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[41] ),
        .Q(freq2[9]));
  FDCE \phase1_reg[0] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[96] ),
        .Q(phase1[0]));
  FDCE \phase1_reg[10] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[106] ),
        .Q(phase1[10]));
  FDCE \phase1_reg[11] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[107] ),
        .Q(phase1[11]));
  FDCE \phase1_reg[12] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[108] ),
        .Q(phase1[12]));
  FDCE \phase1_reg[13] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[109] ),
        .Q(phase1[13]));
  FDCE \phase1_reg[14] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[110] ),
        .Q(phase1[14]));
  FDCE \phase1_reg[15] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[111] ),
        .Q(phase1[15]));
  FDCE \phase1_reg[16] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[112] ),
        .Q(phase1[16]));
  FDCE \phase1_reg[17] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[113] ),
        .Q(phase1[17]));
  FDCE \phase1_reg[18] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[114] ),
        .Q(phase1[18]));
  FDCE \phase1_reg[19] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[115] ),
        .Q(phase1[19]));
  FDCE \phase1_reg[1] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[97] ),
        .Q(phase1[1]));
  FDCE \phase1_reg[20] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[116] ),
        .Q(phase1[20]));
  FDCE \phase1_reg[21] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[117] ),
        .Q(phase1[21]));
  FDCE \phase1_reg[22] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[118] ),
        .Q(phase1[22]));
  FDCE \phase1_reg[23] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[119] ),
        .Q(phase1[23]));
  FDCE \phase1_reg[24] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[120] ),
        .Q(phase1[24]));
  FDCE \phase1_reg[25] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[121] ),
        .Q(phase1[25]));
  FDCE \phase1_reg[26] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[122] ),
        .Q(phase1[26]));
  FDCE \phase1_reg[27] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[123] ),
        .Q(phase1[27]));
  FDCE \phase1_reg[28] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[124] ),
        .Q(phase1[28]));
  FDCE \phase1_reg[29] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[125] ),
        .Q(phase1[29]));
  FDCE \phase1_reg[2] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[98] ),
        .Q(phase1[2]));
  FDCE \phase1_reg[30] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[126] ),
        .Q(phase1[30]));
  FDCE \phase1_reg[31] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[127] ),
        .Q(phase1[31]));
  FDCE \phase1_reg[3] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[99] ),
        .Q(phase1[3]));
  FDCE \phase1_reg[4] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[100] ),
        .Q(phase1[4]));
  FDCE \phase1_reg[5] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[101] ),
        .Q(phase1[5]));
  FDCE \phase1_reg[6] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[102] ),
        .Q(phase1[6]));
  FDCE \phase1_reg[7] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[103] ),
        .Q(phase1[7]));
  FDCE \phase1_reg[8] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[104] ),
        .Q(phase1[8]));
  FDCE \phase1_reg[9] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[105] ),
        .Q(phase1[9]));
  FDCE \phase2_reg[0] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[0] ),
        .Q(phase2[0]));
  FDCE \phase2_reg[10] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[10] ),
        .Q(phase2[10]));
  FDCE \phase2_reg[11] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[11] ),
        .Q(phase2[11]));
  FDCE \phase2_reg[12] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[12] ),
        .Q(phase2[12]));
  FDCE \phase2_reg[13] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[13] ),
        .Q(phase2[13]));
  FDCE \phase2_reg[14] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[14] ),
        .Q(phase2[14]));
  FDCE \phase2_reg[15] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[15] ),
        .Q(phase2[15]));
  FDCE \phase2_reg[16] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[16] ),
        .Q(phase2[16]));
  FDCE \phase2_reg[17] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[17] ),
        .Q(phase2[17]));
  FDCE \phase2_reg[18] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[18] ),
        .Q(phase2[18]));
  FDCE \phase2_reg[19] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[19] ),
        .Q(phase2[19]));
  FDCE \phase2_reg[1] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[1] ),
        .Q(phase2[1]));
  FDCE \phase2_reg[20] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[20] ),
        .Q(phase2[20]));
  FDCE \phase2_reg[21] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[21] ),
        .Q(phase2[21]));
  FDCE \phase2_reg[22] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[22] ),
        .Q(phase2[22]));
  FDCE \phase2_reg[23] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[23] ),
        .Q(phase2[23]));
  FDCE \phase2_reg[24] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[24] ),
        .Q(phase2[24]));
  FDCE \phase2_reg[25] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[25] ),
        .Q(phase2[25]));
  FDCE \phase2_reg[26] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[26] ),
        .Q(phase2[26]));
  FDCE \phase2_reg[27] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[27] ),
        .Q(phase2[27]));
  FDCE \phase2_reg[28] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[28] ),
        .Q(phase2[28]));
  FDCE \phase2_reg[29] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[29] ),
        .Q(phase2[29]));
  FDCE \phase2_reg[2] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[2] ),
        .Q(phase2[2]));
  FDCE \phase2_reg[30] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[30] ),
        .Q(phase2[30]));
  FDCE \phase2_reg[31] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[31] ),
        .Q(phase2[31]));
  FDCE \phase2_reg[3] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[3] ),
        .Q(phase2[3]));
  FDCE \phase2_reg[4] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[4] ),
        .Q(phase2[4]));
  FDCE \phase2_reg[5] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[5] ),
        .Q(phase2[5]));
  FDCE \phase2_reg[6] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[6] ),
        .Q(phase2[6]));
  FDCE \phase2_reg[7] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[7] ),
        .Q(phase2[7]));
  FDCE \phase2_reg[8] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[8] ),
        .Q(phase2[8]));
  FDCE \phase2_reg[9] 
       (.C(read_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(\receive_data_reg_n_0_[9] ),
        .Q(phase2[9]));
  FDCE read_done_reg
       (.C(spi_done),
        .CE(1'b1),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_244),
        .Q(read_done));
  FDCE \receive_data_reg[0] 
       (.C(spi_done),
        .CE(receive_data[15]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_239),
        .Q(\receive_data_reg_n_0_[0] ));
  FDCE \receive_data_reg[100] 
       (.C(spi_done),
        .CE(receive_data[111]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_139),
        .Q(\receive_data_reg_n_0_[100] ));
  FDCE \receive_data_reg[101] 
       (.C(spi_done),
        .CE(receive_data[111]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_138),
        .Q(\receive_data_reg_n_0_[101] ));
  FDCE \receive_data_reg[102] 
       (.C(spi_done),
        .CE(receive_data[111]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_137),
        .Q(\receive_data_reg_n_0_[102] ));
  FDCE \receive_data_reg[103] 
       (.C(spi_done),
        .CE(receive_data[111]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_136),
        .Q(\receive_data_reg_n_0_[103] ));
  FDCE \receive_data_reg[104] 
       (.C(spi_done),
        .CE(receive_data[111]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_135),
        .Q(\receive_data_reg_n_0_[104] ));
  FDCE \receive_data_reg[105] 
       (.C(spi_done),
        .CE(receive_data[111]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_134),
        .Q(\receive_data_reg_n_0_[105] ));
  FDCE \receive_data_reg[106] 
       (.C(spi_done),
        .CE(receive_data[111]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_133),
        .Q(\receive_data_reg_n_0_[106] ));
  FDCE \receive_data_reg[107] 
       (.C(spi_done),
        .CE(receive_data[111]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_132),
        .Q(\receive_data_reg_n_0_[107] ));
  FDCE \receive_data_reg[108] 
       (.C(spi_done),
        .CE(receive_data[111]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_131),
        .Q(\receive_data_reg_n_0_[108] ));
  FDCE \receive_data_reg[109] 
       (.C(spi_done),
        .CE(receive_data[111]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_130),
        .Q(\receive_data_reg_n_0_[109] ));
  FDCE \receive_data_reg[10] 
       (.C(spi_done),
        .CE(receive_data[15]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_229),
        .Q(\receive_data_reg_n_0_[10] ));
  FDCE \receive_data_reg[110] 
       (.C(spi_done),
        .CE(receive_data[111]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_129),
        .Q(\receive_data_reg_n_0_[110] ));
  FDCE \receive_data_reg[111] 
       (.C(spi_done),
        .CE(receive_data[111]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_128),
        .Q(\receive_data_reg_n_0_[111] ));
  FDCE \receive_data_reg[112] 
       (.C(spi_done),
        .CE(receive_data[127]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_127),
        .Q(\receive_data_reg_n_0_[112] ));
  FDCE \receive_data_reg[113] 
       (.C(spi_done),
        .CE(receive_data[127]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_126),
        .Q(\receive_data_reg_n_0_[113] ));
  FDCE \receive_data_reg[114] 
       (.C(spi_done),
        .CE(receive_data[127]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_125),
        .Q(\receive_data_reg_n_0_[114] ));
  FDCE \receive_data_reg[115] 
       (.C(spi_done),
        .CE(receive_data[127]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_124),
        .Q(\receive_data_reg_n_0_[115] ));
  FDCE \receive_data_reg[116] 
       (.C(spi_done),
        .CE(receive_data[127]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_123),
        .Q(\receive_data_reg_n_0_[116] ));
  FDCE \receive_data_reg[117] 
       (.C(spi_done),
        .CE(receive_data[127]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_122),
        .Q(\receive_data_reg_n_0_[117] ));
  FDCE \receive_data_reg[118] 
       (.C(spi_done),
        .CE(receive_data[127]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_121),
        .Q(\receive_data_reg_n_0_[118] ));
  FDCE \receive_data_reg[119] 
       (.C(spi_done),
        .CE(receive_data[127]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_120),
        .Q(\receive_data_reg_n_0_[119] ));
  FDCE \receive_data_reg[11] 
       (.C(spi_done),
        .CE(receive_data[15]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_228),
        .Q(\receive_data_reg_n_0_[11] ));
  FDCE \receive_data_reg[120] 
       (.C(spi_done),
        .CE(receive_data[127]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_119),
        .Q(\receive_data_reg_n_0_[120] ));
  FDCE \receive_data_reg[121] 
       (.C(spi_done),
        .CE(receive_data[127]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_118),
        .Q(\receive_data_reg_n_0_[121] ));
  FDCE \receive_data_reg[122] 
       (.C(spi_done),
        .CE(receive_data[127]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_117),
        .Q(\receive_data_reg_n_0_[122] ));
  FDCE \receive_data_reg[123] 
       (.C(spi_done),
        .CE(receive_data[127]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_116),
        .Q(\receive_data_reg_n_0_[123] ));
  FDCE \receive_data_reg[124] 
       (.C(spi_done),
        .CE(receive_data[127]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_115),
        .Q(\receive_data_reg_n_0_[124] ));
  FDCE \receive_data_reg[125] 
       (.C(spi_done),
        .CE(receive_data[127]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_114),
        .Q(\receive_data_reg_n_0_[125] ));
  FDCE \receive_data_reg[126] 
       (.C(spi_done),
        .CE(receive_data[127]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_113),
        .Q(\receive_data_reg_n_0_[126] ));
  FDCE \receive_data_reg[127] 
       (.C(spi_done),
        .CE(receive_data[127]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_112),
        .Q(\receive_data_reg_n_0_[127] ));
  FDCE \receive_data_reg[128] 
       (.C(spi_done),
        .CE(receive_data[143]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_111),
        .Q(\receive_data_reg_n_0_[128] ));
  FDCE \receive_data_reg[129] 
       (.C(spi_done),
        .CE(receive_data[143]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_110),
        .Q(\receive_data_reg_n_0_[129] ));
  FDCE \receive_data_reg[12] 
       (.C(spi_done),
        .CE(receive_data[15]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_227),
        .Q(\receive_data_reg_n_0_[12] ));
  FDCE \receive_data_reg[130] 
       (.C(spi_done),
        .CE(receive_data[143]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_109),
        .Q(\receive_data_reg_n_0_[130] ));
  FDCE \receive_data_reg[131] 
       (.C(spi_done),
        .CE(receive_data[143]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_108),
        .Q(\receive_data_reg_n_0_[131] ));
  FDCE \receive_data_reg[132] 
       (.C(spi_done),
        .CE(receive_data[143]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_107),
        .Q(\receive_data_reg_n_0_[132] ));
  FDCE \receive_data_reg[133] 
       (.C(spi_done),
        .CE(receive_data[143]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_106),
        .Q(\receive_data_reg_n_0_[133] ));
  FDCE \receive_data_reg[134] 
       (.C(spi_done),
        .CE(receive_data[143]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_105),
        .Q(\receive_data_reg_n_0_[134] ));
  FDCE \receive_data_reg[135] 
       (.C(spi_done),
        .CE(receive_data[143]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_104),
        .Q(\receive_data_reg_n_0_[135] ));
  FDCE \receive_data_reg[136] 
       (.C(spi_done),
        .CE(receive_data[143]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_103),
        .Q(\receive_data_reg_n_0_[136] ));
  FDCE \receive_data_reg[137] 
       (.C(spi_done),
        .CE(receive_data[143]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_102),
        .Q(\receive_data_reg_n_0_[137] ));
  FDCE \receive_data_reg[138] 
       (.C(spi_done),
        .CE(receive_data[143]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_101),
        .Q(\receive_data_reg_n_0_[138] ));
  FDCE \receive_data_reg[139] 
       (.C(spi_done),
        .CE(receive_data[143]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_100),
        .Q(\receive_data_reg_n_0_[139] ));
  FDCE \receive_data_reg[13] 
       (.C(spi_done),
        .CE(receive_data[15]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_226),
        .Q(\receive_data_reg_n_0_[13] ));
  FDCE \receive_data_reg[140] 
       (.C(spi_done),
        .CE(receive_data[143]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_99),
        .Q(\receive_data_reg_n_0_[140] ));
  FDCE \receive_data_reg[141] 
       (.C(spi_done),
        .CE(receive_data[143]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_98),
        .Q(\receive_data_reg_n_0_[141] ));
  FDCE \receive_data_reg[142] 
       (.C(spi_done),
        .CE(receive_data[143]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_97),
        .Q(\receive_data_reg_n_0_[142] ));
  FDCE \receive_data_reg[143] 
       (.C(spi_done),
        .CE(receive_data[143]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_96),
        .Q(\receive_data_reg_n_0_[143] ));
  FDCE \receive_data_reg[144] 
       (.C(spi_done),
        .CE(receive_data[159]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_95),
        .Q(\receive_data_reg_n_0_[144] ));
  FDCE \receive_data_reg[145] 
       (.C(spi_done),
        .CE(receive_data[159]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_94),
        .Q(\receive_data_reg_n_0_[145] ));
  FDCE \receive_data_reg[146] 
       (.C(spi_done),
        .CE(receive_data[159]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_93),
        .Q(\receive_data_reg_n_0_[146] ));
  FDCE \receive_data_reg[147] 
       (.C(spi_done),
        .CE(receive_data[159]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_92),
        .Q(\receive_data_reg_n_0_[147] ));
  FDCE \receive_data_reg[148] 
       (.C(spi_done),
        .CE(receive_data[159]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_91),
        .Q(\receive_data_reg_n_0_[148] ));
  FDCE \receive_data_reg[149] 
       (.C(spi_done),
        .CE(receive_data[159]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_90),
        .Q(\receive_data_reg_n_0_[149] ));
  FDCE \receive_data_reg[14] 
       (.C(spi_done),
        .CE(receive_data[15]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_225),
        .Q(\receive_data_reg_n_0_[14] ));
  FDCE \receive_data_reg[150] 
       (.C(spi_done),
        .CE(receive_data[159]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_89),
        .Q(\receive_data_reg_n_0_[150] ));
  FDCE \receive_data_reg[151] 
       (.C(spi_done),
        .CE(receive_data[159]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_88),
        .Q(\receive_data_reg_n_0_[151] ));
  FDCE \receive_data_reg[152] 
       (.C(spi_done),
        .CE(receive_data[159]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_87),
        .Q(\receive_data_reg_n_0_[152] ));
  FDCE \receive_data_reg[153] 
       (.C(spi_done),
        .CE(receive_data[159]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_86),
        .Q(\receive_data_reg_n_0_[153] ));
  FDCE \receive_data_reg[154] 
       (.C(spi_done),
        .CE(receive_data[159]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_85),
        .Q(\receive_data_reg_n_0_[154] ));
  FDCE \receive_data_reg[155] 
       (.C(spi_done),
        .CE(receive_data[159]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_84),
        .Q(\receive_data_reg_n_0_[155] ));
  FDCE \receive_data_reg[156] 
       (.C(spi_done),
        .CE(receive_data[159]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_83),
        .Q(\receive_data_reg_n_0_[156] ));
  FDCE \receive_data_reg[157] 
       (.C(spi_done),
        .CE(receive_data[159]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_82),
        .Q(\receive_data_reg_n_0_[157] ));
  FDCE \receive_data_reg[158] 
       (.C(spi_done),
        .CE(receive_data[159]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_81),
        .Q(\receive_data_reg_n_0_[158] ));
  FDCE \receive_data_reg[159] 
       (.C(spi_done),
        .CE(receive_data[159]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_80),
        .Q(\receive_data_reg_n_0_[159] ));
  FDCE \receive_data_reg[15] 
       (.C(spi_done),
        .CE(receive_data[15]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_224),
        .Q(\receive_data_reg_n_0_[15] ));
  FDCE \receive_data_reg[160] 
       (.C(spi_done),
        .CE(receive_data[175]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_79),
        .Q(\receive_data_reg_n_0_[160] ));
  FDCE \receive_data_reg[161] 
       (.C(spi_done),
        .CE(receive_data[175]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_78),
        .Q(\receive_data_reg_n_0_[161] ));
  FDCE \receive_data_reg[162] 
       (.C(spi_done),
        .CE(receive_data[175]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_77),
        .Q(\receive_data_reg_n_0_[162] ));
  FDCE \receive_data_reg[163] 
       (.C(spi_done),
        .CE(receive_data[175]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_76),
        .Q(\receive_data_reg_n_0_[163] ));
  FDCE \receive_data_reg[164] 
       (.C(spi_done),
        .CE(receive_data[175]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_75),
        .Q(\receive_data_reg_n_0_[164] ));
  FDCE \receive_data_reg[165] 
       (.C(spi_done),
        .CE(receive_data[175]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_74),
        .Q(\receive_data_reg_n_0_[165] ));
  FDCE \receive_data_reg[166] 
       (.C(spi_done),
        .CE(receive_data[175]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_73),
        .Q(\receive_data_reg_n_0_[166] ));
  FDCE \receive_data_reg[167] 
       (.C(spi_done),
        .CE(receive_data[175]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_72),
        .Q(\receive_data_reg_n_0_[167] ));
  FDCE \receive_data_reg[168] 
       (.C(spi_done),
        .CE(receive_data[175]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_71),
        .Q(\receive_data_reg_n_0_[168] ));
  FDCE \receive_data_reg[169] 
       (.C(spi_done),
        .CE(receive_data[175]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_70),
        .Q(\receive_data_reg_n_0_[169] ));
  FDCE \receive_data_reg[16] 
       (.C(spi_done),
        .CE(receive_data[31]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_223),
        .Q(\receive_data_reg_n_0_[16] ));
  FDCE \receive_data_reg[170] 
       (.C(spi_done),
        .CE(receive_data[175]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_69),
        .Q(\receive_data_reg_n_0_[170] ));
  FDCE \receive_data_reg[171] 
       (.C(spi_done),
        .CE(receive_data[175]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_68),
        .Q(\receive_data_reg_n_0_[171] ));
  FDCE \receive_data_reg[172] 
       (.C(spi_done),
        .CE(receive_data[175]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_67),
        .Q(\receive_data_reg_n_0_[172] ));
  FDCE \receive_data_reg[173] 
       (.C(spi_done),
        .CE(receive_data[175]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_66),
        .Q(\receive_data_reg_n_0_[173] ));
  FDCE \receive_data_reg[174] 
       (.C(spi_done),
        .CE(receive_data[175]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_65),
        .Q(\receive_data_reg_n_0_[174] ));
  FDCE \receive_data_reg[175] 
       (.C(spi_done),
        .CE(receive_data[175]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_64),
        .Q(\receive_data_reg_n_0_[175] ));
  FDCE \receive_data_reg[176] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_4),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_63),
        .Q(\receive_data_reg_n_0_[176] ));
  FDCE \receive_data_reg[177] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_4),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_62),
        .Q(\receive_data_reg_n_0_[177] ));
  FDCE \receive_data_reg[178] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_4),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_61),
        .Q(\receive_data_reg_n_0_[178] ));
  FDCE \receive_data_reg[179] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_4),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_60),
        .Q(\receive_data_reg_n_0_[179] ));
  FDCE \receive_data_reg[17] 
       (.C(spi_done),
        .CE(receive_data[31]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_222),
        .Q(\receive_data_reg_n_0_[17] ));
  FDCE \receive_data_reg[180] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_4),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_59),
        .Q(\receive_data_reg_n_0_[180] ));
  FDCE \receive_data_reg[181] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_4),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_58),
        .Q(\receive_data_reg_n_0_[181] ));
  FDCE \receive_data_reg[182] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_4),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_57),
        .Q(\receive_data_reg_n_0_[182] ));
  FDCE \receive_data_reg[183] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_4),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_56),
        .Q(\receive_data_reg_n_0_[183] ));
  FDCE \receive_data_reg[184] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_4),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_55),
        .Q(\receive_data_reg_n_0_[184] ));
  FDCE \receive_data_reg[185] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_4),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_54),
        .Q(\receive_data_reg_n_0_[185] ));
  FDCE \receive_data_reg[186] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_4),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_53),
        .Q(\receive_data_reg_n_0_[186] ));
  FDCE \receive_data_reg[187] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_4),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_52),
        .Q(\receive_data_reg_n_0_[187] ));
  FDCE \receive_data_reg[188] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_4),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_51),
        .Q(\receive_data_reg_n_0_[188] ));
  FDCE \receive_data_reg[189] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_4),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_50),
        .Q(\receive_data_reg_n_0_[189] ));
  FDCE \receive_data_reg[18] 
       (.C(spi_done),
        .CE(receive_data[31]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_221),
        .Q(\receive_data_reg_n_0_[18] ));
  FDCE \receive_data_reg[190] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_4),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_49),
        .Q(\receive_data_reg_n_0_[190] ));
  FDCE \receive_data_reg[191] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_4),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_48),
        .Q(\receive_data_reg_n_0_[191] ));
  FDCE \receive_data_reg[192] 
       (.C(spi_done),
        .CE(receive_data[207]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_47),
        .Q(\receive_data_reg_n_0_[192] ));
  FDCE \receive_data_reg[193] 
       (.C(spi_done),
        .CE(receive_data[207]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_46),
        .Q(\receive_data_reg_n_0_[193] ));
  FDCE \receive_data_reg[194] 
       (.C(spi_done),
        .CE(receive_data[207]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_45),
        .Q(\receive_data_reg_n_0_[194] ));
  FDCE \receive_data_reg[195] 
       (.C(spi_done),
        .CE(receive_data[207]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_44),
        .Q(\receive_data_reg_n_0_[195] ));
  FDCE \receive_data_reg[196] 
       (.C(spi_done),
        .CE(receive_data[207]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_43),
        .Q(\receive_data_reg_n_0_[196] ));
  FDCE \receive_data_reg[197] 
       (.C(spi_done),
        .CE(receive_data[207]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_42),
        .Q(\receive_data_reg_n_0_[197] ));
  FDCE \receive_data_reg[198] 
       (.C(spi_done),
        .CE(receive_data[207]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_41),
        .Q(\receive_data_reg_n_0_[198] ));
  FDCE \receive_data_reg[199] 
       (.C(spi_done),
        .CE(receive_data[207]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_40),
        .Q(\receive_data_reg_n_0_[199] ));
  FDCE \receive_data_reg[19] 
       (.C(spi_done),
        .CE(receive_data[31]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_220),
        .Q(\receive_data_reg_n_0_[19] ));
  FDCE \receive_data_reg[1] 
       (.C(spi_done),
        .CE(receive_data[15]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_238),
        .Q(\receive_data_reg_n_0_[1] ));
  FDCE \receive_data_reg[200] 
       (.C(spi_done),
        .CE(receive_data[207]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_39),
        .Q(\receive_data_reg_n_0_[200] ));
  FDCE \receive_data_reg[201] 
       (.C(spi_done),
        .CE(receive_data[207]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_38),
        .Q(\receive_data_reg_n_0_[201] ));
  FDCE \receive_data_reg[202] 
       (.C(spi_done),
        .CE(receive_data[207]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_37),
        .Q(\receive_data_reg_n_0_[202] ));
  FDCE \receive_data_reg[203] 
       (.C(spi_done),
        .CE(receive_data[207]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_36),
        .Q(\receive_data_reg_n_0_[203] ));
  FDCE \receive_data_reg[204] 
       (.C(spi_done),
        .CE(receive_data[207]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_35),
        .Q(\receive_data_reg_n_0_[204] ));
  FDCE \receive_data_reg[205] 
       (.C(spi_done),
        .CE(receive_data[207]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_34),
        .Q(\receive_data_reg_n_0_[205] ));
  FDCE \receive_data_reg[206] 
       (.C(spi_done),
        .CE(receive_data[207]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_33),
        .Q(\receive_data_reg_n_0_[206] ));
  FDCE \receive_data_reg[207] 
       (.C(spi_done),
        .CE(receive_data[207]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_32),
        .Q(\receive_data_reg_n_0_[207] ));
  FDCE \receive_data_reg[208] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_2),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_31),
        .Q(p_0_in[0]));
  FDCE \receive_data_reg[209] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_2),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_30),
        .Q(p_0_in[1]));
  FDCE \receive_data_reg[20] 
       (.C(spi_done),
        .CE(receive_data[31]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_219),
        .Q(\receive_data_reg_n_0_[20] ));
  FDCE \receive_data_reg[210] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_2),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_29),
        .Q(p_0_in[2]));
  FDCE \receive_data_reg[211] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_2),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_28),
        .Q(p_0_in[3]));
  FDCE \receive_data_reg[212] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_2),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_27),
        .Q(p_0_in[4]));
  FDCE \receive_data_reg[213] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_2),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_26),
        .Q(p_0_in[5]));
  FDCE \receive_data_reg[214] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_2),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_25),
        .Q(p_0_in[6]));
  FDCE \receive_data_reg[215] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_2),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_24),
        .Q(p_0_in[7]));
  FDCE \receive_data_reg[216] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_2),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_23),
        .Q(p_0_in[8]));
  FDCE \receive_data_reg[217] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_2),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_22),
        .Q(p_0_in[9]));
  FDCE \receive_data_reg[218] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_2),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_21),
        .Q(p_0_in[10]));
  FDCE \receive_data_reg[219] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_2),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_20),
        .Q(p_0_in[11]));
  FDCE \receive_data_reg[21] 
       (.C(spi_done),
        .CE(receive_data[31]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_218),
        .Q(\receive_data_reg_n_0_[21] ));
  FDCE \receive_data_reg[220] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_2),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_19),
        .Q(p_0_in[12]));
  FDCE \receive_data_reg[221] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_2),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_18),
        .Q(p_0_in[13]));
  FDCE \receive_data_reg[222] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_2),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_17),
        .Q(p_0_in[14]));
  FDCE \receive_data_reg[223] 
       (.C(spi_done),
        .CE(u_spi_stm32_n_2),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_16),
        .Q(p_0_in[15]));
  FDCE \receive_data_reg[22] 
       (.C(spi_done),
        .CE(receive_data[31]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_217),
        .Q(\receive_data_reg_n_0_[22] ));
  FDCE \receive_data_reg[23] 
       (.C(spi_done),
        .CE(receive_data[31]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_216),
        .Q(\receive_data_reg_n_0_[23] ));
  FDCE \receive_data_reg[24] 
       (.C(spi_done),
        .CE(receive_data[31]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_215),
        .Q(\receive_data_reg_n_0_[24] ));
  FDCE \receive_data_reg[25] 
       (.C(spi_done),
        .CE(receive_data[31]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_214),
        .Q(\receive_data_reg_n_0_[25] ));
  FDCE \receive_data_reg[26] 
       (.C(spi_done),
        .CE(receive_data[31]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_213),
        .Q(\receive_data_reg_n_0_[26] ));
  FDCE \receive_data_reg[27] 
       (.C(spi_done),
        .CE(receive_data[31]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_212),
        .Q(\receive_data_reg_n_0_[27] ));
  FDCE \receive_data_reg[28] 
       (.C(spi_done),
        .CE(receive_data[31]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_211),
        .Q(\receive_data_reg_n_0_[28] ));
  FDCE \receive_data_reg[29] 
       (.C(spi_done),
        .CE(receive_data[31]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_210),
        .Q(\receive_data_reg_n_0_[29] ));
  FDCE \receive_data_reg[2] 
       (.C(spi_done),
        .CE(receive_data[15]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_237),
        .Q(\receive_data_reg_n_0_[2] ));
  FDCE \receive_data_reg[30] 
       (.C(spi_done),
        .CE(receive_data[31]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_209),
        .Q(\receive_data_reg_n_0_[30] ));
  FDCE \receive_data_reg[31] 
       (.C(spi_done),
        .CE(receive_data[31]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_208),
        .Q(\receive_data_reg_n_0_[31] ));
  FDCE \receive_data_reg[32] 
       (.C(spi_done),
        .CE(receive_data[47]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_207),
        .Q(\receive_data_reg_n_0_[32] ));
  FDCE \receive_data_reg[33] 
       (.C(spi_done),
        .CE(receive_data[47]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_206),
        .Q(\receive_data_reg_n_0_[33] ));
  FDCE \receive_data_reg[34] 
       (.C(spi_done),
        .CE(receive_data[47]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_205),
        .Q(\receive_data_reg_n_0_[34] ));
  FDCE \receive_data_reg[35] 
       (.C(spi_done),
        .CE(receive_data[47]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_204),
        .Q(\receive_data_reg_n_0_[35] ));
  FDCE \receive_data_reg[36] 
       (.C(spi_done),
        .CE(receive_data[47]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_203),
        .Q(\receive_data_reg_n_0_[36] ));
  FDCE \receive_data_reg[37] 
       (.C(spi_done),
        .CE(receive_data[47]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_202),
        .Q(\receive_data_reg_n_0_[37] ));
  FDCE \receive_data_reg[38] 
       (.C(spi_done),
        .CE(receive_data[47]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_201),
        .Q(\receive_data_reg_n_0_[38] ));
  FDCE \receive_data_reg[39] 
       (.C(spi_done),
        .CE(receive_data[47]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_200),
        .Q(\receive_data_reg_n_0_[39] ));
  FDCE \receive_data_reg[3] 
       (.C(spi_done),
        .CE(receive_data[15]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_236),
        .Q(\receive_data_reg_n_0_[3] ));
  FDCE \receive_data_reg[40] 
       (.C(spi_done),
        .CE(receive_data[47]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_199),
        .Q(\receive_data_reg_n_0_[40] ));
  FDCE \receive_data_reg[41] 
       (.C(spi_done),
        .CE(receive_data[47]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_198),
        .Q(\receive_data_reg_n_0_[41] ));
  FDCE \receive_data_reg[42] 
       (.C(spi_done),
        .CE(receive_data[47]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_197),
        .Q(\receive_data_reg_n_0_[42] ));
  FDCE \receive_data_reg[43] 
       (.C(spi_done),
        .CE(receive_data[47]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_196),
        .Q(\receive_data_reg_n_0_[43] ));
  FDCE \receive_data_reg[44] 
       (.C(spi_done),
        .CE(receive_data[47]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_195),
        .Q(\receive_data_reg_n_0_[44] ));
  FDCE \receive_data_reg[45] 
       (.C(spi_done),
        .CE(receive_data[47]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_194),
        .Q(\receive_data_reg_n_0_[45] ));
  FDCE \receive_data_reg[46] 
       (.C(spi_done),
        .CE(receive_data[47]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_193),
        .Q(\receive_data_reg_n_0_[46] ));
  FDCE \receive_data_reg[47] 
       (.C(spi_done),
        .CE(receive_data[47]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_192),
        .Q(\receive_data_reg_n_0_[47] ));
  FDCE \receive_data_reg[48] 
       (.C(spi_done),
        .CE(receive_data[63]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_191),
        .Q(\receive_data_reg_n_0_[48] ));
  FDCE \receive_data_reg[49] 
       (.C(spi_done),
        .CE(receive_data[63]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_190),
        .Q(\receive_data_reg_n_0_[49] ));
  FDCE \receive_data_reg[4] 
       (.C(spi_done),
        .CE(receive_data[15]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_235),
        .Q(\receive_data_reg_n_0_[4] ));
  FDCE \receive_data_reg[50] 
       (.C(spi_done),
        .CE(receive_data[63]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_189),
        .Q(\receive_data_reg_n_0_[50] ));
  FDCE \receive_data_reg[51] 
       (.C(spi_done),
        .CE(receive_data[63]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_188),
        .Q(\receive_data_reg_n_0_[51] ));
  FDCE \receive_data_reg[52] 
       (.C(spi_done),
        .CE(receive_data[63]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_187),
        .Q(\receive_data_reg_n_0_[52] ));
  FDCE \receive_data_reg[53] 
       (.C(spi_done),
        .CE(receive_data[63]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_186),
        .Q(\receive_data_reg_n_0_[53] ));
  FDCE \receive_data_reg[54] 
       (.C(spi_done),
        .CE(receive_data[63]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_185),
        .Q(\receive_data_reg_n_0_[54] ));
  FDCE \receive_data_reg[55] 
       (.C(spi_done),
        .CE(receive_data[63]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_184),
        .Q(\receive_data_reg_n_0_[55] ));
  FDCE \receive_data_reg[56] 
       (.C(spi_done),
        .CE(receive_data[63]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_183),
        .Q(\receive_data_reg_n_0_[56] ));
  FDCE \receive_data_reg[57] 
       (.C(spi_done),
        .CE(receive_data[63]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_182),
        .Q(\receive_data_reg_n_0_[57] ));
  FDCE \receive_data_reg[58] 
       (.C(spi_done),
        .CE(receive_data[63]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_181),
        .Q(\receive_data_reg_n_0_[58] ));
  FDCE \receive_data_reg[59] 
       (.C(spi_done),
        .CE(receive_data[63]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_180),
        .Q(\receive_data_reg_n_0_[59] ));
  FDCE \receive_data_reg[5] 
       (.C(spi_done),
        .CE(receive_data[15]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_234),
        .Q(\receive_data_reg_n_0_[5] ));
  FDCE \receive_data_reg[60] 
       (.C(spi_done),
        .CE(receive_data[63]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_179),
        .Q(\receive_data_reg_n_0_[60] ));
  FDCE \receive_data_reg[61] 
       (.C(spi_done),
        .CE(receive_data[63]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_178),
        .Q(\receive_data_reg_n_0_[61] ));
  FDCE \receive_data_reg[62] 
       (.C(spi_done),
        .CE(receive_data[63]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_177),
        .Q(\receive_data_reg_n_0_[62] ));
  FDCE \receive_data_reg[63] 
       (.C(spi_done),
        .CE(receive_data[63]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_176),
        .Q(\receive_data_reg_n_0_[63] ));
  FDCE \receive_data_reg[64] 
       (.C(spi_done),
        .CE(receive_data[79]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_175),
        .Q(\receive_data_reg_n_0_[64] ));
  FDCE \receive_data_reg[65] 
       (.C(spi_done),
        .CE(receive_data[79]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_174),
        .Q(\receive_data_reg_n_0_[65] ));
  FDCE \receive_data_reg[66] 
       (.C(spi_done),
        .CE(receive_data[79]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_173),
        .Q(\receive_data_reg_n_0_[66] ));
  FDCE \receive_data_reg[67] 
       (.C(spi_done),
        .CE(receive_data[79]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_172),
        .Q(\receive_data_reg_n_0_[67] ));
  FDCE \receive_data_reg[68] 
       (.C(spi_done),
        .CE(receive_data[79]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_171),
        .Q(\receive_data_reg_n_0_[68] ));
  FDCE \receive_data_reg[69] 
       (.C(spi_done),
        .CE(receive_data[79]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_170),
        .Q(\receive_data_reg_n_0_[69] ));
  FDCE \receive_data_reg[6] 
       (.C(spi_done),
        .CE(receive_data[15]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_233),
        .Q(\receive_data_reg_n_0_[6] ));
  FDCE \receive_data_reg[70] 
       (.C(spi_done),
        .CE(receive_data[79]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_169),
        .Q(\receive_data_reg_n_0_[70] ));
  FDCE \receive_data_reg[71] 
       (.C(spi_done),
        .CE(receive_data[79]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_168),
        .Q(\receive_data_reg_n_0_[71] ));
  FDCE \receive_data_reg[72] 
       (.C(spi_done),
        .CE(receive_data[79]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_167),
        .Q(\receive_data_reg_n_0_[72] ));
  FDCE \receive_data_reg[73] 
       (.C(spi_done),
        .CE(receive_data[79]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_166),
        .Q(\receive_data_reg_n_0_[73] ));
  FDCE \receive_data_reg[74] 
       (.C(spi_done),
        .CE(receive_data[79]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_165),
        .Q(\receive_data_reg_n_0_[74] ));
  FDCE \receive_data_reg[75] 
       (.C(spi_done),
        .CE(receive_data[79]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_164),
        .Q(\receive_data_reg_n_0_[75] ));
  FDCE \receive_data_reg[76] 
       (.C(spi_done),
        .CE(receive_data[79]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_163),
        .Q(\receive_data_reg_n_0_[76] ));
  FDCE \receive_data_reg[77] 
       (.C(spi_done),
        .CE(receive_data[79]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_162),
        .Q(\receive_data_reg_n_0_[77] ));
  FDCE \receive_data_reg[78] 
       (.C(spi_done),
        .CE(receive_data[79]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_161),
        .Q(\receive_data_reg_n_0_[78] ));
  FDCE \receive_data_reg[79] 
       (.C(spi_done),
        .CE(receive_data[79]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_160),
        .Q(\receive_data_reg_n_0_[79] ));
  FDCE \receive_data_reg[7] 
       (.C(spi_done),
        .CE(receive_data[15]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_232),
        .Q(\receive_data_reg_n_0_[7] ));
  FDCE \receive_data_reg[80] 
       (.C(spi_done),
        .CE(receive_data[95]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_159),
        .Q(\receive_data_reg_n_0_[80] ));
  FDCE \receive_data_reg[81] 
       (.C(spi_done),
        .CE(receive_data[95]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_158),
        .Q(\receive_data_reg_n_0_[81] ));
  FDCE \receive_data_reg[82] 
       (.C(spi_done),
        .CE(receive_data[95]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_157),
        .Q(\receive_data_reg_n_0_[82] ));
  FDCE \receive_data_reg[83] 
       (.C(spi_done),
        .CE(receive_data[95]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_156),
        .Q(\receive_data_reg_n_0_[83] ));
  FDCE \receive_data_reg[84] 
       (.C(spi_done),
        .CE(receive_data[95]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_155),
        .Q(\receive_data_reg_n_0_[84] ));
  FDCE \receive_data_reg[85] 
       (.C(spi_done),
        .CE(receive_data[95]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_154),
        .Q(\receive_data_reg_n_0_[85] ));
  FDCE \receive_data_reg[86] 
       (.C(spi_done),
        .CE(receive_data[95]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_153),
        .Q(\receive_data_reg_n_0_[86] ));
  FDCE \receive_data_reg[87] 
       (.C(spi_done),
        .CE(receive_data[95]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_152),
        .Q(\receive_data_reg_n_0_[87] ));
  FDCE \receive_data_reg[88] 
       (.C(spi_done),
        .CE(receive_data[95]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_151),
        .Q(\receive_data_reg_n_0_[88] ));
  FDCE \receive_data_reg[89] 
       (.C(spi_done),
        .CE(receive_data[95]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_150),
        .Q(\receive_data_reg_n_0_[89] ));
  FDCE \receive_data_reg[8] 
       (.C(spi_done),
        .CE(receive_data[15]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_231),
        .Q(\receive_data_reg_n_0_[8] ));
  FDCE \receive_data_reg[90] 
       (.C(spi_done),
        .CE(receive_data[95]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_149),
        .Q(\receive_data_reg_n_0_[90] ));
  FDCE \receive_data_reg[91] 
       (.C(spi_done),
        .CE(receive_data[95]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_148),
        .Q(\receive_data_reg_n_0_[91] ));
  FDCE \receive_data_reg[92] 
       (.C(spi_done),
        .CE(receive_data[95]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_147),
        .Q(\receive_data_reg_n_0_[92] ));
  FDCE \receive_data_reg[93] 
       (.C(spi_done),
        .CE(receive_data[95]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_146),
        .Q(\receive_data_reg_n_0_[93] ));
  FDCE \receive_data_reg[94] 
       (.C(spi_done),
        .CE(receive_data[95]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_145),
        .Q(\receive_data_reg_n_0_[94] ));
  FDCE \receive_data_reg[95] 
       (.C(spi_done),
        .CE(receive_data[95]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_144),
        .Q(\receive_data_reg_n_0_[95] ));
  FDCE \receive_data_reg[96] 
       (.C(spi_done),
        .CE(receive_data[111]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_143),
        .Q(\receive_data_reg_n_0_[96] ));
  FDCE \receive_data_reg[97] 
       (.C(spi_done),
        .CE(receive_data[111]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_142),
        .Q(\receive_data_reg_n_0_[97] ));
  FDCE \receive_data_reg[98] 
       (.C(spi_done),
        .CE(receive_data[111]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_141),
        .Q(\receive_data_reg_n_0_[98] ));
  FDCE \receive_data_reg[99] 
       (.C(spi_done),
        .CE(receive_data[111]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_140),
        .Q(\receive_data_reg_n_0_[99] ));
  FDCE \receive_data_reg[9] 
       (.C(spi_done),
        .CE(receive_data[15]),
        .CLR(u_spi_stm32_n_0),
        .D(u_spi_stm32_n_230),
        .Q(\receive_data_reg_n_0_[9] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_spi_stm32 u_spi_stm32
       (.CLK(read_done),
        .D({u_spi_stm32_n_16,u_spi_stm32_n_17,u_spi_stm32_n_18,u_spi_stm32_n_19,u_spi_stm32_n_20,u_spi_stm32_n_21,u_spi_stm32_n_22,u_spi_stm32_n_23,u_spi_stm32_n_24,u_spi_stm32_n_25,u_spi_stm32_n_26,u_spi_stm32_n_27,u_spi_stm32_n_28,u_spi_stm32_n_29,u_spi_stm32_n_30,u_spi_stm32_n_31,u_spi_stm32_n_32,u_spi_stm32_n_33,u_spi_stm32_n_34,u_spi_stm32_n_35,u_spi_stm32_n_36,u_spi_stm32_n_37,u_spi_stm32_n_38,u_spi_stm32_n_39,u_spi_stm32_n_40,u_spi_stm32_n_41,u_spi_stm32_n_42,u_spi_stm32_n_43,u_spi_stm32_n_44,u_spi_stm32_n_45,u_spi_stm32_n_46,u_spi_stm32_n_47,u_spi_stm32_n_48,u_spi_stm32_n_49,u_spi_stm32_n_50,u_spi_stm32_n_51,u_spi_stm32_n_52,u_spi_stm32_n_53,u_spi_stm32_n_54,u_spi_stm32_n_55,u_spi_stm32_n_56,u_spi_stm32_n_57,u_spi_stm32_n_58,u_spi_stm32_n_59,u_spi_stm32_n_60,u_spi_stm32_n_61,u_spi_stm32_n_62,u_spi_stm32_n_63,u_spi_stm32_n_64,u_spi_stm32_n_65,u_spi_stm32_n_66,u_spi_stm32_n_67,u_spi_stm32_n_68,u_spi_stm32_n_69,u_spi_stm32_n_70,u_spi_stm32_n_71,u_spi_stm32_n_72,u_spi_stm32_n_73,u_spi_stm32_n_74,u_spi_stm32_n_75,u_spi_stm32_n_76,u_spi_stm32_n_77,u_spi_stm32_n_78,u_spi_stm32_n_79,u_spi_stm32_n_80,u_spi_stm32_n_81,u_spi_stm32_n_82,u_spi_stm32_n_83,u_spi_stm32_n_84,u_spi_stm32_n_85,u_spi_stm32_n_86,u_spi_stm32_n_87,u_spi_stm32_n_88,u_spi_stm32_n_89,u_spi_stm32_n_90,u_spi_stm32_n_91,u_spi_stm32_n_92,u_spi_stm32_n_93,u_spi_stm32_n_94,u_spi_stm32_n_95,u_spi_stm32_n_96,u_spi_stm32_n_97,u_spi_stm32_n_98,u_spi_stm32_n_99,u_spi_stm32_n_100,u_spi_stm32_n_101,u_spi_stm32_n_102,u_spi_stm32_n_103,u_spi_stm32_n_104,u_spi_stm32_n_105,u_spi_stm32_n_106,u_spi_stm32_n_107,u_spi_stm32_n_108,u_spi_stm32_n_109,u_spi_stm32_n_110,u_spi_stm32_n_111,u_spi_stm32_n_112,u_spi_stm32_n_113,u_spi_stm32_n_114,u_spi_stm32_n_115,u_spi_stm32_n_116,u_spi_stm32_n_117,u_spi_stm32_n_118,u_spi_stm32_n_119,u_spi_stm32_n_120,u_spi_stm32_n_121,u_spi_stm32_n_122,u_spi_stm32_n_123,u_spi_stm32_n_124,u_spi_stm32_n_125,u_spi_stm32_n_126,u_spi_stm32_n_127,u_spi_stm32_n_128,u_spi_stm32_n_129,u_spi_stm32_n_130,u_spi_stm32_n_131,u_spi_stm32_n_132,u_spi_stm32_n_133,u_spi_stm32_n_134,u_spi_stm32_n_135,u_spi_stm32_n_136,u_spi_stm32_n_137,u_spi_stm32_n_138,u_spi_stm32_n_139,u_spi_stm32_n_140,u_spi_stm32_n_141,u_spi_stm32_n_142,u_spi_stm32_n_143,u_spi_stm32_n_144,u_spi_stm32_n_145,u_spi_stm32_n_146,u_spi_stm32_n_147,u_spi_stm32_n_148,u_spi_stm32_n_149,u_spi_stm32_n_150,u_spi_stm32_n_151,u_spi_stm32_n_152,u_spi_stm32_n_153,u_spi_stm32_n_154,u_spi_stm32_n_155,u_spi_stm32_n_156,u_spi_stm32_n_157,u_spi_stm32_n_158,u_spi_stm32_n_159,u_spi_stm32_n_160,u_spi_stm32_n_161,u_spi_stm32_n_162,u_spi_stm32_n_163,u_spi_stm32_n_164,u_spi_stm32_n_165,u_spi_stm32_n_166,u_spi_stm32_n_167,u_spi_stm32_n_168,u_spi_stm32_n_169,u_spi_stm32_n_170,u_spi_stm32_n_171,u_spi_stm32_n_172,u_spi_stm32_n_173,u_spi_stm32_n_174,u_spi_stm32_n_175,u_spi_stm32_n_176,u_spi_stm32_n_177,u_spi_stm32_n_178,u_spi_stm32_n_179,u_spi_stm32_n_180,u_spi_stm32_n_181,u_spi_stm32_n_182,u_spi_stm32_n_183,u_spi_stm32_n_184,u_spi_stm32_n_185,u_spi_stm32_n_186,u_spi_stm32_n_187,u_spi_stm32_n_188,u_spi_stm32_n_189,u_spi_stm32_n_190,u_spi_stm32_n_191,u_spi_stm32_n_192,u_spi_stm32_n_193,u_spi_stm32_n_194,u_spi_stm32_n_195,u_spi_stm32_n_196,u_spi_stm32_n_197,u_spi_stm32_n_198,u_spi_stm32_n_199,u_spi_stm32_n_200,u_spi_stm32_n_201,u_spi_stm32_n_202,u_spi_stm32_n_203,u_spi_stm32_n_204,u_spi_stm32_n_205,u_spi_stm32_n_206,u_spi_stm32_n_207,u_spi_stm32_n_208,u_spi_stm32_n_209,u_spi_stm32_n_210,u_spi_stm32_n_211,u_spi_stm32_n_212,u_spi_stm32_n_213,u_spi_stm32_n_214,u_spi_stm32_n_215,u_spi_stm32_n_216,u_spi_stm32_n_217,u_spi_stm32_n_218,u_spi_stm32_n_219,u_spi_stm32_n_220,u_spi_stm32_n_221,u_spi_stm32_n_222,u_spi_stm32_n_223,u_spi_stm32_n_224,u_spi_stm32_n_225,u_spi_stm32_n_226,u_spi_stm32_n_227,u_spi_stm32_n_228,u_spi_stm32_n_229,u_spi_stm32_n_230,u_spi_stm32_n_231,u_spi_stm32_n_232,u_spi_stm32_n_233,u_spi_stm32_n_234,u_spi_stm32_n_235,u_spi_stm32_n_236,u_spi_stm32_n_237,u_spi_stm32_n_238,u_spi_stm32_n_239}),
        .E({u_spi_stm32_n_2,receive_data[207],u_spi_stm32_n_4,receive_data[175],receive_data[159],receive_data[143],receive_data[127],receive_data[111],receive_data[95],receive_data[79],receive_data[63],receive_data[47],receive_data[31],receive_data[15]}),
        .\FSM_sequential_i_reg[0] (u_spi_stm32_n_241),
        .\FSM_sequential_i_reg[0]_0 (u_spi_stm32_n_242),
        .\FSM_sequential_i_reg[0]_1 (\FSM_sequential_i[4]_i_4_n_0 ),
        .\FSM_sequential_i_reg[0]_2 (\FSM_sequential_i[4]_i_7_n_0 ),
        .\FSM_sequential_i_reg[1] (u_spi_stm32_n_240),
        .\FSM_sequential_i_reg[3] (\FSM_sequential_i[1]_i_2_n_0 ),
        .\FSM_sequential_i_reg[3]_0 (\FSM_sequential_i[0]_i_4_n_0 ),
        .\FSM_sequential_i_reg[4] (u_spi_stm32_n_243),
        .clk(clk),
        .flag_done_reg_0(u_spi_stm32_n_0),
        .out(i),
        .read_done_reg(u_spi_stm32_n_244),
        .rst_n(rst_n),
        .spi_cs_n(spi_cs_n),
        .spi_done(spi_done),
        .spi_mosi(spi_mosi),
        .spi_sck(spi_sck));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_spi_stm32
   (flag_done_reg_0,
    spi_done,
    E,
    D,
    \FSM_sequential_i_reg[1] ,
    \FSM_sequential_i_reg[0] ,
    \FSM_sequential_i_reg[0]_0 ,
    \FSM_sequential_i_reg[4] ,
    read_done_reg,
    spi_cs_n,
    clk,
    spi_sck,
    out,
    rst_n,
    \FSM_sequential_i_reg[3] ,
    \FSM_sequential_i_reg[0]_1 ,
    \FSM_sequential_i_reg[0]_2 ,
    \FSM_sequential_i_reg[3]_0 ,
    CLK,
    spi_mosi);
  output flag_done_reg_0;
  output spi_done;
  output [13:0]E;
  output [223:0]D;
  output \FSM_sequential_i_reg[1] ;
  output \FSM_sequential_i_reg[0] ;
  output \FSM_sequential_i_reg[0]_0 ;
  output \FSM_sequential_i_reg[4] ;
  output read_done_reg;
  input spi_cs_n;
  input clk;
  input spi_sck;
  input [4:0]out;
  input rst_n;
  input \FSM_sequential_i_reg[3] ;
  input \FSM_sequential_i_reg[0]_1 ;
  input \FSM_sequential_i_reg[0]_2 ;
  input \FSM_sequential_i_reg[3]_0 ;
  input CLK;
  input spi_mosi;

  wire CLK;
  wire [223:0]D;
  wire [13:0]E;
  wire \FSM_sequential_i[0]_i_2_n_0 ;
  wire \FSM_sequential_i[0]_i_3_n_0 ;
  wire \FSM_sequential_i[1]_i_3_n_0 ;
  wire \FSM_sequential_i[1]_i_4_n_0 ;
  wire \FSM_sequential_i[1]_i_5_n_0 ;
  wire \FSM_sequential_i[4]_i_10_n_0 ;
  wire \FSM_sequential_i[4]_i_11_n_0 ;
  wire \FSM_sequential_i[4]_i_3_n_0 ;
  wire \FSM_sequential_i[4]_i_5_n_0 ;
  wire \FSM_sequential_i[4]_i_6_n_0 ;
  wire \FSM_sequential_i[4]_i_8_n_0 ;
  wire \FSM_sequential_i[4]_i_9_n_0 ;
  wire \FSM_sequential_i_reg[0] ;
  wire \FSM_sequential_i_reg[0]_0 ;
  wire \FSM_sequential_i_reg[0]_1 ;
  wire \FSM_sequential_i_reg[0]_2 ;
  wire \FSM_sequential_i_reg[1] ;
  wire \FSM_sequential_i_reg[3] ;
  wire \FSM_sequential_i_reg[3]_0 ;
  wire \FSM_sequential_i_reg[4] ;
  wire clk;
  wire cs_r1;
  wire cs_r2;
  wire flag_done_i_1_n_0;
  wire flag_done_reg_0;
  wire [4:0]out;
  wire read_done_i_2_n_0;
  wire read_done_i_3_n_0;
  wire read_done_i_4_n_0;
  wire read_done_reg;
  wire rst_n;
  wire \rxd_data[0]_i_1_n_0 ;
  wire \rxd_data[10]_i_1_n_0 ;
  wire \rxd_data[11]_i_1_n_0 ;
  wire \rxd_data[12]_i_1_n_0 ;
  wire \rxd_data[13]_i_1_n_0 ;
  wire \rxd_data[14]_i_1_n_0 ;
  wire \rxd_data[15]_i_1_n_0 ;
  wire \rxd_data[15]_i_2_n_0 ;
  wire \rxd_data[1]_i_1_n_0 ;
  wire \rxd_data[2]_i_1_n_0 ;
  wire \rxd_data[3]_i_1_n_0 ;
  wire \rxd_data[4]_i_1_n_0 ;
  wire \rxd_data[5]_i_1_n_0 ;
  wire \rxd_data[6]_i_1_n_0 ;
  wire \rxd_data[7]_i_1_n_0 ;
  wire \rxd_data[8]_i_1_n_0 ;
  wire \rxd_data[9]_i_1_n_0 ;
  wire sck_r1;
  wire sck_r2;
  wire spi_cs_n;
  wire [15:0]spi_data;
  wire spi_done;
  wire spi_mosi;
  wire spi_sck;

  LUT5 #(
    .INIT(32'h111F1111)) 
    \FSM_sequential_i[0]_i_1 
       (.I0(out[0]),
        .I1(out[4]),
        .I2(\FSM_sequential_i[4]_i_6_n_0 ),
        .I3(\FSM_sequential_i[0]_i_2_n_0 ),
        .I4(\FSM_sequential_i[4]_i_8_n_0 ),
        .O(\FSM_sequential_i_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEFFFFFFF)) 
    \FSM_sequential_i[0]_i_2 
       (.I0(\FSM_sequential_i[0]_i_3_n_0 ),
        .I1(spi_data[4]),
        .I2(spi_data[15]),
        .I3(spi_data[0]),
        .I4(spi_data[3]),
        .I5(\FSM_sequential_i_reg[3]_0 ),
        .O(\FSM_sequential_i[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \FSM_sequential_i[0]_i_3 
       (.I0(out[0]),
        .I1(spi_data[1]),
        .O(\FSM_sequential_i[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000005D005D0000)) 
    \FSM_sequential_i[1]_i_1 
       (.I0(\FSM_sequential_i_reg[3] ),
        .I1(\FSM_sequential_i[1]_i_3_n_0 ),
        .I2(\FSM_sequential_i[1]_i_4_n_0 ),
        .I3(out[4]),
        .I4(out[0]),
        .I5(out[1]),
        .O(\FSM_sequential_i_reg[1] ));
  LUT5 #(
    .INIT(32'h00000004)) 
    \FSM_sequential_i[1]_i_3 
       (.I0(spi_data[15]),
        .I1(spi_data[6]),
        .I2(spi_data[13]),
        .I3(spi_data[7]),
        .I4(\FSM_sequential_i[1]_i_5_n_0 ),
        .O(\FSM_sequential_i[1]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFEF)) 
    \FSM_sequential_i[1]_i_4 
       (.I0(\FSM_sequential_i[4]_i_11_n_0 ),
        .I1(spi_data[11]),
        .I2(spi_data[10]),
        .I3(spi_data[4]),
        .I4(spi_data[3]),
        .O(\FSM_sequential_i[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \FSM_sequential_i[1]_i_5 
       (.I0(spi_data[1]),
        .I1(spi_data[0]),
        .I2(spi_data[14]),
        .I3(spi_data[2]),
        .O(\FSM_sequential_i[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000FFFF0505FFFE)) 
    \FSM_sequential_i[4]_i_1 
       (.I0(out[3]),
        .I1(\FSM_sequential_i[4]_i_3_n_0 ),
        .I2(out[1]),
        .I3(out[0]),
        .I4(out[4]),
        .I5(out[2]),
        .O(\FSM_sequential_i_reg[0] ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \FSM_sequential_i[4]_i_10 
       (.I0(spi_data[5]),
        .I1(spi_data[6]),
        .I2(spi_data[3]),
        .I3(spi_data[4]),
        .I4(spi_data[7]),
        .I5(spi_data[8]),
        .O(\FSM_sequential_i[4]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'hFFDF)) 
    \FSM_sequential_i[4]_i_11 
       (.I0(spi_data[5]),
        .I1(spi_data[12]),
        .I2(spi_data[8]),
        .I3(spi_data[9]),
        .O(\FSM_sequential_i[4]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h1111111F11111111)) 
    \FSM_sequential_i[4]_i_2 
       (.I0(\FSM_sequential_i_reg[0]_1 ),
        .I1(out[4]),
        .I2(\FSM_sequential_i[4]_i_5_n_0 ),
        .I3(\FSM_sequential_i[4]_i_6_n_0 ),
        .I4(\FSM_sequential_i_reg[0]_2 ),
        .I5(\FSM_sequential_i[4]_i_8_n_0 ),
        .O(\FSM_sequential_i_reg[4] ));
  LUT6 #(
    .INIT(64'h0020000000000000)) 
    \FSM_sequential_i[4]_i_3 
       (.I0(\FSM_sequential_i[4]_i_9_n_0 ),
        .I1(spi_data[15]),
        .I2(spi_data[0]),
        .I3(spi_data[2]),
        .I4(spi_data[1]),
        .I5(\FSM_sequential_i[4]_i_10_n_0 ),
        .O(\FSM_sequential_i[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hDFFFFFFFFFFFFFFF)) 
    \FSM_sequential_i[4]_i_5 
       (.I0(spi_data[15]),
        .I1(spi_data[4]),
        .I2(out[4]),
        .I3(spi_data[3]),
        .I4(spi_data[0]),
        .I5(spi_data[1]),
        .O(\FSM_sequential_i[4]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_i[4]_i_6 
       (.I0(spi_data[6]),
        .I1(out[1]),
        .I2(spi_data[13]),
        .I3(spi_data[14]),
        .O(\FSM_sequential_i[4]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00000040)) 
    \FSM_sequential_i[4]_i_8 
       (.I0(spi_data[10]),
        .I1(spi_data[7]),
        .I2(spi_data[11]),
        .I3(spi_data[2]),
        .I4(\FSM_sequential_i[4]_i_11_n_0 ),
        .O(\FSM_sequential_i[4]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \FSM_sequential_i[4]_i_9 
       (.I0(spi_data[11]),
        .I1(spi_data[12]),
        .I2(spi_data[9]),
        .I3(spi_data[10]),
        .I4(spi_data[14]),
        .I5(spi_data[13]),
        .O(\FSM_sequential_i[4]_i_9_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \ch1_wave[15]_i_1 
       (.I0(rst_n),
        .O(flag_done_reg_0));
  FDCE cs_r1_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(flag_done_reg_0),
        .D(spi_cs_n),
        .Q(cs_r1));
  FDCE cs_r2_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(flag_done_reg_0),
        .D(cs_r1),
        .Q(cs_r2));
  LUT2 #(
    .INIT(4'h2)) 
    flag_done_i_1
       (.I0(cs_r1),
        .I1(cs_r2),
        .O(flag_done_i_1_n_0));
  FDCE flag_done_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(flag_done_reg_0),
        .D(flag_done_i_1_n_0),
        .Q(spi_done));
  LUT6 #(
    .INIT(64'hFFF7FFF7A0000000)) 
    read_done_i_1
       (.I0(\FSM_sequential_i_reg[3] ),
        .I1(\FSM_sequential_i[4]_i_3_n_0 ),
        .I2(out[4]),
        .I3(out[0]),
        .I4(read_done_i_2_n_0),
        .I5(CLK),
        .O(read_done_reg));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    read_done_i_2
       (.I0(read_done_i_3_n_0),
        .I1(spi_data[0]),
        .I2(spi_data[15]),
        .I3(spi_data[2]),
        .I4(spi_data[1]),
        .I5(read_done_i_4_n_0),
        .O(read_done_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    read_done_i_3
       (.I0(spi_data[11]),
        .I1(spi_data[12]),
        .I2(spi_data[10]),
        .I3(spi_data[9]),
        .I4(spi_data[13]),
        .I5(spi_data[14]),
        .O(read_done_i_3_n_0));
  LUT6 #(
    .INIT(64'h0080000000000000)) 
    read_done_i_4
       (.I0(spi_data[5]),
        .I1(spi_data[6]),
        .I2(spi_data[3]),
        .I3(spi_data[4]),
        .I4(spi_data[8]),
        .I5(spi_data[7]),
        .O(read_done_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \receive_data[0]_i_1 
       (.I0(spi_data[0]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[100]_i_1 
       (.I0(out[3]),
        .I1(spi_data[4]),
        .I2(out[0]),
        .O(D[100]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[101]_i_1 
       (.I0(out[3]),
        .I1(spi_data[5]),
        .I2(out[0]),
        .O(D[101]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[102]_i_1 
       (.I0(out[3]),
        .I1(spi_data[6]),
        .I2(out[0]),
        .O(D[102]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[103]_i_1 
       (.I0(out[3]),
        .I1(spi_data[7]),
        .I2(out[0]),
        .O(D[103]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[104]_i_1 
       (.I0(out[3]),
        .I1(spi_data[8]),
        .I2(out[0]),
        .O(D[104]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[105]_i_1 
       (.I0(out[3]),
        .I1(spi_data[9]),
        .I2(out[0]),
        .O(D[105]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[106]_i_1 
       (.I0(out[3]),
        .I1(spi_data[10]),
        .I2(out[0]),
        .O(D[106]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[107]_i_1 
       (.I0(out[3]),
        .I1(spi_data[11]),
        .I2(out[0]),
        .O(D[107]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[108]_i_1 
       (.I0(out[3]),
        .I1(spi_data[12]),
        .I2(out[0]),
        .O(D[108]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[109]_i_1 
       (.I0(out[3]),
        .I1(spi_data[13]),
        .I2(out[0]),
        .O(D[109]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \receive_data[10]_i_1 
       (.I0(spi_data[10]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[110]_i_1 
       (.I0(out[3]),
        .I1(spi_data[14]),
        .I2(out[0]),
        .O(D[110]));
  LUT6 #(
    .INIT(64'h0101000000000100)) 
    \receive_data[111]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[4]),
        .I3(\FSM_sequential_i[4]_i_3_n_0 ),
        .I4(out[3]),
        .I5(out[0]),
        .O(E[6]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[111]_i_2 
       (.I0(out[3]),
        .I1(spi_data[15]),
        .I2(out[0]),
        .O(D[111]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[112]_i_1 
       (.I0(out[3]),
        .I1(spi_data[0]),
        .O(D[112]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[113]_i_1 
       (.I0(out[3]),
        .I1(spi_data[1]),
        .O(D[113]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[114]_i_1 
       (.I0(out[3]),
        .I1(spi_data[2]),
        .O(D[114]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[115]_i_1 
       (.I0(out[3]),
        .I1(spi_data[3]),
        .O(D[115]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[116]_i_1 
       (.I0(out[3]),
        .I1(spi_data[4]),
        .O(D[116]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[117]_i_1 
       (.I0(out[3]),
        .I1(spi_data[5]),
        .O(D[117]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[118]_i_1 
       (.I0(out[3]),
        .I1(spi_data[6]),
        .O(D[118]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[119]_i_1 
       (.I0(out[3]),
        .I1(spi_data[7]),
        .O(D[119]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \receive_data[11]_i_1 
       (.I0(spi_data[11]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[120]_i_1 
       (.I0(out[3]),
        .I1(spi_data[8]),
        .O(D[120]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[121]_i_1 
       (.I0(out[3]),
        .I1(spi_data[9]),
        .O(D[121]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[122]_i_1 
       (.I0(out[3]),
        .I1(spi_data[10]),
        .O(D[122]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[123]_i_1 
       (.I0(out[3]),
        .I1(spi_data[11]),
        .O(D[123]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[124]_i_1 
       (.I0(out[3]),
        .I1(spi_data[12]),
        .O(D[124]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[125]_i_1 
       (.I0(out[3]),
        .I1(spi_data[13]),
        .O(D[125]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[126]_i_1 
       (.I0(out[3]),
        .I1(spi_data[14]),
        .O(D[126]));
  LUT6 #(
    .INIT(64'h000000000000000E)) 
    \receive_data[127]_i_1 
       (.I0(out[3]),
        .I1(\FSM_sequential_i[4]_i_3_n_0 ),
        .I2(out[4]),
        .I3(out[0]),
        .I4(out[2]),
        .I5(out[1]),
        .O(E[7]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[127]_i_2 
       (.I0(out[3]),
        .I1(spi_data[15]),
        .O(D[127]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[128]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[0]),
        .O(D[128]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[129]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[1]),
        .O(D[129]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \receive_data[12]_i_1 
       (.I0(spi_data[12]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .O(D[12]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[130]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[2]),
        .O(D[130]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[131]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[3]),
        .O(D[131]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[132]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[4]),
        .O(D[132]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[133]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[5]),
        .O(D[133]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[134]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[6]),
        .O(D[134]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[135]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[7]),
        .O(D[135]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[136]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[8]),
        .O(D[136]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[137]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[9]),
        .O(D[137]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[138]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[10]),
        .O(D[138]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[139]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[11]),
        .O(D[139]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \receive_data[13]_i_1 
       (.I0(spi_data[13]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .O(D[13]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[140]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[12]),
        .O(D[140]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[141]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[13]),
        .O(D[141]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[142]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[14]),
        .O(D[142]));
  LUT6 #(
    .INIT(64'h0300000000000002)) 
    \receive_data[143]_i_1 
       (.I0(\FSM_sequential_i[4]_i_3_n_0 ),
        .I1(out[4]),
        .I2(out[3]),
        .I3(out[0]),
        .I4(out[2]),
        .I5(out[1]),
        .O(E[8]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[143]_i_2 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[15]),
        .O(D[143]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[144]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(spi_data[0]),
        .O(D[144]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[145]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(spi_data[1]),
        .O(D[145]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[146]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(spi_data[2]),
        .O(D[146]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[147]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(spi_data[3]),
        .O(D[147]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[148]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(spi_data[4]),
        .O(D[148]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[149]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(spi_data[5]),
        .O(D[149]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \receive_data[14]_i_1 
       (.I0(spi_data[14]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .O(D[14]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[150]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(spi_data[6]),
        .O(D[150]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[151]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(spi_data[7]),
        .O(D[151]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[152]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(spi_data[8]),
        .O(D[152]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[153]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(spi_data[9]),
        .O(D[153]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[154]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(spi_data[10]),
        .O(D[154]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[155]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(spi_data[11]),
        .O(D[155]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[156]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(spi_data[12]),
        .O(D[156]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[157]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(spi_data[13]),
        .O(D[157]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[158]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(spi_data[14]),
        .O(D[158]));
  LUT6 #(
    .INIT(64'h00000000000000A4)) 
    \receive_data[159]_i_1 
       (.I0(out[2]),
        .I1(\FSM_sequential_i[4]_i_3_n_0 ),
        .I2(out[1]),
        .I3(out[4]),
        .I4(out[0]),
        .I5(out[3]),
        .O(E[9]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[159]_i_2 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(spi_data[15]),
        .O(D[159]));
  LUT6 #(
    .INIT(64'h0800000108000000)) 
    \receive_data[15]_i_1 
       (.I0(out[0]),
        .I1(out[1]),
        .I2(out[4]),
        .I3(out[2]),
        .I4(out[3]),
        .I5(\FSM_sequential_i[4]_i_3_n_0 ),
        .O(E[0]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \receive_data[15]_i_2 
       (.I0(spi_data[15]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .O(D[15]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[160]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(spi_data[0]),
        .O(D[160]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[161]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(spi_data[1]),
        .O(D[161]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[162]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(spi_data[2]),
        .O(D[162]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[163]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(spi_data[3]),
        .O(D[163]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[164]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(spi_data[4]),
        .O(D[164]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[165]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(spi_data[5]),
        .O(D[165]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[166]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(spi_data[6]),
        .O(D[166]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[167]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(spi_data[7]),
        .O(D[167]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[168]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(spi_data[8]),
        .O(D[168]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[169]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(spi_data[9]),
        .O(D[169]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[16]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(spi_data[0]),
        .O(D[16]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[170]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(spi_data[10]),
        .O(D[170]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[171]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(spi_data[11]),
        .O(D[171]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[172]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(spi_data[12]),
        .O(D[172]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[173]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(spi_data[13]),
        .O(D[173]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[174]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(spi_data[14]),
        .O(D[174]));
  LUT6 #(
    .INIT(64'h00000000000000A4)) 
    \receive_data[175]_i_1 
       (.I0(out[2]),
        .I1(\FSM_sequential_i[4]_i_3_n_0 ),
        .I2(out[0]),
        .I3(out[4]),
        .I4(out[1]),
        .I5(out[3]),
        .O(E[10]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[175]_i_2 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(spi_data[15]),
        .O(D[175]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[176]_i_1 
       (.I0(out[2]),
        .I1(spi_data[0]),
        .O(D[176]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[177]_i_1 
       (.I0(out[2]),
        .I1(spi_data[1]),
        .O(D[177]));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[178]_i_1 
       (.I0(out[2]),
        .I1(spi_data[2]),
        .O(D[178]));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[179]_i_1 
       (.I0(out[2]),
        .I1(spi_data[3]),
        .O(D[179]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[17]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(spi_data[1]),
        .O(D[17]));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[180]_i_1 
       (.I0(out[2]),
        .I1(spi_data[4]),
        .O(D[180]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[181]_i_1 
       (.I0(out[2]),
        .I1(spi_data[5]),
        .O(D[181]));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[182]_i_1 
       (.I0(out[2]),
        .I1(spi_data[6]),
        .O(D[182]));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[183]_i_1 
       (.I0(out[2]),
        .I1(spi_data[7]),
        .O(D[183]));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[184]_i_1 
       (.I0(out[2]),
        .I1(spi_data[8]),
        .O(D[184]));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[185]_i_1 
       (.I0(out[2]),
        .I1(spi_data[9]),
        .O(D[185]));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[186]_i_1 
       (.I0(out[2]),
        .I1(spi_data[10]),
        .O(D[186]));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[187]_i_1 
       (.I0(out[2]),
        .I1(spi_data[11]),
        .O(D[187]));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[188]_i_1 
       (.I0(out[2]),
        .I1(spi_data[12]),
        .O(D[188]));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[189]_i_1 
       (.I0(out[2]),
        .I1(spi_data[13]),
        .O(D[189]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[18]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(spi_data[2]),
        .O(D[18]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[190]_i_1 
       (.I0(out[2]),
        .I1(spi_data[14]),
        .O(D[190]));
  LUT6 #(
    .INIT(64'h000000000000000E)) 
    \receive_data[191]_i_1 
       (.I0(out[2]),
        .I1(\FSM_sequential_i[4]_i_3_n_0 ),
        .I2(out[4]),
        .I3(out[3]),
        .I4(out[0]),
        .I5(out[1]),
        .O(E[11]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[191]_i_2 
       (.I0(out[2]),
        .I1(spi_data[15]),
        .O(D[191]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[192]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(spi_data[0]),
        .O(D[192]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[193]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(spi_data[1]),
        .O(D[193]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[194]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(spi_data[2]),
        .O(D[194]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[195]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(spi_data[3]),
        .O(D[195]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[196]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(spi_data[4]),
        .O(D[196]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[197]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(spi_data[5]),
        .O(D[197]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[198]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(spi_data[6]),
        .O(D[198]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[199]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(spi_data[7]),
        .O(D[199]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[19]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(spi_data[3]),
        .O(D[19]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \receive_data[1]_i_1 
       (.I0(spi_data[1]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[200]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(spi_data[8]),
        .O(D[200]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[201]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(spi_data[9]),
        .O(D[201]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[202]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(spi_data[10]),
        .O(D[202]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[203]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(spi_data[11]),
        .O(D[203]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[204]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(spi_data[12]),
        .O(D[204]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[205]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(spi_data[13]),
        .O(D[205]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[206]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(spi_data[14]),
        .O(D[206]));
  LUT6 #(
    .INIT(64'h0000000003000002)) 
    \receive_data[207]_i_1 
       (.I0(\FSM_sequential_i[4]_i_3_n_0 ),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .I5(out[4]),
        .O(E[12]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[207]_i_2 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(spi_data[15]),
        .O(D[207]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[208]_i_1 
       (.I0(out[1]),
        .I1(spi_data[0]),
        .O(D[208]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[209]_i_1 
       (.I0(out[1]),
        .I1(spi_data[1]),
        .O(D[209]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[20]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(spi_data[4]),
        .O(D[20]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[210]_i_1 
       (.I0(out[1]),
        .I1(spi_data[2]),
        .O(D[210]));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[211]_i_1 
       (.I0(out[1]),
        .I1(spi_data[3]),
        .O(D[211]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[212]_i_1 
       (.I0(out[1]),
        .I1(spi_data[4]),
        .O(D[212]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[213]_i_1 
       (.I0(out[1]),
        .I1(spi_data[5]),
        .O(D[213]));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[214]_i_1 
       (.I0(out[1]),
        .I1(spi_data[6]),
        .O(D[214]));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[215]_i_1 
       (.I0(out[1]),
        .I1(spi_data[7]),
        .O(D[215]));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[216]_i_1 
       (.I0(out[1]),
        .I1(spi_data[8]),
        .O(D[216]));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[217]_i_1 
       (.I0(out[1]),
        .I1(spi_data[9]),
        .O(D[217]));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[218]_i_1 
       (.I0(out[1]),
        .I1(spi_data[10]),
        .O(D[218]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[219]_i_1 
       (.I0(out[1]),
        .I1(spi_data[11]),
        .O(D[219]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[21]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(spi_data[5]),
        .O(D[21]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[220]_i_1 
       (.I0(out[1]),
        .I1(spi_data[12]),
        .O(D[220]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[221]_i_1 
       (.I0(out[1]),
        .I1(spi_data[13]),
        .O(D[221]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[222]_i_1 
       (.I0(out[1]),
        .I1(spi_data[14]),
        .O(D[222]));
  LUT6 #(
    .INIT(64'h000000000000000E)) 
    \receive_data[223]_i_1 
       (.I0(out[1]),
        .I1(\FSM_sequential_i[4]_i_3_n_0 ),
        .I2(out[3]),
        .I3(out[2]),
        .I4(out[0]),
        .I5(out[4]),
        .O(E[13]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \receive_data[223]_i_2 
       (.I0(spi_data[15]),
        .I1(out[1]),
        .O(D[223]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[22]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(spi_data[6]),
        .O(D[22]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[23]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(spi_data[7]),
        .O(D[23]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[24]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(spi_data[8]),
        .O(D[24]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[25]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(spi_data[9]),
        .O(D[25]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[26]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(spi_data[10]),
        .O(D[26]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[27]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(spi_data[11]),
        .O(D[27]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[28]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(spi_data[12]),
        .O(D[28]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[29]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(spi_data[13]),
        .O(D[29]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \receive_data[2]_i_1 
       (.I0(spi_data[2]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[30]_i_1 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(spi_data[14]),
        .O(D[30]));
  LUT6 #(
    .INIT(64'h0300000000000002)) 
    \receive_data[31]_i_1 
       (.I0(\FSM_sequential_i[4]_i_3_n_0 ),
        .I1(out[4]),
        .I2(out[0]),
        .I3(out[3]),
        .I4(out[2]),
        .I5(out[1]),
        .O(E[1]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[31]_i_2 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(spi_data[15]),
        .O(D[31]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[32]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[0]),
        .O(D[32]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[33]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[1]),
        .O(D[33]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[34]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[2]),
        .O(D[34]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[35]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[3]),
        .O(D[35]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[36]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[4]),
        .O(D[36]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[37]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[5]),
        .O(D[37]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[38]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[6]),
        .O(D[38]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[39]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[7]),
        .O(D[39]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \receive_data[3]_i_1 
       (.I0(spi_data[3]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[40]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[8]),
        .O(D[40]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[41]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[9]),
        .O(D[41]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[42]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[10]),
        .O(D[42]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[43]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[11]),
        .O(D[43]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[44]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[12]),
        .O(D[44]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[45]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[13]),
        .O(D[45]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[46]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[14]),
        .O(D[46]));
  LUT6 #(
    .INIT(64'h0000000000008180)) 
    \receive_data[47]_i_1 
       (.I0(out[0]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(\FSM_sequential_i[4]_i_3_n_0 ),
        .I4(out[4]),
        .I5(out[1]),
        .O(E[2]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[47]_i_2 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(spi_data[15]),
        .O(D[47]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[48]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(spi_data[0]),
        .O(D[48]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[49]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(spi_data[1]),
        .O(D[49]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \receive_data[4]_i_1 
       (.I0(spi_data[4]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[50]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(spi_data[2]),
        .O(D[50]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[51]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(spi_data[3]),
        .O(D[51]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[52]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(spi_data[4]),
        .O(D[52]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[53]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(spi_data[5]),
        .O(D[53]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[54]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(spi_data[6]),
        .O(D[54]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[55]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(spi_data[7]),
        .O(D[55]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[56]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(spi_data[8]),
        .O(D[56]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[57]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(spi_data[9]),
        .O(D[57]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[58]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(spi_data[10]),
        .O(D[58]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[59]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(spi_data[11]),
        .O(D[59]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \receive_data[5]_i_1 
       (.I0(spi_data[5]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[60]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(spi_data[12]),
        .O(D[60]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[61]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(spi_data[13]),
        .O(D[61]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[62]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(spi_data[14]),
        .O(D[62]));
  LUT6 #(
    .INIT(64'h0100000101000000)) 
    \receive_data[63]_i_1 
       (.I0(out[0]),
        .I1(out[1]),
        .I2(out[4]),
        .I3(out[2]),
        .I4(out[3]),
        .I5(\FSM_sequential_i[4]_i_3_n_0 ),
        .O(E[3]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[63]_i_2 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(spi_data[15]),
        .O(D[63]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[64]_i_1 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(spi_data[0]),
        .O(D[64]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[65]_i_1 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(spi_data[1]),
        .O(D[65]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[66]_i_1 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(spi_data[2]),
        .O(D[66]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[67]_i_1 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(spi_data[3]),
        .O(D[67]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[68]_i_1 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(spi_data[4]),
        .O(D[68]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[69]_i_1 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(spi_data[5]),
        .O(D[69]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \receive_data[6]_i_1 
       (.I0(spi_data[6]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[70]_i_1 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(spi_data[6]),
        .O(D[70]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[71]_i_1 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(spi_data[7]),
        .O(D[71]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[72]_i_1 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(spi_data[8]),
        .O(D[72]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[73]_i_1 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(spi_data[9]),
        .O(D[73]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[74]_i_1 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(spi_data[10]),
        .O(D[74]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[75]_i_1 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(spi_data[11]),
        .O(D[75]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[76]_i_1 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(spi_data[12]),
        .O(D[76]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[77]_i_1 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(spi_data[13]),
        .O(D[77]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[78]_i_1 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(spi_data[14]),
        .O(D[78]));
  LUT6 #(
    .INIT(64'h0000000000008180)) 
    \receive_data[79]_i_1 
       (.I0(out[0]),
        .I1(out[1]),
        .I2(out[3]),
        .I3(\FSM_sequential_i[4]_i_3_n_0 ),
        .I4(out[4]),
        .I5(out[2]),
        .O(E[4]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \receive_data[79]_i_2 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(spi_data[15]),
        .O(D[79]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \receive_data[7]_i_1 
       (.I0(spi_data[7]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[80]_i_1 
       (.I0(spi_data[0]),
        .I1(out[3]),
        .I2(out[1]),
        .O(D[80]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[81]_i_1 
       (.I0(spi_data[1]),
        .I1(out[3]),
        .I2(out[1]),
        .O(D[81]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[82]_i_1 
       (.I0(spi_data[2]),
        .I1(out[3]),
        .I2(out[1]),
        .O(D[82]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[83]_i_1 
       (.I0(spi_data[3]),
        .I1(out[3]),
        .I2(out[1]),
        .O(D[83]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[84]_i_1 
       (.I0(spi_data[4]),
        .I1(out[3]),
        .I2(out[1]),
        .O(D[84]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[85]_i_1 
       (.I0(spi_data[5]),
        .I1(out[3]),
        .I2(out[1]),
        .O(D[85]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[86]_i_1 
       (.I0(spi_data[6]),
        .I1(out[3]),
        .I2(out[1]),
        .O(D[86]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[87]_i_1 
       (.I0(spi_data[7]),
        .I1(out[3]),
        .I2(out[1]),
        .O(D[87]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[88]_i_1 
       (.I0(spi_data[8]),
        .I1(out[3]),
        .I2(out[1]),
        .O(D[88]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[89]_i_1 
       (.I0(spi_data[9]),
        .I1(out[3]),
        .I2(out[1]),
        .O(D[89]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \receive_data[8]_i_1 
       (.I0(spi_data[8]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .O(D[8]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[90]_i_1 
       (.I0(spi_data[10]),
        .I1(out[3]),
        .I2(out[1]),
        .O(D[90]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[91]_i_1 
       (.I0(spi_data[11]),
        .I1(out[3]),
        .I2(out[1]),
        .O(D[91]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[92]_i_1 
       (.I0(spi_data[12]),
        .I1(out[3]),
        .I2(out[1]),
        .O(D[92]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[93]_i_1 
       (.I0(spi_data[13]),
        .I1(out[3]),
        .I2(out[1]),
        .O(D[93]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[94]_i_1 
       (.I0(spi_data[14]),
        .I1(out[3]),
        .I2(out[1]),
        .O(D[94]));
  LUT6 #(
    .INIT(64'h0101000000000100)) 
    \receive_data[95]_i_1 
       (.I0(out[2]),
        .I1(out[4]),
        .I2(out[0]),
        .I3(\FSM_sequential_i[4]_i_3_n_0 ),
        .I4(out[3]),
        .I5(out[1]),
        .O(E[5]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[95]_i_2 
       (.I0(spi_data[15]),
        .I1(out[3]),
        .I2(out[1]),
        .O(D[95]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[96]_i_1 
       (.I0(out[3]),
        .I1(spi_data[0]),
        .I2(out[0]),
        .O(D[96]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[97]_i_1 
       (.I0(out[3]),
        .I1(spi_data[1]),
        .I2(out[0]),
        .O(D[97]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[98]_i_1 
       (.I0(out[3]),
        .I1(spi_data[2]),
        .I2(out[0]),
        .O(D[98]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \receive_data[99]_i_1 
       (.I0(out[3]),
        .I1(spi_data[3]),
        .I2(out[0]),
        .O(D[99]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \receive_data[9]_i_1 
       (.I0(spi_data[9]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .O(D[9]));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \rxd_data[0]_i_1 
       (.I0(cs_r2),
        .I1(spi_mosi),
        .O(\rxd_data[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \rxd_data[10]_i_1 
       (.I0(cs_r2),
        .I1(spi_data[9]),
        .O(\rxd_data[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \rxd_data[11]_i_1 
       (.I0(cs_r2),
        .I1(spi_data[10]),
        .O(\rxd_data[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \rxd_data[12]_i_1 
       (.I0(cs_r2),
        .I1(spi_data[11]),
        .O(\rxd_data[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \rxd_data[13]_i_1 
       (.I0(cs_r2),
        .I1(spi_data[12]),
        .O(\rxd_data[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \rxd_data[14]_i_1 
       (.I0(cs_r2),
        .I1(spi_data[13]),
        .O(\rxd_data[14]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0F02)) 
    \rxd_data[15]_i_1 
       (.I0(sck_r1),
        .I1(sck_r2),
        .I2(cs_r1),
        .I3(cs_r2),
        .O(\rxd_data[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \rxd_data[15]_i_2 
       (.I0(cs_r2),
        .I1(spi_data[14]),
        .O(\rxd_data[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \rxd_data[1]_i_1 
       (.I0(cs_r2),
        .I1(spi_data[0]),
        .O(\rxd_data[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \rxd_data[2]_i_1 
       (.I0(cs_r2),
        .I1(spi_data[1]),
        .O(\rxd_data[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \rxd_data[3]_i_1 
       (.I0(cs_r2),
        .I1(spi_data[2]),
        .O(\rxd_data[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \rxd_data[4]_i_1 
       (.I0(cs_r2),
        .I1(spi_data[3]),
        .O(\rxd_data[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \rxd_data[5]_i_1 
       (.I0(cs_r2),
        .I1(spi_data[4]),
        .O(\rxd_data[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \rxd_data[6]_i_1 
       (.I0(cs_r2),
        .I1(spi_data[5]),
        .O(\rxd_data[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \rxd_data[7]_i_1 
       (.I0(cs_r2),
        .I1(spi_data[6]),
        .O(\rxd_data[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \rxd_data[8]_i_1 
       (.I0(cs_r2),
        .I1(spi_data[7]),
        .O(\rxd_data[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \rxd_data[9]_i_1 
       (.I0(cs_r2),
        .I1(spi_data[8]),
        .O(\rxd_data[9]_i_1_n_0 ));
  FDCE \rxd_data_reg[0] 
       (.C(clk),
        .CE(\rxd_data[15]_i_1_n_0 ),
        .CLR(flag_done_reg_0),
        .D(\rxd_data[0]_i_1_n_0 ),
        .Q(spi_data[0]));
  FDCE \rxd_data_reg[10] 
       (.C(clk),
        .CE(\rxd_data[15]_i_1_n_0 ),
        .CLR(flag_done_reg_0),
        .D(\rxd_data[10]_i_1_n_0 ),
        .Q(spi_data[10]));
  FDCE \rxd_data_reg[11] 
       (.C(clk),
        .CE(\rxd_data[15]_i_1_n_0 ),
        .CLR(flag_done_reg_0),
        .D(\rxd_data[11]_i_1_n_0 ),
        .Q(spi_data[11]));
  FDCE \rxd_data_reg[12] 
       (.C(clk),
        .CE(\rxd_data[15]_i_1_n_0 ),
        .CLR(flag_done_reg_0),
        .D(\rxd_data[12]_i_1_n_0 ),
        .Q(spi_data[12]));
  FDCE \rxd_data_reg[13] 
       (.C(clk),
        .CE(\rxd_data[15]_i_1_n_0 ),
        .CLR(flag_done_reg_0),
        .D(\rxd_data[13]_i_1_n_0 ),
        .Q(spi_data[13]));
  FDCE \rxd_data_reg[14] 
       (.C(clk),
        .CE(\rxd_data[15]_i_1_n_0 ),
        .CLR(flag_done_reg_0),
        .D(\rxd_data[14]_i_1_n_0 ),
        .Q(spi_data[14]));
  FDCE \rxd_data_reg[15] 
       (.C(clk),
        .CE(\rxd_data[15]_i_1_n_0 ),
        .CLR(flag_done_reg_0),
        .D(\rxd_data[15]_i_2_n_0 ),
        .Q(spi_data[15]));
  FDCE \rxd_data_reg[1] 
       (.C(clk),
        .CE(\rxd_data[15]_i_1_n_0 ),
        .CLR(flag_done_reg_0),
        .D(\rxd_data[1]_i_1_n_0 ),
        .Q(spi_data[1]));
  FDCE \rxd_data_reg[2] 
       (.C(clk),
        .CE(\rxd_data[15]_i_1_n_0 ),
        .CLR(flag_done_reg_0),
        .D(\rxd_data[2]_i_1_n_0 ),
        .Q(spi_data[2]));
  FDCE \rxd_data_reg[3] 
       (.C(clk),
        .CE(\rxd_data[15]_i_1_n_0 ),
        .CLR(flag_done_reg_0),
        .D(\rxd_data[3]_i_1_n_0 ),
        .Q(spi_data[3]));
  FDCE \rxd_data_reg[4] 
       (.C(clk),
        .CE(\rxd_data[15]_i_1_n_0 ),
        .CLR(flag_done_reg_0),
        .D(\rxd_data[4]_i_1_n_0 ),
        .Q(spi_data[4]));
  FDCE \rxd_data_reg[5] 
       (.C(clk),
        .CE(\rxd_data[15]_i_1_n_0 ),
        .CLR(flag_done_reg_0),
        .D(\rxd_data[5]_i_1_n_0 ),
        .Q(spi_data[5]));
  FDCE \rxd_data_reg[6] 
       (.C(clk),
        .CE(\rxd_data[15]_i_1_n_0 ),
        .CLR(flag_done_reg_0),
        .D(\rxd_data[6]_i_1_n_0 ),
        .Q(spi_data[6]));
  FDCE \rxd_data_reg[7] 
       (.C(clk),
        .CE(\rxd_data[15]_i_1_n_0 ),
        .CLR(flag_done_reg_0),
        .D(\rxd_data[7]_i_1_n_0 ),
        .Q(spi_data[7]));
  FDCE \rxd_data_reg[8] 
       (.C(clk),
        .CE(\rxd_data[15]_i_1_n_0 ),
        .CLR(flag_done_reg_0),
        .D(\rxd_data[8]_i_1_n_0 ),
        .Q(spi_data[8]));
  FDCE \rxd_data_reg[9] 
       (.C(clk),
        .CE(\rxd_data[15]_i_1_n_0 ),
        .CLR(flag_done_reg_0),
        .D(\rxd_data[9]_i_1_n_0 ),
        .Q(spi_data[9]));
  FDCE sck_r1_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(flag_done_reg_0),
        .D(spi_sck),
        .Q(sck_r1));
  FDCE sck_r2_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(flag_done_reg_0),
        .D(sck_r1),
        .Q(sck_r2));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
