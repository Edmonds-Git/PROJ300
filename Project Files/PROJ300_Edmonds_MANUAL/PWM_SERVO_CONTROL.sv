
//544μs = 0 degree, 2400μs = 180 degree.
//Should be Roughly 10.3 μs difference per degree of angle
//50MHz clk = period of 0.02μs 

//new values
//1000us = -90 1500us = 0 2000us = 90
//5.5 μs per degree
//ms per deg = 500/90 = 5.5us
//cycles per deg = 5.5 /0.02 = 275 cycles
//-90 -= 1000/0.02 = 50000
//minimum value = 50000+(5.5/0.02)*0 = 50000
//duty cycle = 50000 +(5.5/0.02)*angle
//max value = 50000n +(5.5/0.02)*180 = 324500
module PWM_SERVO_CONTROL (
	output logic servo1,
	output logic servo2,
	output logic servo3,
	output logic servo4,
	input logic clk,
	input logic nextangle, //used to reset and assign new values
	input logic [7:0]angle1,
	input logic [7:0]angle2,
	input logic [7:0]angle3,
	input logic [7:0]angle4);
	
	//define timers
	logic [17:0]timer_t1; //max value is 119900 (27200+(10./0.02)*180)
	logic [17:0]timer_t2;
	logic [17:0]timer_t3;
	logic [17:0]timer_t4;
//	logic [19:0]timer_t1;
//	logic [19:0]timer_t2;
//	logic [19:0]timer_t3;
//	logic [19:0]timer_t4;
//	logic [16:0]Timer_C1;
	logic [19:0]mxvlue = 20'd1000000; //prev value 17'd93244// = 20'd324500;// = 20'd1000000; //prev value 17'd93244
	typedef int unsigned state_t1;
	state_t1 state1;
	state_t1 next_state1;
	
	always_comb begin : timer_1_state_logic
		next_state1 = state1;
		case (state1)
			mxvlue: next_state1 = 0;
			default: next_state1 = (state1 + 1);
		endcase
	end
	
//	always_comb begin : timer_1_output_logic
//		case (state1)
//			[(mxvlue-timer_t1):mxvlue]:servo1 = '1;
//			default: servo1 = '0;
//		endcase
//	end

	always_ff @(posedge clk) 
	begin
		if(nextangle == 1'd1)
			begin
				timer_t1 <= 16'd50000 + angle1 * 10'd275;
				timer_t2 <= 16'd50000 + angle2 * 10'd275;
				timer_t3 <= 17'd50000 + angle3 * 10'd275;
				timer_t4 <= 16'd50000 + angle4 * 10'd275;
				state1 <= next_state1;
				if (state1 > mxvlue-timer_t1)
					servo1 <= 1;
				else
					servo1 <= 0;
				if (state1 > mxvlue-timer_t2)
					servo2 <= 1;
				else
					servo2 <= 0;
				if (state1 > mxvlue-timer_t3)
					servo3 <= 1;
				else
					servo3 <= 0;
				if (state1 > mxvlue-timer_t4)
					servo4 <= 1;
				else
					servo4 <= 0;
			end
		else
			begin
				state1 <= next_state1;
				if (state1 > mxvlue-timer_t1)
					servo1 <= 1;
				else
					servo1 <= 0;
				if (state1 > mxvlue-timer_t2)
					servo2 <= 1;
				else
					servo2 <= 0;
				if (state1 > mxvlue-timer_t3)
					servo3 <= 1;
				else
					servo3 <= 0;
				if (state1 > mxvlue-timer_t4)
					servo4 <= 1;
				else
					servo4 <= 0;
			end
		
	end
//	always_ff @(posedge clk) 
//	begin
//		if(state1 == timer_t1)
//			state1 <= 0;
//		
//	end
	
	
endmodule
