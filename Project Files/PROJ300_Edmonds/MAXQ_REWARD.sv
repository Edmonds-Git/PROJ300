//this module now finds the maximum Q value the next action and the reward, these will be used to break down the update Q function into multiple modules

module MAXQ_REWARD (
//output shortreal Q [36][4], // Q will be updated in a different module
	output logic [31:0] max_Q,
	output logic [2:0] action,
	output logic [3:0] reward,
	input logic  [31:0] old_Q [37][4],
	input logic [5:0] maze_state,
	input logic clk,
	input logic rst);
//	input shortreal learn_rate, //will be part of different module
//	input shortreal discount_factor); //will be part of different module
	
	
//	shortreal current_Q = old_Q(maze_state,0);
//	shortreal current_Q[1][4] = {old_Q[maze_state][0], old_Q[maze_state][1],old_Q[maze_state][2],old_Q[maze_state][3]};
	logic [31:0] current_Q[4];
	always@(old_Q)
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
	end
	
	always@(action)
	begin
//		Q = old_Q + learn_rate*(reward(maze_state,action) + discount_factor*max_Q - old_Q); //going to be broken down into seperate modules
		if ((maze_state == 35 && action == 1) || (maze_state == 30 && action == 0))
			reward = 10;
		else
			reward = 0;
	end
	
	
	// this code might be useful later but for now I am going to leave working out how to convert from coordinates to state values for when I need to
//	logic [3:0]location [1][2];
//	logic [5:0]cstate;
//	
//	always_comb
//	begin
//		location(1,1) = 
//		location(1,2) = 
//	end
//
//	always_comb
//	begin
//		case({location(1,1),location(1,2)})
//			{4'd0,4'd0}:cstate = 1;
//			{4'd0,4'd1}:cstate = 2;
//			{4'd0,4'd2}:cstate = 3;
//			{4'd0,4'd3}:cstate = 4;
//			{4'd0,4'd4}:cstate = 5;
//			{4'd0,4'd5}:cstate = 6;
//			{4'd1,4'd0}:cstate = 7;
//			{4'd1,4'd1}:cstate = 8;
//			{4'd1,4'd2}:cstate = 9;
//			{4'd1,4'd3}:cstate = 10;
//			{4'd1,4'd4}:cstate = 11;
//			{4'd1,4'd5}:cstate = 12;
//			{4'd2,4'd0}:cstate = 13;
//			{4'd2,4'd1}:cstate = 14;
//			{4'd2,4'd2}:cstate = 15;
//			{4'd2,4'd3}:cstate = 16;
//			{4'd2,4'd4}:cstate = 17;
//			{4'd2,4'd5}:cstate = 18;
//			{4'd3,4'd0}:cstate = 19;
//			{4'd3,4'd1}:cstate = 20;
//			{4'd3,4'd2}:cstate = 21;
//			{4'd3,4'd3}:cstate = 22;
//			{4'd3,4'd4}:cstate = 23;
//			{4'd3,4'd5}:cstate = 24;
//			{4'd4,4'd0}:cstate = 25;
//			{4'd4,4'd1}:cstate = 26;
//			{4'd4,4'd2}:cstate = 27;
//			{4'd4,4'd3}:cstate = 28;
//			{4'd4,4'd4}:cstate = 29;
//			{4'd4,4'd5}:cstate = 30;
//			{4'd5,4'd0}:cstate = 31;
//			{4'd5,4'd1}:cstate = 32;
//			{4'd5,4'd2}:cstate = 33;
//			{4'd5,4'd3}:cstate = 34;
//			{4'd5,4'd4}:cstate = 35;
//			{4'd5,4'd5}:cstate = 36;
//		endcase
//	end
			
	
endmodule