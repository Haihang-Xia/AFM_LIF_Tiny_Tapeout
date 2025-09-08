`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2025 09:48:56 PM
// Design Name: 
// Module Name: single_step
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb();
reg clk = 0;
reg rst = 0;
//wire [15:0] vout;
//wire spike;
wire [7:0] uo_out,uio_out,uio_oe;
reg [7:0] ui_in,uio_in;

LIF_neuron UUT(
	.clk(clk), 
	.rst(rst), 
	.ui_in(ui_in), 
	.uo_out(uo_out), 
	.uio_in(uio_in), 
	.uio_out(uio_out), 
	.uio_oe(uio_oe)
); 

always #5 clk = !clk;

//assign spike = uio_out[0];
//assign vout = {uo_out,uio_out[7:1],1'b0};

initial
    begin
    $vcdplusfile("vcdplus.vpd");
    $vcdpluson;

    $fsdbDumpfile("tb.fsdb");
    $fsdbDumpvars(0, tb);

    $dumpfile("dump.vcd");
    $dumpvars(0, tb); 

    	rst = 1;
	#10;
	rst = 0;
	#10
      ui_in = 8'b11000101; //E_REST
	uio_in = 8'b11111111;
	#20;
	ui_in = 8'b00000001;//e_tau
	uio_in = 8'b10001110;
	#10;
	ui_in = 8'b00111100;//v_th
	uio_in = 8'b00000000;
	#20;
	ui_in = 8'b00000001;//v_o
	uio_in = 8'b00000001;//0
	#10;
	ui_in = 8'b00000010;//v_o
	uio_in = 8'b00000001;//1
	#10;
	ui_in = 8'b00000011;//v_o
	uio_in = 8'b00000010;//2
	#10;
	ui_in = 8'b00000101;//v_o
	uio_in = 8'b00000001;//3
	#10;
	ui_in = 8'b00000110;//v_o
	uio_in = 8'b00000001;//4
	#10;
	ui_in = 8'b00000111;//v_o
	uio_in = 8'b00000001;//5
	#10;
	ui_in = 8'b00001000;//v_o
	uio_in = 8'b00000001;//6
	#10;
	ui_in = 8'b00010000;//v_o
	uio_in = 8'b00000001;//7
	#10;
	ui_in = 8'b11100000;//v_o
	uio_in = 8'b00000001;//8
	#25;
	ui_in = 8'b00000000; //i = 20 (5,3)
	uio_in = 8'b0;
	#10;
	ui_in = 8'b00001000; //i 
	uio_in = 8'b0;
	#10;
	ui_in = 8'b00010000; //i 
	uio_in = 8'b0;
	#10;
	ui_in = 8'b00011000; //i 
	uio_in = 8'b0;
	#10;
	ui_in = 8'b00100000; //i 
	uio_in = 8'b0;
	#10;
	ui_in = 8'b00101000; //i 
	uio_in = 8'b0;
	#10
	ui_in = 8'b00110000; //i 
	uio_in = 8'b0;
	#10;
	ui_in = 8'b00111000; //i 
	uio_in = 8'b0;
	#10
	ui_in = 8'b10001000; //i 
	uio_in = 8'b0;
	#8000;

    $finish;
    end 


endmodule
