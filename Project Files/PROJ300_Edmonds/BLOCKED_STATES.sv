module BLOCKED_STATES(
	output logic [31:0] new_Q[37][4], //I forgot to start at 0 when writing the state machine so to save time I'm just adding an extra value to the array
	output logic [5:0] start_state,
	output logic [5:0] blocked[16],
	output logic [5:0] target_state,
	output logic done,
	input logic [31:0] old_Q [37][4],
	input logic clk,
	input logic rst); 
	
//for reference 0 = N, 1 = E, 2 = S, 3 = W
///////////////////////////////List Of mazes///////////////////////////////
//maze 1
//		blocked = '{3,9,11,13,15,17,26,28,30,32,34,0,0,0,0,0}; 
//		target_state = 36;
//		start_state = 1;
//maze 2
//
/////////////////////////////////////////////////////////////////////////

	always_comb
	begin
		blocked = '{7,8,9,11,13,15,17,26,28,30,32,34,0,0,0,0}; 
		target_state = 6'd36;
		start_state = 1;
	end
	always @(posedge clk)
	begin
		done = 0;
		new_Q = old_Q; //start with new Q equal to old Q
		for (int i = 0; i < $size(blocked); i++) //repeat as many times as there are blocked states
		begin
			case (blocked[i])
			   //                         N                  E                  S                 W Row 1
				6'd1:begin                                        new_Q[7][2]  = 0; new_Q[2][3]  = 0; end
				6'd2:begin                     new_Q[1][1]  = 0;  new_Q[8][2]  = 0; new_Q[3][3]  = 0; end
				6'd3:begin                     new_Q[2][1]  = 0;  new_Q[9][2]  = 0; new_Q[4][3]  = 0; end
				6'd4:begin                     new_Q[3][1]  = 0;  new_Q[10][2] = 0; new_Q[5][3]  = 0; end
				6'd5:begin                     new_Q[4][1]  = 0;  new_Q[11][2] = 0; new_Q[6][3]  = 0; end
				6'd6:begin                     new_Q[5][1]  = 0;  new_Q[12][2] = 0;                   end
				//                         N                  E                  S                 W Row 2
				6'd7:begin  new_Q[1][0]  = 0;                     new_Q[13][2] = 0; new_Q[8][3]  = 0; end
				6'd8:begin  new_Q[2][0]  = 0;  new_Q[7][1]  = 0;  new_Q[14][2] = 0; new_Q[9][3]  = 0; end
				6'd9:begin  new_Q[3][0]  = 0;  new_Q[8][1]  = 0;  new_Q[15][2] = 0; new_Q[10][3] = 0; end
				6'd10:begin new_Q[4][0]  = 0;  new_Q[9][1]  = 0;  new_Q[16][2] = 0; new_Q[11][3] = 0; end
				6'd11:begin new_Q[5][0]  = 0;  new_Q[10][1] = 0;  new_Q[17][2] = 0; new_Q[12][3] = 0; end
				6'd12:begin new_Q[6][0]  = 0;  new_Q[11][1] = 0;  new_Q[18][2] = 0;                   end
				//                         N                  E                  S                 W Row 3
				6'd13:begin new_Q[7][0]  = 0;                     new_Q[19][2] = 0; new_Q[14][3] = 0; end
				6'd14:begin new_Q[8][0]  = 0;  new_Q[13][1] = 0;  new_Q[20][2] = 0; new_Q[15][3] = 0; end
				6'd15:begin new_Q[9][0]  = 0;  new_Q[14][1] = 0;  new_Q[21][2] = 0; new_Q[16][3] = 0; end
				6'd16:begin new_Q[10][0] = 0;  new_Q[15][1] = 0;  new_Q[22][2] = 0; new_Q[17][3] = 0; end
				6'd17:begin new_Q[11][0] = 0;  new_Q[16][1] = 0;  new_Q[23][2] = 0; new_Q[18][3] = 0; end
				6'd18:begin new_Q[12][0] = 0;  new_Q[17][1] = 0;  new_Q[24][2] = 0;                   end
				//                         N                  E                  S                 W Row 4
				6'd19:begin new_Q[13][0] = 0;                     new_Q[25][2] = 0; new_Q[20][3] = 0; end
				6'd20:begin new_Q[14][0] = 0;  new_Q[19][1] = 0;  new_Q[26][2] = 0; new_Q[21][3] = 0; end
				6'd21:begin new_Q[15][0] = 0;  new_Q[20][1] = 0;  new_Q[27][2] = 0; new_Q[22][3] = 0; end
				6'd22:begin new_Q[16][0] = 0;  new_Q[21][1] = 0;  new_Q[28][2] = 0; new_Q[23][3] = 0; end
				6'd23:begin new_Q[17][0] = 0;  new_Q[22][1] = 0;  new_Q[29][2] = 0; new_Q[24][3] = 0; end
				6'd24:begin new_Q[18][0] = 0;  new_Q[23][1] = 0;  new_Q[30][2] = 0;                   end
				//                         N                  E                  S                 W Row 5
				6'd25:begin new_Q[19][0] = 0;                     new_Q[31][2] = 0; new_Q[26][3] = 0; end
				6'd26:begin new_Q[20][0] = 0;  new_Q[25][1] = 0;  new_Q[32][2] = 0; new_Q[27][3] = 0; end
				6'd27:begin new_Q[21][0] = 0;  new_Q[26][1] = 0;  new_Q[33][2] = 0; new_Q[28][3] = 0; end
				6'd28:begin new_Q[22][0] = 0;  new_Q[27][1] = 0;  new_Q[34][2] = 0; new_Q[29][3] = 0; end
				6'd29:begin new_Q[23][0] = 0;  new_Q[28][1] = 0;  new_Q[35][2] = 0; new_Q[30][3] = 0; end
				6'd30:begin new_Q[24][0] = 0;  new_Q[29][1] = 0;  new_Q[36][2] = 0;                   end
				//                         N                  E                  S                 W Row ^
				6'd31:begin new_Q[25][0] = 0;                                       new_Q[32][3] = 0; end
				6'd32:begin new_Q[26][0] = 0;  new_Q[25][1] = 0;                    new_Q[33][3] = 0; end
				6'd33:begin new_Q[27][0] = 0;  new_Q[26][1] = 0;                    new_Q[34][3] = 0; end
				6'd34:begin new_Q[28][0] = 0;  new_Q[27][1] = 0;                    new_Q[35][3] = 0; end
				6'd35:begin new_Q[29][0] = 0;  new_Q[28][1] = 0;                    new_Q[36][3] = 0; end
				6'd36:begin new_Q[30][0] = 0;  new_Q[29][1] = 0;                                      end
				default:new_Q = new_Q;
			endcase
		end
		done = 1;
	end
endmodule