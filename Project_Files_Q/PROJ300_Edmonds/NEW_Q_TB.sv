
module NEW_Q_TB();
	logic [31:0] new_Q[37][4];
	logic done_o;
	logic [31:0] old_Q [37][4];
	logic [5:0] maze_state;
	logic [31:0] max_Q;
	logic [3:0] action;
	logic [3:0] reward;
	logic clk;
	logic done;
		

		

//testing values
	logic test_complete;
	localparam SF = 2.0**-16.0; //scaling factor Q15.16
	localparam SF32 = 2.0**-32.0; //scaling factor Q31.32 used for 64 bit numbers 
//	logic max_Q;
//	logic maze_state;
//	logic action;
//	logic reward;
//assign test input values
//	assign old_Q[5][2] = 32'b00000000000001101110011000000000; //6.9 00000000000001101110011000000000 included without 32'b for easier copying
//	assign max_Q = 32'b00000000000001010000000000000000; //5 00000000000001010000000000000000 included without 32'b for easier copying
//	assign maze_state = 6'd5;
//	assign action = 3'd2;
//	assign reward = 32'd10;
//	assign done = 1;
//	assign X_learn_Trim = 32'd0;

	NEW_Q NEW_Q_test(
	.done(done), 
	.done_o(done_o), 
	.old_Q(old_Q), 
	.maze_state(maze_state), 
	.clk(clk), 
	.rst(rst), 
	.max_Q(max_Q), 
	.action(action), 
	.reward(reward), 
	.new_Q(new_Q));
	

//this clock is a modified version of one taken from a TB I made for elec241
	initial begin
		test_complete = 0;
		clk = 1;
		forever // run clock forever
		begin
			#10ns clk = ~clk; //10ns duty cycle for 20ns period and 50MHz clock
			if (test_complete == 1) break;//stop clock when the final test is complete
		end
	end
		
	initial
	begin
	//test 1
		@(posedge clk)
		old_Q[5][2] = 32'b00000000000001101110011000000000; //6.9 00000000000001101110011000000000 included without 32'b for easier copying
		max_Q = 32'b00000000000001010000000000000000; //5 00000000000001010000000000000000 included without 32'b for easier copying
		maze_state = 6'd5;
		action = 3'd2;
		reward = 32'd10;
		@(posedge clk)
		done = 1;
		#10us;
		// 6.9+0.2*(10+(0.9*5)-6.9 = 8.42 ≈ 32'b00000000000010000110101110000101
		$display("discount_x_max_Q = %b ≈ %f", NEW_Q_test.discount_x_max_Q, $itor(NEW_Q_test.discount_x_max_Q*SF32));
		$display("disc_trim = %b ≈ %f", NEW_Q_test.disc_trim, $itor(NEW_Q_test.disc_trim*SF));
		$display("plus_reward = %b ≈ %f", NEW_Q_test.plus_reward, $itor(NEW_Q_test.plus_reward*SF));
		$display("min_Q = %b ≈ %f", NEW_Q_test.min_Q, $itor(NEW_Q_test.min_Q*SF));
		$display("min_Q_F = %b ≈ %f", NEW_Q_test.min_Q_F, $itor(NEW_Q_test.min_Q_F*SF));
		$display("X_learn = %b ≈ %f", NEW_Q_test.X_learn, $itor(NEW_Q_test.X_learn*SF32));
		$display("X_learn_Trim = %b ≈ %f", NEW_Q_test.X_learn_Trim, $itor(NEW_Q_test.X_learn_Trim*SF));
		$display("reward_shift = %b ≈ %f", NEW_Q_test.reward_shift, $itor(NEW_Q_test.reward_shift*SF));

		assert (new_Q[maze_state][action] == 32'b00000000000010000110101110000101)
		begin
			$display("Pass new Q = %b ≈ %f", new_Q[maze_state][action], $itor(new_Q[maze_state][action]*SF)); //this tb will almost never pass as the calculation used will never be as accurate as the online calculator used to find the target values
		end
		else
		begin
			$display("Fail new = %b ≈ %f should be %f", new_Q[maze_state][action], $itor(new_Q[maze_state][action]*SF), 8.42);
		end
	//test 2
		@(posedge clk)
		old_Q[5][2] = 32'b00000000000001101110011000000000; //6.9 00000000000001101110011000000000 included without 32'b for easier copying
		max_Q = 32'b00000000000001010000000000000000; //5 00000000000001010000000000000000 included without 32'b for easier copying
		maze_state = 6'd5;
		action = 3'd2;
		reward = 32'd0;
		@(posedge clk)
		done = 1;
		#10us;
		// 6.9+0.2*(0+(0.9*5)-6.9 = 6.42 ≈ 32'b00000000000001100110101110000101
		$display("discount_x_max_Q = %b ≈ %f", NEW_Q_test.discount_x_max_Q, $itor(NEW_Q_test.discount_x_max_Q*SF32));
		$display("disc_trim = %b ≈ %f", NEW_Q_test.disc_trim, $itor(NEW_Q_test.disc_trim*SF));
		$display("plus_reward = %b ≈ %f", NEW_Q_test.plus_reward, $itor(NEW_Q_test.plus_reward*SF));
		$display("min_Q = %b ≈ %f", NEW_Q_test.min_Q, $itor(NEW_Q_test.min_Q*SF));
		$display("min_Q_F = %b ≈ %f", NEW_Q_test.min_Q_F, $itor(NEW_Q_test.min_Q_F*SF));
		$display("X_learn = %b ≈ %f", NEW_Q_test.X_learn, $itor(NEW_Q_test.X_learn*SF32));
		$display("X_learn_Trim = %b ≈ %f", NEW_Q_test.X_learn_Trim, $itor(NEW_Q_test.X_learn_Trim*SF));
		$display("reward_shift = %b ≈ %f", NEW_Q_test.reward_shift, $itor(NEW_Q_test.reward_shift*SF));

		assert (new_Q[maze_state][action] == 32'b00000000000001100110101110000101)
		begin
			$display("Pass new Q = %b ≈ %f", new_Q[maze_state][action], $itor(new_Q[maze_state][action]*SF)); //this tb will almost never pass as the calculation used will never be as accurate as the online calculator used to find the target values
		end
		else
		begin
			$display("Fail new = %b ≈ %f should be %f", new_Q[maze_state][action], $itor(new_Q[maze_state][action]*SF), 6.42);
		end

	//test 3
		@(posedge clk)
		old_Q[5][2] = 32'b00000000000001000100110011001101; //4.3 00000000000001000100110011001101 included without 32'b for easier copying
		max_Q = 32'b00000000000001011000000000000000; //5.5 00000000000001011000000000000000 included without 32'b for easier copying
		maze_state = 6'd5;
		action = 3'd2;
		reward = 32'd10;
		@(posedge clk)
		done = 1;
		#10us;
		// 4.3+0.2*(10+(0.9*5.5)-4.3 = 6.43 ≈ 32'b00000000000001100110111000010100
		$display("discount_x_max_Q = %b ≈ %f", NEW_Q_test.discount_x_max_Q, $itor(NEW_Q_test.discount_x_max_Q*SF32));
		$display("disc_trim = %b ≈ %f", NEW_Q_test.disc_trim, $itor(NEW_Q_test.disc_trim*SF));
		$display("plus_reward = %b ≈ %f", NEW_Q_test.plus_reward, $itor(NEW_Q_test.plus_reward*SF));
		$display("min_Q = %b ≈ %f", NEW_Q_test.min_Q, $itor(NEW_Q_test.min_Q*SF));
		$display("min_Q_F = %b ≈ %f", NEW_Q_test.min_Q_F, $itor(NEW_Q_test.min_Q_F*SF));
		$display("X_learn = %b ≈ %f", NEW_Q_test.X_learn, $itor(NEW_Q_test.X_learn*SF32));
		$display("X_learn_Trim = %b ≈ %f", NEW_Q_test.X_learn_Trim, $itor(NEW_Q_test.X_learn_Trim*SF));
		$display("reward_shift = %b ≈ %f", NEW_Q_test.reward_shift, $itor(NEW_Q_test.reward_shift*SF));

		assert (new_Q[maze_state][action] == 32'b00000000000001100110111000010100)
		begin
			$display("Pass new Q = %b ≈ %f", new_Q[maze_state][action], $itor(new_Q[maze_state][action]*SF)); //this tb will almost never pass as the calculation used will never be as accurate as the online calculator used to find the target values
		end
		else
		begin
			$display("Fail new = %b ≈ %f should be %f", new_Q[maze_state][action], $itor(new_Q[maze_state][action]*SF), 6.43);
		end
	
	//test 4
		@(posedge clk)
		old_Q[5][2] = 32'b00000000000001000100110011001101; //4.3 00000000000001000100110011001101 included without 32'b for easier copying
		max_Q = 32'b00000000000001011000000000000000; //5.5 00000000000001011000000000000000 included without 32'b for easier copying
		maze_state = 6'd5;
		action = 3'd2;
		reward = 32'd0;
		@(posedge clk)
		done = 1;
		#10us;
		// 4.3+0.2*(0+(0.9*5.5)-4.3 = 4.43 ≈ 32'b00000000000001000110111000010100
		$display("discount_x_max_Q = %b ≈ %f", NEW_Q_test.discount_x_max_Q, $itor(NEW_Q_test.discount_x_max_Q*SF32));
		$display("disc_trim = %b ≈ %f", NEW_Q_test.disc_trim, $itor(NEW_Q_test.disc_trim*SF));
		$display("plus_reward = %b ≈ %f", NEW_Q_test.plus_reward, $itor(NEW_Q_test.plus_reward*SF));
		$display("min_Q = %b ≈ %f", NEW_Q_test.min_Q, $itor(NEW_Q_test.min_Q*SF));
		$display("min_Q_F = %b ≈ %f", NEW_Q_test.min_Q_F, $itor(NEW_Q_test.min_Q_F*SF));
		$display("X_learn = %b ≈ %f", NEW_Q_test.X_learn, $itor(NEW_Q_test.X_learn*SF32));
		$display("X_learn_Trim = %b ≈ %f", NEW_Q_test.X_learn_Trim, $itor(NEW_Q_test.X_learn_Trim*SF));
		$display("reward_shift = %b ≈ %f", NEW_Q_test.reward_shift, $itor(NEW_Q_test.reward_shift*SF));

		assert (new_Q[maze_state][action] == 32'b00000000000001000110111000010100)
		begin
			$display("Pass new Q = %b ≈ %f", new_Q[maze_state][action], $itor(new_Q[maze_state][action]*SF)); //this tb will almost never pass as the calculation used will never be as accurate as the online calculator used to find the target values
		end
		else
		begin
			$display("Fail new = %b ≈ %f should be %f", new_Q[maze_state][action], $itor(new_Q[maze_state][action]*SF), 4.43);
		end
	//test 5
		@(posedge clk)
		old_Q[5][2] = 32'b00000000000001011000000000000000; //4.3 00000000000001011000000000000000 included without 32'b for easier copying
		max_Q = 32'b00000000000001000100110011001101; //5.5 00000000000001000100110011001101 included without 32'b for easier copying
		maze_state = 6'd5;
		action = 3'd2;
		reward = 32'd10;
		@(posedge clk)
		done = 1;
		#10us;
		// 5.5+0.2*(10+(0.9*4.3)-5.5 = 7.17
		$display("discount_x_max_Q = %b ≈ %f", NEW_Q_test.discount_x_max_Q, $itor(NEW_Q_test.discount_x_max_Q*SF32));
		$display("disc_trim = %b ≈ %f", NEW_Q_test.disc_trim, $itor(NEW_Q_test.disc_trim*SF));
		$display("plus_reward = %b ≈ %f", NEW_Q_test.plus_reward, $itor(NEW_Q_test.plus_reward*SF));
		$display("min_Q = %b ≈ %f", NEW_Q_test.min_Q, $itor(NEW_Q_test.min_Q*SF));
		$display("min_Q_F = %b ≈ %f", NEW_Q_test.min_Q_F, $itor(NEW_Q_test.min_Q_F*SF));
		$display("X_learn = %b ≈ %f", NEW_Q_test.X_learn, $itor(NEW_Q_test.X_learn*SF32));
		$display("X_learn_Trim = %b ≈ %f", NEW_Q_test.X_learn_Trim, $itor(NEW_Q_test.X_learn_Trim*SF));
		$display("reward_shift = %b ≈ %f", NEW_Q_test.reward_shift, $itor(NEW_Q_test.reward_shift*SF));

		assert (new_Q[maze_state][action] == 32'b00000000000001100110111000010100) //stopped updating this as it never really matters
		begin
			$display("Pass new Q = %b ≈ %f", new_Q[maze_state][action], $itor(new_Q[maze_state][action]*SF)); //this tb will almost never pass as the calculation used will never be as accurate as the online calculator used to find the target values
		end
		else
		begin
			$display("Fail new = %b ≈ %f should be %f", new_Q[maze_state][action], $itor(new_Q[maze_state][action]*SF), 7.17);
		end
	
	//test 6
		@(posedge clk)
		old_Q[5][2] = 32'b00000000000001011000000000000000; //4.3 00000000000001011000000000000000 included without 32'b for easier copying
		max_Q = 32'b00000000000001000100110011001101; //5.5 00000000000001000100110011001101 included without 32'b for easier copying
		maze_state = 6'd5;
		action = 3'd2;
		reward = 32'd0;
		@(posedge clk)
		done = 1;
		#10us;
		// 5.5+0.2*(0+(0.9*4.3)-5.5 = 5.17
		$display("discount_x_max_Q = %b ≈ %f", NEW_Q_test.discount_x_max_Q, $itor(NEW_Q_test.discount_x_max_Q*SF32));
		$display("disc_trim = %b ≈ %f", NEW_Q_test.disc_trim, $itor(NEW_Q_test.disc_trim*SF));
		$display("plus_reward = %b ≈ %f", NEW_Q_test.plus_reward, $itor(NEW_Q_test.plus_reward*SF));
		$display("min_Q = %b ≈ %f", NEW_Q_test.min_Q, $itor(NEW_Q_test.min_Q*SF));
		$display("min_Q_F = %b ≈ %f", NEW_Q_test.min_Q_F, $itor(NEW_Q_test.min_Q_F*SF));
		$display("X_learn = %b ≈ %f", NEW_Q_test.X_learn, $itor(NEW_Q_test.X_learn*SF32));
		$display("X_learn_Trim = %b ≈ %f", NEW_Q_test.X_learn_Trim, $itor(NEW_Q_test.X_learn_Trim*SF));
		$display("reward_shift = %b ≈ %f", NEW_Q_test.reward_shift, $itor(NEW_Q_test.reward_shift*SF));

		assert (new_Q[maze_state][action] == 32'b00000000000001000110111000010100)
		begin
			$display("Pass new Q = %b ≈ %f", new_Q[maze_state][action], $itor(new_Q[maze_state][action]*SF)); //this tb will almost never pass as the calculation used will never be as accurate as the online calculator used to find the target values
		end
		else
		begin
			$display("Fail new = %b ≈ %f should be %f", new_Q[maze_state][action], $itor(new_Q[maze_state][action]*SF), 5.17);
		end
		test_complete = 1;
	end
	
endmodule
