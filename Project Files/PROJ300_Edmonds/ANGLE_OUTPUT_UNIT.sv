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
	
	logic [3:0] switches;
	//logic [3:0] angleswitch;
	assign switches = {SW1,SW2,SW3,SW4};
	//assign angleswitch = {SW6,SW7,SW8,SW9};
	
	always_ff @(posedge clk) 
		begin
			if (switches == 4'b0000 && SW9 == 1) //top rotation
				angle1 = 8'd0;
			else if (switches == 4'b1111 && SW9 == 1)
				angle1 = 8'd180; 
			else if (switches == 4'b1100 && SW9 == 1)
				angle1 = 8'd90;
		end
	always_ff @(posedge clk) 
		begin
			if (switches == 4'b0000 && SW8 == 1)//top extension
			//begin
				angle2 = 8'd0;
			else if (switches == 4'b1111 && SW8 == 1)
				angle2 = 8'd180; 
			else if (switches == 4'b1100 && SW8 == 1)
				angle2 = 8'd90; 
		end
	always_ff @(posedge clk) 
		begin
			if (switches == 4'b0000 && SW7 == 1) //bot rotation
			//begin
				angle3 = 8'd0;
			else if (switches == 4'b1111 && SW7 == 1)
				angle3 = 8'd180; 
			else if (switches == 4'b1100 && SW7 == 1)
				angle3 = 8'd90; 
		end
	always_ff @(posedge clk) 
		begin
			if (switches == 4'b0000 && SW6 == 1)//bot extension
			//begin
				angle4 = 8'd0;
			else if (switches == 4'b1111 && SW6 == 1)
				angle4 = 8'd180; 
			else if (switches == 4'b1100 && SW6 == 1)
				angle4 = 8'd90;
		end
endmodule
