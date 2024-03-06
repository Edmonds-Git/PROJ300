module ANGLE_OUTPUT_UNIT (
	output logic [7:0]angle1,
	output logic [7:0]angle2,
	output logic [7:0]angle3,
	output logic [7:0]angle4,
	input logic clk,
	input logic SW1,
	input logic SW2,
	input logic SW3,
	input logic SW4);
	
	logic [3:0] switches;
	assign switches = {SW1,SW2,SW3,SW4};
	
	always_ff @(posedge clk) 
		begin
			if (switches == 4'b0000)
				angle1 = 8'd0;
			else if (switches == 4'b1111)
				angle1 = 8'd180; 
			else if (switches == 4'b1100)
				angle1 = 8'd90; 
		end
endmodule
		