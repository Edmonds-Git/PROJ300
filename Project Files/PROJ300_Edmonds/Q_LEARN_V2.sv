module Q_LEARN_V2 #(parameter int unsigned N=11)(
	input logic clk,
	input logic rst,
//	input logic move_complete,
//	input logic [5:0]maze_state,
//	output [31:0] final_Q [37][4],
//	output logic [5:0]next_state,
//	output logic timer_start,
//	output logic target_reached,
	output logic [31:0] final_Q[37][4],
	input logic move_complete,
	input logic [5:0] maze_state,
	output logic [5:0] next_state,
	output logic timer_start,
	output logic target_reached,
	output logic [5:0]start_state,
	output logic [5:0] blocked[16],
	output logic [5:0]target_state);
	
	wire logic [31:0] new_Q_1[37][4];
	//wire [31:0] new_Q_2[37][4];
	wire logic [31:0] blocked_Q [37][4];
//	wire logic [5:0] blocked[16];
	wire logic [31:0] new_Q_episodes [N] [37][4];
	wire logic [5:0] maze_state_episodes [N];
	wire logic [31:0] max_Q_episodes [N];
	wire logic [3:0] action_episodes [N];
	wire logic [3:0] reward_episodes [N];
//	wire logic [5:0]target_state;
//	wire logic [5:0]start_state;
//	wire logic [31:0] final_Q [37][4];
	wire logic done;
	wire logic done1 [N];
	wire logic done_o [N];
	wire logic done2 [N];
	//wire logic done_init;
	//logic [7:0] i; 
	INIT_Q INIT_Q (
		.clk(clk), .rst(rst), .new_Q(new_Q_1));
//		
//	always@
//		
	BLOCKED_STATES BLOCKED_STATES (
		.old_Q(new_Q_1), .clk(clk), .rst(rst), .new_Q(new_Q_episodes[0]), .start_state(start_state), .blocked(blocked), .target_state(target_state), .done(done));
	assign maze_state_episodes[0] = start_state;
//	always@*
//	begin
//		if (new_Q_episodes[0][0][0] == 'z)
//	assign	 new_Q_episodes[N:0] = '{default:blocked_Q}; //{101{new_Q_episodes}}
//	end

//	always@(posedge done_clk)
//	begin
//		if (done == 1 && done_init != 1)
//		begin
//			for (i = 0; i <= N-1 ; i = i + 1) 
//			begin
//				new_Q_episodes[i] = blocked_Q;
//				if (i == N)
//				done_init = 1;
//			end
//		end
//	end

//	MAXQ_REWARD MAXQ_REWARD(
//		.old_Q(new_Q_2), .maze_state(maze_state_episodes[0]), .clk(clk), .rst(rst), .max_Q(max_Q_episodes[0]), .action(action), .reward(reward)); 
//	
	MAXQ_REWARD MAXQ_REWARD_init(
			.done(done), .done_o(done1[0]), .old_Q(new_Q_episodes[0]), .maze_state(maze_state_episodes[0]), .clk(clk), .rst(rst), .max_Q(max_Q_episodes[0]), .action(action_episodes[0]), .reward(reward_episodes[0]));
	genvar episode;
//	generate
//		for (episode = 0; episode < N-1; episode = episode + 1) 
//		begin:Q_LEARN
//			MAXQ_REWARD MAXQ_REWARD_episode(
//			.done(done_o[episode]), .done_o(done1[episode]), .old_Q(new_Q_episodes[episode]), .maze_state(maze_state_episodes[episode+1]), .clk(clk), .rst(rst), .max_Q(max_Q_episodes[episode+1]), .action(action_episodes[episode+1]), .reward(reward_episodes[episode+1]));
//			if (episode == N)
//				NEW_Q NEW_Q_episode(
//				.done(done1[episode]), .done_o(done2[episode]), .old_Q(new_Q_episodes[episode]), .maze_state(maze_state_episodes[episode]), .clk(clk), .rst(rst), .max_Q(max_Q_episodes[episode]), .action(action_episodes[episode]), .reward(reward_episodes[episode]), .new_Q(final_Q));
//			else
//				NEW_Q NEW_Q_episode(
//				.done(done1[episode]), .done_o(done2[episode]), .old_Q(new_Q_episodes[episode]), .maze_state(maze_state_episodes[episode]), .clk(clk), .rst(rst), .max_Q(max_Q_episodes[episode]), .action(action_episodes[episode]), .reward(reward_episodes[episode]), .new_Q(new_Q_episodes[episode+1]));
//			
//			Q_TRIAL Q_TRIAL_episode(
//			.done(done2[episode]), .done_o(done_o[episode+1]), .old_Q(new_Q_episodes[episode]), .action(action_episodes[episode]), .clk(clk), .rst(rst), .maze_state(maze_state_episodes[episode]), .blocked(blocked), .next_state(maze_state_episodes[episode+1]), .start_state(maze_state_episodes[0]), .target_state(target_state));
//		end
//	endgenerate
	generate
		for (episode = 0; episode < N-1; episode = episode + 1) 
		begin:Q_LEARN
			if (episode == N)
				NEW_Q NEW_Q_episode(
				.done(done1[episode]), .done_o(done2[episode]), .old_Q(new_Q_episodes[episode]), .maze_state(maze_state_episodes[episode]), .clk(clk), .rst(rst), .max_Q(max_Q_episodes[episode]), .action(action_episodes[episode]), .reward(reward_episodes[episode]), .new_Q(final_Q));
			else
				NEW_Q NEW_Q_episode(
				.done(done1[episode]), .done_o(done2[episode]), .old_Q(new_Q_episodes[episode]), .maze_state(maze_state_episodes[episode]), .clk(clk), .rst(rst), .max_Q(max_Q_episodes[episode]), .action(action_episodes[episode]), .reward(reward_episodes[episode]), .new_Q(new_Q_episodes[episode+1]));
			Q_TRIAL Q_TRIAL_episode(
			.done(done2[episode]), .done_o(done_o[episode]), .old_Q(new_Q_episodes[episode]), .action(action_episodes[episode]), .clk(clk), .rst(rst), .maze_state(maze_state_episodes[episode]), .blocked(blocked), .next_state(maze_state_episodes[episode+1]), .start_state(maze_state_episodes[0]), .target_state(target_state));
			MAXQ_REWARD MAXQ_REWARD_episode(
			.done(done_o[episode]), .done_o(done1[episode+1]), .old_Q(new_Q_episodes[episode+1]), .maze_state(maze_state_episodes[episode]), .clk(clk), .rst(rst), .max_Q(max_Q_episodes[episode+1]), .action(action_episodes[episode+1]), .reward(reward_episodes[episode+1]));
			
		end
	endgenerate
	
	Q_EXPLOIT Q_EXPLOIT (
	.clk(clk),
	.rst(rst),
	.final_Q(final_Q),
	.blocked(blocked),
	.target_state(target_state),
	.start_state(start_state),
	.move_complete(move_complete),
	.maze_state(maze_state),
	.next_state(next_state),
	.timer_start(timer_start));
//	.target_reached(target_reached));
//	assign final_Q = new_Q_episodes [100];
//	Q_EXPLOIT Q_EXPLOIT (
//		.clk(clk), .rst(rst), .final_Q(final_Q), .blocked(blocked), .target_state(target_state), .start_state(start_state), .move_complete(move_complete),.maze_state(maze_state), .next_state(next_state), .timer_start(timer_start), .target_reached(target_reached));
	always@(posedge clk)
	begin
	if (maze_state == target_state)
		target_reached = 1;
	else
		target_reached = 0;
	end

endmodule 