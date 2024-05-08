
module NEW_Q(
	output logic [31:0] new_Q[37][4],
	output logic done_o,
	input logic [31:0] old_Q [37][4],
	input logic [5:0] maze_state,
	input logic [31:0] max_Q,
	input logic [3:0] action,
	input logic [3:0] reward,
	input logic clk,
	input logic rst,
	input logic done);
	

	//fixed point scaling factor = Q15.16
	localparam SF = 2.0**-16.0; 
	localparam [31:0] learn_rate =      32'b00000000000000000011001100000000;//b00000000001100110000000000000000;//32'b00000000001100110011001100110011;//32'b00000000000000000011001100110011;//32'b00000000_001100110011001100110011; //0.2 00000000001100110011001100110011
	localparam [31:0] discount_factor = 32'b00000000000000001110011000000000;//b00000000111001100000000000000000;//decrease precision 32'b00000000111001100110011001100110;//32'b00000000000000001110011001100110;//32'b00000000_111001100110011001100110; //0.9 00000000111001100110011001100110
	logic [63:0] discount_x_max_Q;
	logic [31:0] disc_trim;
	logic [31:0] plus_reward;
	logic [31:0] min_Q;
	logic [31:0] min_Q_F;
	logic [63:0] X_learn;
	logic [31:0] X_learn_Trim;
	logic [31:0] reward_shift;
	//testing assignments
//	assign old_Q[5][2] = 32'b00000000000001101110011000000000;//b00000110111000000000000000000000;//32'b00000110111001100110011001100110;//32'b00000000000001101110011001100110;//32'b00000110111000111101011100001010 //6.9
//	assign max_Q = 32'b00000000000001010000000000000000;//b00000101000000000000000000000000;//32'b00000101000000000000000000000000;//32'b00000000000001010000000000000000;//32'b00000101000000000000000000000000 //5
//	assign maze_state = 6'd5;
//	assign action = 3'd2;
//	assign reward = 32'd10;
//	assign	old_Q [1][1] = 32'b00000000000000000001011100010111;
//	assign	action = 1;
//	assign	reward = 0;
//	assign	maze_state = 1;
//	assign	max_Q = 32'b00000000000000000001011100010111;
//	assign done = 1;
	//assign X_learn_Trim = 32'd0;
	
	logic done_clk;
	always_ff @(clk)
	begin
		if (done == 1)
			done_clk = clk;
		else 
			done_clk = 0;
	end
	always @(posedge done_clk)
	begin
	//	done_o = 0;
		//convert back to 32 bit Q7.24
		//not actually needed for now
		//result = max_Q*discount_factor;
		//discount_x_max_Q = result[47:15];
		discount_x_max_Q = max_Q*discount_factor;
		disc_trim = discount_x_max_Q[47:16];//[56:24];
		reward_shift = reward << 16;
		plus_reward = reward_shift + disc_trim;
		min_Q = plus_reward - old_Q[maze_state][action];
		if (min_Q[31] == 1)
		begin
			min_Q_F = ~min_Q;
		end
		else
		begin
			min_Q_F = min_Q;
		end
		X_learn = min_Q_F * learn_rate;
		//Probably need to remove the first and last 16 bits of X_learn
//		X_learn_Trim = 32'd0;
		X_learn_Trim = X_learn[47:16];//[56:24];// X_learn << 32;
		if (min_Q[31] == 1)
		begin
			X_learn_Trim = ~X_learn_Trim;
		end
		else
			X_learn_Trim = X_learn_Trim;
		//X_learn_Trim = X_learn >>> 32;
		new_Q = old_Q;
		new_Q[maze_state][action] = old_Q[maze_state][action] + X_learn_Trim;//add old_Q to the middle 32 bits of X_learn
		done_o = 1;
	end
endmodule
