module Q_LEARN_TB();
	
	logic clk;
	logic rst;
	logic [31:0] final_Q[37][4];
	logic move_complete;
	logic [5:0] maze_state;
	logic [5:0] next_state;
	logic timer_start;
	logic target_reached;
	logic [5:0]start_state;
	logic [5:0] blocked[16];
	logic [5:0]target_state;
	
	//testing values
	logic test_complete;
	logic [7:0]blocked_pass;
	logic [7:0]blocked_fail;
	Q_LEARN_V2 Q_LEARN_TEST(
	.clk(clk),
	.rst(rst),
	.final_Q(final_Q),
	.move_complete(move_complete),
	.maze_state(maze_state),
	.next_state(next_state),
	.timer_start(timer_start),
	.target_reached(target_reached),
	.start_state(start_state),
	.blocked(blocked),
	.target_state(target_state));
	
	//this clock is a modified version of one taken from a TB I made for elec241
	initial begin
		test_complete = 0;
		rst = 1;
		clk = 1;
		move_complete = 1;
		maze_state = 0;
		forever // run clock forever
		begin
			#10ns clk = ~clk; //10ns duty cycle for 20ns period and 50MHz clock
			if (test_complete == 1) break;//stop clock when the final test is complete
		end
	end
	
	initial
	begin
	#5ms;
		@(posedge clk)
		test_complete = 1;
	end
	
endmodule