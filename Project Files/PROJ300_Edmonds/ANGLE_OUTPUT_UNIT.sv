module ANGLE_OUTPUT_UNIT (
	output logic [7:0]angle1,
	output logic [7:0]angle2,
	output logic [7:0]angle3,
	output logic [7:0]angle4,
	input logic clk,
	input logic SW1,
	input logic SW2,
	input logic SW3,
	input logic SW4,
	input logic SW6,
	input logic SW7,
	input logic SW8,
	input logic SW9);
//	input logic [3:0]action,
//	input logic [5:0]maze_state);
	
	logic [3:0] switches;
	//logic [3:0] angleswitch;
	assign switches = {SW1,SW2,SW3,SW4};
	//assign angleswitch = {SW6,SW7,SW8,SW9};
	
////////////////True Angles/////////////// 
	//for reference 0 = N, 1 = E, 2 = S, 3 = W
//	always_ff @(posedge clk)
//	begin
//		case (maze_state)
//		6'd1: 
//			begin
//				if(action = 4'd0)
//				begin
//					
//				end
//				else if (action = 4'd1)
//				begin
//					
//				end
//				else if (action = 4'd2)
//				begin
//					
//				end
//				else if (action = 4'd3)
//				begin
//					
//				end
//			end
//		6'd2: 
//			begin
//				if(action = 4'd0)
//				begin
//					
//				end
//				else if (action = 4'd1)
//				begin
//					
//				end
//				else if (action = 4'd2)
//				begin
//					
//				end
//				else if (action = 4'd3)
//				begin
//					
//				end
//		endcase
//	end
//////////////idea///////////////////
	//for reference 0 = N, 1 = E, 2 = S, 3 = W
	always_ff @(posedge clk)
	begin
		case (maze_state)
			6'd1:
			begin
				angle1 = 8'd30;//bot extension
				angle2 = 8'd60;//bot rotation
				angle3 = 8'd35;//top extension
				angle4 = 8'd25;//end rotation
			end
			6'd2:
			begin
				angle1 = 8'd30;//bot extension
				angle2 = 8'd70;//bot rotation
				angle3 = 8'd30;//top extension
				angle4 = 8'd20;//end rotation
			end
		///etc
		endcase
		//maybe use a state machine to control movements more carefully? Softer Pen?
	end

/////////////////////////////////////
	//testing/backup code
//	always_ff @(posedge clk) 
//		begin
//			if (switches == 4'b0000 && SW9 == 1) //bot extension
//				angle1 = 8'd0;
//			else if (switches == 4'b1111 && SW9 == 1)
//				angle1 = 8'd180; 
//			else if (switches == 4'b1100 && SW9 == 1)
//				angle1 = 8'd90;
//		end
//	always_ff @(posedge clk) 
//		begin
//			if (switches == 4'b0000 && SW8 == 1)//bot rotation
//			//begin
//				angle2 = 8'd0;
//			else if (switches == 4'b1111 && SW8 == 1)
//				angle2 = 8'd180; 
//			else if (switches == 4'b1100 && SW8 == 1)
//				angle2 = 8'd90; 
//		end
//	always_ff @(posedge clk) 
//		begin
//			if (switches == 4'b0000 && SW7 == 1) //top extension
//			//begin
//				angle3 = 8'd0;
//			else if (switches == 4'b1111 && SW7 == 1)
//				angle3 = 8'd180; 
//			else if (switches == 4'b1100 && SW7 == 1)
//				angle3 = 8'd90; 
//		end
//	always_ff @(posedge clk) 
//		begin
//			if (switches == 4'b0000 && SW6 == 1)//end rotation
//			//begin
//				angle4 = 8'd0;
//			else if (switches == 4'b1111 && SW6 == 1)
//				angle4 = 8'd180; 
//			else if (switches == 4'b1100 && SW6 == 1)
//				angle4 = 8'd90;
//		end
///////////////////First Row////////////////////////////
//	always_ff @(posedge clk) 
//		begin
//			if (switches == 4'b1111 && SW9 == 1)  //maze_state  1
//			begin
//				angle1 = 8'd30;//bot extension
//				angle2 = 8'd60;//bot rotation
//				angle3 = 8'd35;//top extension
//				angle4 = 8'd25;//end rotation
//			end
//			else if (switches == 4'b1111 && SW8 == 1) //2
//			begin
//				angle1 = 8'd30;//bot extension
//				angle2 = 8'd70;//bot rotation
//				angle3 = 8'd30;//top extension
//				angle4 = 8'd20;//end rotation
//			end
//			else if (switches == 4'b1111 && SW7 == 1) //3
//			begin
//				angle1 = 8'd30;//bot extension
//				angle2 = 8'd75;//bot rotation
//				angle3 = 8'd30;//top extension
//				angle4 = 8'd20;//end rotation
//			end
//			else if (switches == 4'b1111 && SW6 == 1) //4
//			begin
//				angle1 = 8'd30;//bot extension
//				angle2 = 8'd85;//bot rotation
//				angle3 = 8'd30;//top extension
//				angle4 = 8'd20;//end rotation
//			end
//			else if (switches == 4'b0111 && SW7 == 1) //5
//			begin
//				angle1 = 8'd30;//bot extension
//				angle2 = 8'd95;//bot rotation
//				angle3 = 8'd30;//top extension
//				angle4 = 8'd20;//end rotation
//			end
//			else if (switches == 4'b0011 && SW7 == 1) //6
//			begin
//				angle1 = 8'd30;//bot extension
//				angle2 = 8'd105;//bot rotation
//				angle3 = 8'd35;//top extension
//				angle4 = 8'd25;//end rotation
//			end
//		end
/////////////////Row 2////////////////////////////
	always_ff @(posedge clk) 
		begin
			if (switches == 4'b1111 && SW9 == 1)  //maze_state  6
			begin
				angle1 = 8'd30;//bot extension
				angle2 = 8'd105;//bot rotation
				angle3 = 8'd35;//top extension
				angle4 = 8'd25;//end rotation
			end
			else if (switches == 4'b0011 && SW7 == 1) //12
			begin
				angle1 = 8'd60;//bot extension
				angle2 = 8'd70;//bot rotation
				angle3 = 8'd45;//top extension
				angle4 = 8'd15;//end rotation
			end
			else if (switches == 4'b0111 && SW7 == 1) //11
			begin
				angle1 = 8'd60;//bot extension
				angle2 = 8'd75;//bot rotation
				angle3 = 8'd60;//top extension
				angle4 = 8'd15;//end rotation
			end
			else if (switches == 4'b1111 && SW6 == 1) //10
			begin
				angle1 = 8'd60;//bot extension
				angle2 = 8'd85;//bot rotation
				angle3 = 8'd55;//top extension
				angle4 = 8'd15;//end rotation
			end
			else if (switches == 4'b1111 && SW7 == 1) //9
			begin
				angle1 = 8'd60;//bot extension
				angle2 = 8'd95;//bot rotation
				angle3 = 8'd50;//top extension
				angle4 = 8'd15;//end rotation
			end
			else if (switches == 4'b1111 && SW8 == 1) //8
			begin
				angle1 = 8'd45;//bot extension
				angle2 = 8'd105;//bot rotation
				angle3 = 8'd45;//top extension
				angle4 = 8'd25;//end rotation
			end
		end
//////////////////////////////////////////////////
//		always_ff @(posedge clk) 
//		begin
//			if (switches == 4'b1111 && SW9 == 1)  //maze_state 3
//			begin
//				angle1 = 8'd30;//bot extension
//				angle2 = 8'd75;//bot rotation
//				angle3 = 8'd30;//top extension
//				angle4 = 8'd20;//end rotation
//			end
//			else 
//			begin
//				angle1 = 8'd0;
//				angle2 = 8'd0;
//				angle3 = 8'd0;
//				angle4 = 8'd0;
//			end
//		end
//	always_ff @(posedge clk) 
//		begin
//			if (switches == 4'b0000 && SW8 == 1)//bot rotation
//			//begin
//				angle2 = 8'd0;
//			else if (switches == 4'b1111 && SW8 == 1)
//				angle2 = 8'd180; 
//			else if (switches == 4'b1100 && SW8 == 1)
//				angle2 = 8'd90; 
//		end
//	always_ff @(posedge clk) 
//		begin
//			if (switches == 4'b0000 && SW7 == 1) //top extension
//			//begin
//				angle3 = 8'd0;
//			else if (switches == 4'b1111 && SW7 == 1)
//				angle3 = 8'd180; 
//			else if (switches == 4'b1100 && SW7 == 1)
//				angle3 = 8'd90; 
//		end
//	always_ff @(posedge clk) 
//		begin
//			if (switches == 4'b0000 && SW6 == 1)//bot extension
//			//begin
//				angle4 = 8'd0;
//			else if (switches == 4'b1111 && SW6 == 1)
//				angle4 = 8'd180; 
//			else if (switches == 4'b1100 && SW6 == 1)
//				angle4 = 8'd90;
//		end
endmodule
