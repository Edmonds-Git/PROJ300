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
//	//for reference 0 = N, 1 = E, 2 = S, 3 = W
//	always_ff @(posedge clk)
//	begin
//		case (maze_state)
//			6'd1:
//			begin
//				angle1 = 8'd30;//bot extension
//				angle2 = 8'd60;//bot rotation
//				angle3 = 8'd35;//top extension
//				angle4 = 8'd25;//end rotation
//			end
//			6'd2:
//			begin
//				angle1 = 8'd30;//bot extension
//				angle2 = 8'd70;//bot rotation
//				angle3 = 8'd30;//top extension
//				angle4 = 8'd20;//end rotation
//			end
//		///etc
//		endcase
//		//maybe use a state machine to control movements more carefully? Softer Pen?
//	end

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
//				angle1 <= 8'd0;//bot extension
//				angle2 <= 8'd38;//bot rotation
//				angle3 <= 8'd24;//top extension
//				angle4 <= 8'd180;//end rotation
//			end
//			else if (switches == 4'b1111 && SW8 == 1) //2
//			begin
//				angle1 <= 8'd0;//bot extension
//				angle2 <= 8'd56;//bot rotation
//				angle3 <= 8'd18;//top extension
//				angle4 <= 8'd168;//end rotation
//			end
//			else if (switches == 4'b1111 && SW7 == 1) //3
//			begin
//				angle1 <= 8'd0;//bot extension
//				angle2 <= 8'd71;//bot rotation
//				angle3 <= 8'd18;//top extension
//				angle4 <= 8'd168;//end rotation
//			end
//			else if (switches == 4'b1111 && SW6 == 1) //4
//			begin
//				angle1 <= 8'd0;//bot extension
//				angle2 <= 8'd92;//bot rotation
//				angle3 <= 8'd18;//top extension
//				angle4 <= 8'd168;//end rotation
//			end
//			else if (switches == 4'b0111 && SW6 == 1) //5
//			begin
//				angle1 <= 8'd0;//bot extension
//				angle2 <= 8'd110;//bot rotation
//				angle3 <= 8'd21;//top extension
//				angle4 <= 8'd168;//end rotation
//			end
//			else if (switches == 4'b0011 && SW6 == 1) //6
//			begin
//				angle1 <= 8'd0;//bot extension
//				angle2 <= 8'd125;//bot rotation
//				angle3 <= 8'd21;//top extension
//				angle4 <= 8'd173;//end rotation
//			end
//			else
//			begin
//				angle1 <= angle1;
//				angle2 <= angle2;
//				angle3 <= angle3;
//				angle4 <= angle4;
//			end
//		end
/////////////////Row 2////////////////////////////
//always_ff @(posedge clk) 
//		begin
//			if (switches == 4'b1111 && SW9 == 1)  //maze_state  7
//			begin
//				angle1 <= 8'd11;//bot extension
//				angle2 <= 8'd33;//bot rotation
//				angle3 <= 8'd18;//top extension
//				angle4 <= 8'd165;//end rotation
//			end
//			else if (switches == 4'b1111 && SW8 == 1) //8
//			begin
//				angle1 <= 8'd17;//bot extension
//				angle2 <= 8'd51;//bot rotation
//				angle3 <= 8'd18;//top extension
//				angle4 <= 8'd156;//end rotation
//			end
//			else if (switches == 4'b1111 && SW7 == 1) //9
//			begin
//				angle1 <= 8'd23;//bot extension
//				angle2 <= 8'd72;//bot rotation
//				angle3 <= 8'd18;//top extension
//				angle4 <= 8'd153;//end rotation
//			end
//			else if (switches == 4'b1111 && SW6 == 1) //10
//			begin
//				angle1 <= 8'd23;//bot extension
//				angle2 <= 8'd93;//bot rotation
//				angle3 <= 8'd18;//top extension
//				angle4 <= 8'd153;//end rotation
//			end
//			else if (switches == 4'b0111 && SW6 == 1) //11
//			begin
//				angle1 <= 8'd23;//bot extension
//				angle2 <= 8'd114;//bot rotation
//				angle3 <= 8'd26;//top extension
//				angle4 <= 8'd165;//end rotation
//			end
//			else if (switches == 4'b0011 && SW6 == 1) //12
//			begin
//				angle1 <= 8'd21;//bot extension
//				angle2 <= 8'd132;//bot rotation
//				angle3 <= 8'd24;//top extension
//				angle4 <= 8'd165;//end rotation
//			end
//			else
//			begin
//				angle1 <= angle1;
//				angle2 <= angle2;
//				angle3 <= angle3;
//				angle4 <= angle4;
//			end
//		end
///////////////////Row 3////////////////////////////
//always_ff @(posedge clk) 
//		begin
//			if (switches == 4'b1111 && SW9 == 1)  //maze_state  13
//			begin
//				angle1 <= 8'd35;//bot extension
//				angle2 <= 8'd27;//bot rotation
//				angle3 <= 8'd33;//top extension
//				angle4 <= 8'd180;//end rotation
//			end
//			else if (switches == 4'b1111 && SW8 == 1) //14
//			begin
//				angle1 <= 8'd56;//bot extension
//				angle2 <= 8'd42;//bot rotation
//				angle3 <= 8'd39;//top extension
//				angle4 <= 8'd180;//end rotation
//			end
//			else if (switches == 4'b1111 && SW7 == 1) //15
//			begin
//				angle1 <= 8'd56;//bot extension
//				angle2 <= 8'd69;//bot rotation
//				angle3 <= 8'd36;//top extension
//				angle4 <= 8'd177;//end rotation
//			end
//			else if (switches == 4'b1111 && SW6 == 1) //16
//			begin
//				angle1 <= 8'd56;//bot extension
//				angle2 <= 8'd93;//bot rotation
//				angle3 <= 8'd36;//top extension
//				angle4 <= 8'd177;//end rotation
//			end
//			else if (switches == 4'b0111 && SW6 == 1) //17
//			begin
//				angle1 <= 8'd47;//bot extension
//				angle2 <= 8'd120;//bot rotation
//				angle3 <= 8'd36;//top extension
//				angle4 <= 8'd177;//end rotation
//			end
//			else if (switches == 4'b0011 && SW6 == 1) //18
//			begin
//				angle1 <= 8'd23;//bot extension
//				angle2 <= 8'd144;//bot rotation
//				angle3 <= 8'd27;//top extension
//				angle4 <= 8'd165;//end rotation
//			end
//			else
//			begin
//				angle1 <= angle1;
//				angle2 <= angle2;
//				angle3 <= angle3;
//				angle4 <= angle4;
//			end
//		end
/////////////////Row 4////////////////////////////
//always_ff @(posedge clk) 
//		begin
//			if (switches == 4'b1111 && SW9 == 1)  //maze_state  19
//			begin
//				angle1 <= 8'd40;//bot extension
//				angle2 <= 8'd12;//bot rotation
//				angle3 <= 8'd21;//top extension
//				angle4 <= 8'd135;//end rotation
//			end
//			else if (switches == 4'b1111 && SW8 == 1) //20
//			begin
//				angle1 <= 8'd57;//bot extension
//				angle2 <= 8'd39;//bot rotation
//				angle3 <= 8'd24;//top extension
//				angle4 <= 8'd132;//end rotation
//			end
//			else if (switches == 4'b1111 && SW7 == 1) //21
//			begin
//				angle1 <= 8'd66;//bot extension
//				angle2 <= 8'd66;//bot rotation
//				angle3 <= 8'd24;//top extension
//				angle4 <= 8'd132;//end rotation
//			end
//			else if (switches == 4'b1111 && SW6 == 1) //22
//			begin
//				angle1 <= 8'd66;//bot extension
//				angle2 <= 8'd96;//bot rotation
//				angle3 <= 8'd24;//top extension
//				angle4 <= 8'd132;//end rotation
//			end
//			else if (switches == 4'b0111 && SW6 == 1) //23
//			begin
//				angle1 <= 8'd61;//bot extension
//				angle2 <= 8'd126;//bot rotation
//				angle3 <= 8'd26;//top extension
//				angle4 <= 8'd138;//end rotation
//			end
//			else if (switches == 4'b0011 && SW6 == 1) //24
//			begin
//				angle1 <= 8'd40;//bot extension
//				angle2 <= 8'd147;//bot rotation
//				angle3 <= 8'd20;//top extension
//				angle4 <= 8'd137;//end rotation
//			end
//			else
//			begin
//				angle1 <= angle1;
//				angle2 <= angle2;
//				angle3 <= angle3;
//				angle4 <= angle4;
//			end
//		end
/////////////////Row 5////////////////////////////
//always_ff @(posedge clk) 
//		begin
//			if (switches == 4'b1111 && SW9 == 1)  //maze_state  25
//			begin
//				angle1 <= 8'd50;//bot extension
//				angle2 <= 8'd06;//bot rotation
//				angle3 <= 8'd21;//top extension
//				angle4 <= 8'd119;//end rotation
//			end
//			else if (switches == 4'b1111 && SW8 == 1) //26
//			begin
//				angle1 <= 8'd80;//bot extension
//				angle2 <= 8'd35;//bot rotation
//				angle3 <= 8'd30;//top extension
//				angle4 <= 8'd137;//end rotation
//			end
//			else if (switches == 4'b1111 && SW7 == 1) //27
//			begin
//				angle1 <= 8'd113;//bot extension
//				angle2 <= 8'd65;//bot rotation
//				angle3 <= 8'd21;//top extension
//				angle4 <= 8'd137;//end rotation
//			end
//			else if (switches == 4'b1111 && SW6 == 1) //28
//			begin
//				angle1 <= 8'd104;//bot extension
//				angle2 <= 8'd101;//bot rotation
//				angle3 <= 8'd22;//top extension
//				angle4 <= 8'd137;//end rotation
//			end
//			else if (switches == 4'b0111 && SW6 == 1) //29
//			begin
//				angle1 <= 8'd89;//bot extension
//				angle2 <= 8'd134;//bot rotation
//				angle3 <= 8'd26;//top extension
//				angle4 <= 8'd137;//end rotation
//			end
//			else if (switches == 4'b0011 && SW6 == 1) //30
//			begin
//				angle1 <= 8'd59;//bot extension
//				angle2 <= 8'd159;//bot rotation
//				angle3 <= 8'd27;//top extension
//				angle4 <= 8'd134;//end rotation
//			end
//			else
//			begin
//				angle1 <= angle1;
//				angle2 <= angle2;
//				angle3 <= angle3;
//				angle4 <= angle4;
//			end 
//		end
/////////////////Row 6////////////////////////////
always_ff @(posedge clk) 
		begin
			if (switches == 4'b1111 && SW9 == 1)  //maze_state  31
			begin
				angle1 <= 8'd67;//bot extension
				angle2 <= 8'd0;//bot rotation
				angle3 <= 8'd24;//top extension
				angle4 <= 8'd107;//end rotation
			end
			else if (switches == 4'b1111 && SW8 == 1) //32
			begin
				angle1 <= 8'd110;//bot extension
				angle2 <= 8'd12;//bot rotation
				angle3 <= 8'd18;//top extension
				angle4 <= 8'd110;//end rotation
			end
			else if (switches == 4'b1111 && SW7 == 1) //33
			begin
				angle1 <= 8'd128;//bot extension
				angle2 <= 8'd51;//bot rotation
				angle3 <= 8'd12;//top extension
				angle4 <= 8'd110;//end rotation
			end
			else if (switches == 4'b1111 && SW6 == 1) //34
			begin
				angle1 <= 8'd128;//bot extension
				angle2 <= 8'd102;//bot rotation
				angle3 <= 8'd12;//top extension
				angle4 <= 8'd110;//end rotation
			end
			else if (switches == 4'b0111 && SW6 == 1) //35
			begin
				angle1 <= 8'd116;//bot extension
				angle2 <= 8'd141;//bot rotation
				angle3 <= 8'd21;//top extension
				angle4 <= 8'd134;//end rotation
			end
			else if (switches == 4'b0011 && SW6 == 1) //36
			begin
				angle1 <= 8'd77;//bot extension
				angle2 <= 8'd180;//bot rotation
				angle3 <= 8'd27;//top extension
				angle4 <= 8'd134;//end rotation
			end
			else
			begin
				angle1 <= angle1;
				angle2 <= angle2;
				angle3 <= angle3;
				angle4 <= angle4;
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
