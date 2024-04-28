module Q_LEARN_V2(
	input clk,
	input rst,
	input move_complete,
	input [5:0]maze_state,
	//output [31:0] final_Q [37][4],
	//output [5:0] blocked[16],
	//output [5:0]target_state,
	//output [5:0]start_state);
	output [5:0]next_state,
	output timer_start,
	output target_reached);
	
	wire [31:0] new_Q_1[37][4];
	//wire [31:0] new_Q_2[37][4];
	wire [5:0] blocked[16];
	wire [31:0] new_Q_episodes [100+1] [37][4];
	wire [5:0] maze_state_episodes [100+1];
	wire [31:0] max_Q_episodes [100+1];
	wire [2:0] action_episodes [100+1];
	wire [31:0] reward_episodes [100+1];
	wire [5:0]target_state;
	wire [5:0]start_state;
//	assign final_Q = new_Q_episodes [100+1];
	
	INIT_Q INIT_Q (
		.clk(clk), .rst(rst), .new_Q(new_Q_1));
		
	BLOCKED_STATES BLOCKED_STATES (
		.old_Q(new_Q_1), .clk(clk), .rst(rst), .new_Q(new_Q_episodes[0]), .start_state(start_state), .blocked(blocked), .target_state(target_state));
	assign maze_state_episodes[0] = start_state;
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
	Q_EXPLOIT Q_EXPLOIT (
		.clk(clk), .rst(rst), .final_Q(new_Q_episodes[100]), .blocked(blocked), .target_state(target_state), .start_state(start_state), .move_complete(move_complete),.maze_state(maze_state), .next_state(next_state), .timer_start(timer_start), .target_reached(target_reached));
endmodule 