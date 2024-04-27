module ANGLE_DECODE(
	input logic[7:0]angle1,
	input logic [7:0]angle2,
	input logic [7:0]angle3,
	input logic [7:0]angle4,
	input logic SW1,
	input logic SW2,
	input logic SW3,
	input logic SW4,
	input logic clk,
	output logic [11:0]angle_out);
	
	logic [3:0] switches;
	logic [7:0] angle1_1, angle1_2, angle1_3, angle2_1, angle2_2, angle2_3, angle3_1, angle3_2, angle3_3, angle4_1, angle4_2, angle4_3;
	logic [11:0] angle_out_1, angle_out_2, angle_out_3, angle_out_4;
	assign switches = {SW1,SW2,SW3,SW4};
	
	always@(posedge clk)
	begin
		case(switches)
			4'b1000:
			begin
	//		if (switches == 4'b1000)
				angle1_1 <= (angle1 / 8'd100)% 8'd10;
				angle1_2 <= (angle1/ 8'd10) % 8'd10;
				angle1_3 <= angle1 % 8'd10;
				angle_out_1 <= {angle1_1[3:0], angle1_2[3:0], angle1_3[3:0]};
				angle_out <= angle_out_1;
			end
	//		else if (switches == 4'b0100) //2
			4'b0100:
			begin
				angle2_1 <= (angle2 / 8'd100) % 8'd10;
				angle2_2 <= (angle2 / 8'd10) % 8'd10;
				angle2_3 <= angle2 % 8'd10;
				angle_out_2 <= {angle2_1[3:0], angle2_2[3:0], angle2_3[3:0]};
				angle_out <= angle_out_2;
			end
	//		else if (switches == 4'b0010) //3
			4'b0010:
			begin
				angle3_1 <= (angle3 / 8'd100) % 8'd10;
				angle3_2 <= (angle3 / 8'd10) % 8'd10;
				angle3_3 <= angle3 % 8'd10;
				angle_out_3 <= {angle3_1[3:0], angle3_2[3:0], angle3_3[3:0]};
				angle_out <= angle_out_3;
			end
	//		else if (switches == 4'b0001) //4
			4'b0001:
			begin
				angle4_1 <= (angle4 / 8'd100) % 8'd10;
				angle4_2 <= (angle4 / 8'd10) % 8'd10;
				angle4_3 <= angle4 % 8'd10;
				angle_out_4 <= {angle4_1[3:0], angle4_2[3:0], angle4_3[3:0]};
				angle_out <= angle_out_4;
			end
			default: angle_out <= angle_out;
		endcase
	end
endmodule
