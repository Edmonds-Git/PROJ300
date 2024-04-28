module Q_EPISODE_COUNT(
	//output logic [31:0] new_Q [37][4],
	//output logic [5:0] maze_state,
	output logic [7:0] new_count,
	output logic trial_stop,
	output logic loop_start,
	input logic ep_finish,
	input logic rst,
	//input logic [31:0] old_Q [37][4],
	//input logic [5:0] maze_state,
	input logic [7:0] episode_count);
	
	
//	always_comb
//	begin
//		new_count = episode_count + 1;
//	end
	
	always @(posedge ep_finish or posedge rst)
		begin
			if (new_count > 8'd200)
				trial_stop = 1;
			else
			begin
				trial_stop = 0;
				new_count = episode_count + 1;
			end
			if (new_count <= 1)
				loop_start = 1;
		end
	
	
endmodule