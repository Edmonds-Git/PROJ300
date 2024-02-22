
//544μs = 0 degree, 2400μs = 180 degree.
//Should be Roughly 10.3 μs difference per degree of angle
//50MHz clk = period of 0.02μs 
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
	
	logic [16:0]timer_t1; //max value is 93,244 (544+(10./0.02)*180)
//	logic [16:0]Timer_C1;
	logic [16:0]mxvlue = 17'd119900; //prev value 17'd93244
	typedef int unsigned state_t1;
	state_t1 state1 = mxvlue - 2'd2;
	state_t1 next_state1;
	
	always_comb begin : timer_1_state_logic
		next_state1 = state1;
		case (state1)
			timer_t1: next_state1 = 0;
			default: next_state1 = (state1 + 1);
		endcase
	end
	
	always_comb begin : timer_1_output_logic
		case (state1)
			timer_t1:servo1 = '1;
			default: servo1 = '0;
		endcase
	end
	
	always_ff @(posedge clk) 
	begin
		if(nextangle == 1'd1)
			timer_t1 <= 15'd27200 + angle1 *  10'd515;
//			timer_t2 <= 10'd544 + angle2 *  10'd515;
//			timer_t3 <= 10'd544 + angle3 *  10'd515;
//			timer_t4 <= 10'd544 + angle4 *  10'd515;
		else
			state1 <= next_state1;
		
	end
//	always_ff @(posedge clk) 
//	begin
//		if(state1 == timer_t1)
//			state1 <= 0;
//		
//	end
	
	
	
	
	
endmodule