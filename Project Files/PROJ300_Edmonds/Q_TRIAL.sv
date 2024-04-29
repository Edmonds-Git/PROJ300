module Q_TRIAL(
	output logic [5:0] next_state,
	//output logic target_reached,
	input logic clk,
	input logic rst,
	input logic [31:0] old_Q [37][4],
	input logic [3:0] action,
	input logic [5:0] maze_state,
	input logic [5:0] blocked [16],
	input logic [5:0] target_state,
	input logic [5:0] start_state);
	
	
//	always_comb
//	begin
//		new_count = episode_count + 1;
//	end
	
	always_ff @(old_Q or rst)
		begin
			if (maze_state == target_state)
				next_state = start_state;
			else
			begin
				case(action)
				default: next_state = maze_state;
				0: begin 
						if ((maze_state + 6 <= 36) && (maze_state + 6 != blocked[0] || maze_state + 6 != blocked[1] || maze_state + 6 != blocked[2] || maze_state + 6 != blocked[3] || maze_state + 6 != blocked[4] || maze_state + 6 != blocked[5] || maze_state + 6 != blocked[6] || maze_state + 6 != blocked[7] || maze_state + 6 != blocked[8] || maze_state + 6 != blocked[9] || maze_state + 6 != blocked[10] || maze_state + 6 != blocked[11] || maze_state + 6 != blocked[12] || maze_state + 6 != blocked[13] || maze_state + 6 != blocked[14] || maze_state + 6 != blocked[15]))
							next_state = maze_state + 6'd6;
						else
							next_state = maze_state;
					end
				1: begin 
						if ((maze_state + 1 <= 36) && (maze_state + 1 != blocked[0] || maze_state + 1 != blocked[1] || maze_state + 1 != blocked[2] || maze_state + 1 != blocked[3] || maze_state + 1 != blocked[4] || maze_state + 1 != blocked[5] || maze_state + 1 != blocked[6] || maze_state + 1 != blocked[7] || maze_state + 1 != blocked[8] || maze_state + 1 != blocked[9] || maze_state + 1 != blocked[10] || maze_state + 1 != blocked[11] || maze_state + 1 != blocked[12] || maze_state + 1 != blocked[13] || maze_state + 1 != blocked[14] || maze_state + 1 != blocked[15] || maze_state + 1 != 7 || maze_state + 1 != 13 || maze_state + 1 != 19 || maze_state + 1 != 25 || maze_state + 1 != 31))
							next_state = maze_state + 6'd1;
						else
							next_state = maze_state;
					end
				2: begin 
						if ((maze_state - 6 >= 1) && (maze_state - 6 != blocked[0] || maze_state - 6 != blocked[1] || maze_state - 6 != blocked[2] || maze_state - 6 != blocked[3] || maze_state - 6 != blocked[4] || maze_state - 6 != blocked[5] || maze_state - 6 != blocked[6] || maze_state - 6 != blocked[7] || maze_state - 6 != blocked[8] || maze_state - 6 != blocked[9] || maze_state - 6 != blocked[10] || maze_state - 6 != blocked[11] || maze_state - 6 != blocked[12] || maze_state - 6 != blocked[13] || maze_state - 6 != blocked[14] || maze_state - 6 != blocked[15]))
							next_state = maze_state - 6'd6;
						else
							next_state = maze_state;
					end
				3: begin 
						if ((maze_state + 1 <= 36) && (maze_state - 1 != blocked[0] || maze_state - 1 != blocked[1] || maze_state - 1 != blocked[2] || maze_state - 1 != blocked[3] || maze_state - 1 != blocked[4] || maze_state - 1 != blocked[5] || maze_state - 1 != blocked[6] || maze_state - 1 != blocked[7] || maze_state - 1 != blocked[8] || maze_state - 1 != blocked[9] || maze_state - 1 != blocked[10] || maze_state - 1 != blocked[11] || maze_state - 1 != blocked[12] || maze_state - 1 != blocked[13] || maze_state - 1 != blocked[14] || maze_state - 1 != blocked[15] || maze_state - 1 != 6 || maze_state - 1 != 12 || maze_state - 1 != 18 || maze_state - 1 != 24 || maze_state - 1 != 30))
							next_state = maze_state - 6'd1;
						else
							next_state = maze_state;
					end
//				0: if ((maze_state + 6 < 36) && (maze_state != blocked[0] || maze_state != blocked[1] || maze_state != blocked[2] || maze_state != blocked[3] || maze_state != blocked[4] || maze_state != blocked[5] || maze_state != blocked[6] || maze_state != blocked[7] || maze_state != blocked[8] || maze_state != blocked[9] || maze_state != blocked[10] || maze_state != blocked[11] || maze_state != blocked[12] || maze_state != blocked[13] || maze_state != blocked[14] || maze_state != blocked[15] || maze_state != blocked[16]))
//				case({maze_state,action})
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
//					{6'd1,4'd0}:next_state = 6'd7;
				endcase
			end
		end
	
	
endmodule