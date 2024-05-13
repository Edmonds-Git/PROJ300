//this module now finds the maximum Q value the next action and the reward, these will be used to break down the update Q function into multiple modules

module MAXQ_REWARD (
	output logic [31:0] max_Q,
	output logic [3:0] action,
	output logic [3:0] reward,
	output logic done_o,
	input logic  [31:0] old_Q [37][4],
	input logic [5:0] maze_state,
	input logic clk,
	input logic rst,
	input logic done);

	logic [31:0] current_Q[4];
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
		current_Q = old_Q[maze_state];
		if (current_Q[0] > current_Q[1] && current_Q[0] > current_Q[2] && current_Q[0] > current_Q[3])
			begin
				max_Q = current_Q[0];
				action  = 3'd0;
			end
		else if (current_Q[1] > current_Q[0] && current_Q[1] > current_Q[2] && current_Q[1] > current_Q[3])
			begin
				max_Q = current_Q[1];
				action  = 3'd1;
			end
		else if (current_Q[2] > current_Q[1] && current_Q[2] > current_Q[0] && current_Q[2] > current_Q[3])
			begin
				max_Q = current_Q[2];
				action  = 3'd2;
			end
		else if (current_Q[3] > current_Q[1] && current_Q[3] > current_Q[2] && current_Q[3] > current_Q[0])
			begin
				max_Q = current_Q[3];
				action  = 3'd3;
			end
		done_o = 1;
	end
	
	always@(posedge clk) //needs changing to allow for different final states
	begin
		if ((maze_state == 35 && action == 1) || (maze_state == 30 && action == 0))
			reward = 10;
		else
			reward = 0;
	end
	
	

	
endmodule
