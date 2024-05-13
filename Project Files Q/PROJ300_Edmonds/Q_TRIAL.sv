module Q_TRIAL(
	output logic [5:0] next_state,
	output logic done_o,
	input logic clk,
	input logic rst,
	input logic [31:0] old_Q [37][4],
	input logic [3:0] action,
	input logic [5:0] maze_state,
	input logic [5:0] blocked [16],
	input logic [5:0] target_state,
	input logic [5:0] start_state,
	input logic done);
	
	
	logic done_clk;
	always_ff @(clk)
	begin
		if (done == 1)
			done_clk = clk;
		else 
			done_clk = 0;
	end
	always_ff @(posedge done_clk)
		begin
			if (maze_state == target_state)
				next_state = start_state;
			else
			begin
				case(action)
				default: next_state = maze_state;
				0: begin 
						if ((maze_state + 6 <= 36) && (maze_state + 6 != blocked[0] || maze_state + 6 != blocked[1] || maze_state + 6 != blocked[2] || maze_state + 6 != blocked[3] || maze_state + 6 != blocked[4] || maze_state + 6 != blocked[5] || maze_state + 6 != blocked[6] || maze_state + 6 != blocked[7] || maze_state + 6 != blocked[8] || maze_state + 6 != blocked[9] || maze_state + 6 != blocked[10] || maze_state + 6 != blocked[11] || maze_state + 6 != blocked[12] || maze_state + 6 != blocked[13] || maze_state + 6 != blocked[14] || maze_state + 6 != blocked[15]))
						begin
							next_state = maze_state + 6'd6;
							done_o = 1;
						end
						else
						begin
							next_state = maze_state;
							done_o = 1;
						end
					end
				1: begin 
						if ((maze_state + 1 <= 36) && (maze_state + 1 != blocked[0] || maze_state + 1 != blocked[1] || maze_state + 1 != blocked[2] || maze_state + 1 != blocked[3] || maze_state + 1 != blocked[4] || maze_state + 1 != blocked[5] || maze_state + 1 != blocked[6] || maze_state + 1 != blocked[7] || maze_state + 1 != blocked[8] || maze_state + 1 != blocked[9] || maze_state + 1 != blocked[10] || maze_state + 1 != blocked[11] || maze_state + 1 != blocked[12] || maze_state + 1 != blocked[13] || maze_state + 1 != blocked[14] || maze_state + 1 != blocked[15] || maze_state + 1 != 7 || maze_state + 1 != 13 || maze_state + 1 != 19 || maze_state + 1 != 25 || maze_state + 1 != 31))
						begin
							next_state = maze_state + 6'd1;
							done_o = 1;
						end
						else
						begin
							next_state = maze_state;
							done_o = 1;
						end
					end
				2: begin 
						if ((maze_state - 6 >= 1) && (maze_state - 6 != blocked[0] || maze_state - 6 != blocked[1] || maze_state - 6 != blocked[2] || maze_state - 6 != blocked[3] || maze_state - 6 != blocked[4] || maze_state - 6 != blocked[5] || maze_state - 6 != blocked[6] || maze_state - 6 != blocked[7] || maze_state - 6 != blocked[8] || maze_state - 6 != blocked[9] || maze_state - 6 != blocked[10] || maze_state - 6 != blocked[11] || maze_state - 6 != blocked[12] || maze_state - 6 != blocked[13] || maze_state - 6 != blocked[14] || maze_state - 6 != blocked[15]))
						begin
							next_state = maze_state - 6'd6;
							done_o = 1;
						end
						else
						begin
							next_state = maze_state;
							done_o = 1;
						end
					end
				3: begin 
						if ((maze_state - 1 > 0) && (maze_state - 1 != blocked[0] || maze_state - 1 != blocked[1] || maze_state - 1 != blocked[2] || maze_state - 1 != blocked[3] || maze_state - 1 != blocked[4] || maze_state - 1 != blocked[5] || maze_state - 1 != blocked[6] || maze_state - 1 != blocked[7] || maze_state - 1 != blocked[8] || maze_state - 1 != blocked[9] || maze_state - 1 != blocked[10] || maze_state - 1 != blocked[11] || maze_state - 1 != blocked[12] || maze_state - 1 != blocked[13] || maze_state - 1 != blocked[14] || maze_state - 1 != blocked[15] || maze_state - 1 != 6 || maze_state - 1 != 12 || maze_state - 1 != 18 || maze_state - 1 != 24 || maze_state - 1 != 30))
						begin
							next_state = maze_state - 6'd1;
							done_o = 1;
						end
						else
						begin
							next_state = maze_state;
							done_o = 1;
						end
					end
				endcase
			end
		end
	
	
endmodule
