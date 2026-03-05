`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2026 22:14:11
// Design Name: 
// Module Name: washing_machine_1
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


module washing_machine_1(
    input clk, reset, door_close, start, fill, detergent_add, cycle_time, drain, spin_time,
    output reg door_lock, motor_on, fill_value_on, drain_value_on, done, soap_wash, water_wash);
    
    parameter check_door = 3'b000;
	parameter fill_water = 3'b001;
	parameter wash = 3'b010;
	parameter cycle = 3'b011;
	parameter drain_water = 3'b100;
	parameter spin = 3'b101;

    reg[2:0] current_state, next_state;
    reg detergent = 0;
	
	always@(current_state or start or door_close or fill or drain or cycle_time or spin_time)
	begin
	case(current_state)
		check_door:
			if(start==1 && door_close==1)
			begin
				next_state = fill_water;
				motor_on = 0;
				fill_value_on = 0;
				drain_value_on = 0;
				door_lock = 1;
				soap_wash = 0;
				water_wash = 0;
				done = 0;
			end
			else
			begin
				next_state = current_state;
				motor_on = 0;
				fill_value_on = 0;
				drain_value_on = 0;
				door_lock = 0;
				soap_wash = 0;
				water_wash = 0;
				done = 0;
			end
			
		fill_water:
	       if(fill == 0)
	       begin
	            next_state = wash;
				motor_on = 0;
				fill_value_on = 0;
				drain_value_on = 0;
				door_lock = 1;
				soap_wash = 0;
				water_wash = 0;
				done = 0;
	       end
	       else
	       begin
	            next_state = current_state;
			    motor_on = 0;
			    fill_value_on = 1;
		   	    drain_value_on = 0;
			    door_lock = 1;
			    soap_wash = 0;
				water_wash = 0;
				done = 0;
	       end
	     
		wash:
	       if(detergent_add == 1)
	       begin
	           detergent = 1;
	           next_state = cycle;
	           motor_on = 0;
	           fill_value_on = 1;
               drain_value_on = 0;
		       door_lock = 1;
			   soap_wash = 1;
			   water_wash = 0;
			   done = 0;
	       end
	       else
	       begin
	           next_state = cycle;
	           motor_on = 0;
	           fill_value_on = 1;
               drain_value_on = 0;
		       door_lock = 1;
			   soap_wash = 0;
			   water_wash = 1;
			   done = 0;
	       end
	   
		cycle:
	       if(cycle_time == 0)
	       begin
	           next_state = drain_water;
	           motor_on = 0;
	           fill_value_on = 0;
               drain_value_on = 0;
		       //door_lock = 1;
			   //soap_wash = 1;
			   water_wash = 0;
			   done = 0;
	       end
	       else
	       begin
	           if(detergent == 1)
	           begin
	               next_state = current_state;
                   motor_on = 1;
                   fill_value_on = 0;
                   drain_value_on = 0;
                   door_lock = 1;
                   soap_wash = 1;
                   //water_wash = 0;
                   done = 0;
	           end
	           else
	           begin
                   next_state = current_state;
                   motor_on = 1;
                   fill_value_on = 0;
                   drain_value_on = 0;
                   door_lock = 1;
                   //soap_wash = 0;
                   //water_wash = 1;
                   done = 0;
               end
	       end
	       
		drain_water:
	       if(drain == 0)
	       begin
	           next_state = spin;
	           motor_on = 0;
	           fill_value_on = 0;
               drain_value_on = 0;
		       door_lock = 1;
			   //soap_wash = 0;
			   //water_wash = 0;
			   done = 0;
	       end
	       else
	       begin
	           if(soap_wash == 1)
	           begin
                   next_state = current_state;
                   motor_on = 0;
                   fill_value_on = 0;
                   drain_value_on = 1;
                   door_lock = 1;
                   //soap_wash = 0;
                   //water_wash = 0;
                   done = 0;
	           end
	           else
	           begin
                   next_state = current_state;
                   motor_on = 0;
                   fill_value_on = 0;
                   drain_value_on = 1;
                   door_lock = 1;
                   //soap_wash = 0;
                   //water_wash = 0;
                   done = 0;
			   end
	       end
	       
		spin:
	       if(spin_time == 0)
	       begin
	           next_state = door_close;
	           motor_on = 0;
	           fill_value_on = 0;
               drain_value_on = 0;
		       door_lock = 0;
			   soap_wash = 0;
			   water_wash = 0;
			   done = 1;
			   detergent = 0;
	       end
	       else
	       begin
	           next_state = current_state;
	           motor_on = 1;
	           fill_value_on = 0;
               drain_value_on = 0;
		       door_lock = 1;
			   soap_wash = 0;
			   water_wash = 0;
			   done = 0;
	       end
	       
		default:
			next_state = check_door;	
		endcase
    end

    always@(posedge clk or negedge reset)
	begin
		if(reset)
		begin
			current_state<=3'b000;
		end
		else
		begin
			current_state<=next_state;
		end
	end

endmodule
