`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2026 23:37:37
// Design Name: 
// Module Name: washing_maching1_tb
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


module washing_maching1_tb();
    reg clk, reset, door_close, start, fill, detergent_add, cycle_time, drain, spin_time;
	wire door_lock, motor_on, fill_value_on, drain_value_on, done, soap_wash, water_wash; 
	
	
    washing_machine_1 uut(clk, reset, door_close, start, fill, detergent_add, cycle_time, drain, spin_time, door_lock, motor_on, fill_value_on, drain_value_on, done, soap_wash, water_wash);
		
	initial
		
	begin
	clk = 1;
		reset = 1;
		start = 0;
		door_close = 0;
		fill = 0;
		drain = 0;
		detergent_add = 0;
		cycle_time = 0;
		spin_time = 0;
		
		#5 reset=0;
		#5 start=1;door_close=1;
		fill=1; #30 fill=0;
		detergent_add=1; #10 detergent_add=0;
		cycle_time=1; #50 cycle_time=0;
		drain=1; #10 drain=0;
		//spin_time=1; #20 spin_time=0;
	
	    //#5 reset=0;
		//#5 start=1;door_close=1;
		fill=1; #30 fill=0;
		detergent_add=0; #10
		cycle_time=1; #50 cycle_time=0;
		drain=1; #10 drain=0;
		spin_time=1; #20 spin_time=0;
	    door_close = 0;
	    start = 0;
		
		/*
		
		#0 reset = 0;
		#2 start = 1;
		#4 door_close = 1;
		#3 filled = 1;
		#3 detergent_added = 1;
		#2 cycle_timeout = 1;
		#2 drained = 1; 
		#3 spin_timeout = 1;
		*/
	end
	
	always
	begin
		#5 clk = ~clk;
	end
	
	initial
	begin
		$monitor("Time=%d, Clock=%b, Reset=%b, start=%b, door_close=%b, fill=%b, detergent_add=%b, cycle_time=%b, drain=%b, spin_time=%b, door_lock=%b, motor_on=%b, fill_valve_on=%b, drain_valve_on=%b, soap_wash=%b, water_wash=%b, done=%b",$time, clk, reset, start, door_close, fill, detergent_add, cycle_time, drain, spin_time, door_lock, motor_on, fill_value_on, drain_value_on, soap_wash, water_wash, done);
	end
endmodule
