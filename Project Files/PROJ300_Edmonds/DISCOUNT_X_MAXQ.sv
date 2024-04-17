
module DISCOUNT_X_MAXQ(
	output logic [31:0] discount_x_max_Q,
	input logic [31:0] old_Q [36][4],
	input logic [5:0] maze_state,
	input logic [31:0] max_Q,
	input logic [2:0] action,
	input logic [3:0] reward);
	
	//fixed point scaling factor = Q7.24
	localparam SF = 2.0**-24.0; 
	localparam [31:0] discount_factor = 32'b00000000_111001100110011001100110;
	localparam [31:0] learn_rate = 32'b00000000_001100110011001100110011;
	//logic [63:0] result;
	logic [31:0] plus_reward;
	logic [31:0] min_Q;
	logic [63:0] X_learn;
	always_comb
	begin
		//convert back to 32 bit Q7.24
		//not actually needed for now
		//result = max_Q*discount_factor;
		//discount_x_max_Q = result[47:15];
		old_Q[5][2] = 32'b00000110111000111101011100001010;
		discount_x_max_Q = max_Q*discount_factor;
		plus_reward = reward + discount_x_max_Q;
		min_Q = plus_reward - old_Q[maze_state][action];
		X_learn = min_Q * learn_rate;
		//Probably need to remove the first and last 16 bits of X_learn
		//result = //add old_Q to the middle 32 bits of X_learn
	end
	
endmodule