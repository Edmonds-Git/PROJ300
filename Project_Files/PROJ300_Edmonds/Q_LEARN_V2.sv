module Q_LEARN_V2(
	input clk,
	input rst,
	input rdy,
	output final_action,
	output final_maze_state);
	
	wire [31:0] new_Q_1[37][4];
	//wire [31:0] new_Q_2[37][4];
	wire [5:0] blocked[16];
	wire [31:0] new_Q_episodes [100+1] [37][4];
	wire [5:0] maze_state_episodes [100+1];
	wire [31:0] max_Q_episodes [100+1];
	wire [2:0] action_episodes [100+1];
	wire [31:0] reward_episodes [100+1];
	INIT_Q INIT_Q (
		.clk(clk), .rst(rst), .new_Q(new_Q_1));
		
	BLOCKED_STATES BLOCKED_STATES (
		.old_Q(new_Q_1), .clk(clk), .rst(rst), .new_Q(new_Q_episodes[0]), .start_state(maze_state_episodes[0]), .blocked(blocked));
		
//	MAXQ_REWARD MAXQ_REWARD(
//		.old_Q(new_Q_2), .maze_state(maze_state_episodes[0]), .clk(clk), .rst(rst), .max_Q(max_Q_episodes[0]), .action(action), .reward(reward)); 
//	
	genvar episode;
	generate
		for (episode = 0; episode < 100; episode = episode + 1) 
		begin:Q_LEARN
			MAXQ_REWARD MAXQ_REWARD(
			.old_Q(new_Q_episodes[episode]), .maze_state(maze_state_episodes[episode]), .clk(clk), .rst(rst), .max_Q(max_Q_episodes[episode]), .action(action_episodes[episode]), .reward(reward_episodes[episode]));
			
			NEW_Q NEW_Q(
			.old_Q(new_Q_episodes[episode]), .maze_state(maze_state_episodes[episode]), .clk(clk), .rst(rst), .max_Q(max_Q_episodes[episode]), .action(action_episodes[episode]), .reward(reward_episodes[episode]), .new_Q(new_Q_episodes[episode+1]));
			
			Q_TRIAL Q_TRIAL(
			.old_Q(new_Q_episodes[episode]), .action(action_episodes[episode]), .clk(clk), .rst(rst), .maze_state(maze_state_episodes[episode]), .blocked(blocked), .next_state(maze_state_episodes[episode+1]), .start_state(maze_state_episodes[0]), .target_state(target_state));
		end
	endgenerate
endmodule 