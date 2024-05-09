module ANGLE_OUTPUT_UNIT (
	output logic [7:0]angle1,
	output logic [7:0]angle2,
	output logic [7:0]angle3,
	output logic [7:0]angle4,
	output logic move_complete,
	output logic t_restart,
	output logic [5:0]maze_state,
	input logic clk,
	input logic SW1,
	input logic SW2,
	input logic SW3,
	input logic SW4,
	input logic SW6,
	input logic SW7,
	input logic SW8,
	input logic SW9,
	input logic rdy,
	input logic [5:0]next_state,
	input logic [5:0]start_state,
	input logic rst);
	
	logic [3:0] switches;
	logic [4:0] next_move;
	logic [4:0] next_next_move;
	//logic [3:0] angleswitch;
	assign switches = {SW1,SW2,SW3,SW4};
	//assign angleswitch = {SW6,SW7,SW8,SW9};
	always_ff@(posedge rdy or negedge rst)
	begin
		if (rst == 0)
			begin
				move_complete = 0;
			end
		t_restart = 1;
		case(next_move)
			0:
			begin
			maze_state = start_state;
			next_next_move = 1;
			end
			1:
			begin
				next_next_move = 2;
				move_complete = 0;
//				t_restart = 1;
			end
			2:
			begin
				next_next_move = 3;
				move_complete = 0;
//				t_restart = 1;
			end
			3:
			begin
				next_next_move = 4;
				move_complete = 0;
//				t_restart = 1;
			end
			4:
			begin 
				next_next_move = 1;
				move_complete = 1;
				maze_state = next_state;
			end
//			default:begin next_next_move = 1; end
		endcase
	end
////////////////////// Angle Control /////////////////////////
	//for reference 0 = N, 1 = E, 2 = S, 3 = W
	always_ff @(posedge clk)
	begin
		next_move = next_next_move;
		case (next_state)
			6'd1:
			begin
				angle1 <= (next_move == 1) ? 8'd0 : angle1;//bot extension
				angle2 <= (next_move == 2) ? 8'd38 : angle2;//bot rotation
				angle3 <= (next_move == 3) ? 8'd24 : angle3;//top extension
				angle4 <= (next_move == 4) ? 8'd180 : angle4;//end rotation
			end
			6'd2:
			begin
				angle1 <= (next_move == 1) ? 8'd0 : angle1;//bot extension
				angle2 <= (next_move == 2) ? 8'd56 : angle2;//bot rotation
				angle3 <= (next_move == 3) ? 8'd18 : angle3;//top extension
				angle4 <= (next_move == 4) ? 8'd168 : angle4;//end rotation
			end
			default:
			begin
				angle1 <= (next_move == 1) ? 8'd0 : angle1;//bot extension
				angle2 <= (next_move == 2) ? 8'd71 : angle2;//bot rotation
				angle3 <= (next_move == 3) ? 8'd18 : angle3;//top extension
				angle4 <= (next_move == 4) ? 8'd168 : angle4;//end rotation
			end
		///etc
		endcase
	end
endmodule
