module KEY_INPUT(
	input logic KEY0,
	input logic KEY1,
	input logic KEY3,
	input logic SW1,
	input logic SW2,
	input logic SW3,
	input logic SW4,
	input logic clk,
//	input logic rst,
	output logic [7:0]angle1,
	output logic [7:0]angle2,
	output logic [7:0]angle3,
	output logic [7:0]angle4);
//	output logic [11:0]angle_out);
	
	logic [3:0] switches;
	logic [7:0] angle_1, angle_2, angle_3, angle_4;
//	logic [7:0] angle1_1, angle1_2, angle1_3, angle2_1, angle2_2, angle2_3, angle3_1, angle3_2, angle3_3, angle4_1, angle4_2, angle4_3;
//	logic [11:0] angle_out_1, angle_out_2, angle_out_3, angle_out_4;
	//logic [3:0] angleswitch;
	assign switches = {SW1,SW2,SW3,SW4};
	
	
	always@(posedge clk)
	begin
			if (KEY0 == 0)
			begin
				if (switches == 4'b1000 && (angle1 < 8'd180)) //1
				begin
					angle_1 <= angle1+4'd1;
				//	angle1 <= angle_1;
				end
				else if (switches == 4'b0100 && (angle2 < 8'd180)) //2
				begin
					angle_2 <= angle2+4'd1;
				//	angle2 <= angle2;
				end
				else if (switches == 4'b0010 && (angle3 < 8'd180)) //3
				begin
					angle_3 <= angle3+4'd1;
					//angle3<= angle_3;
				end
				else if (switches == 4'b0001 && (angle4 < 8'd180)) //4
				begin
					angle_4 <= angle4+4'd1;
				//	angle4 <= angle_4;
				end
			end
			
			else if (KEY3 == 0)
			begin
				if (switches == 4'b1000 && (angle1 > 8'd0)) //1
				begin
					angle_1 <= angle1-4'd1;
					//angle1 <= angle_1;
				end
				else if (switches == 4'b0100 && (angle2 > 8'd0)) //2
				begin
					angle_2 <= angle2-4'd1;
					//angle2 <= angle2;
				end
				else if (switches == 4'b0010 && (angle3 > 8'd0)) //3
				begin
					angle_3 <= angle3-4'd1;
					//angle3<= angle_3;
				end
				else if (switches == 4'b0001 && (angle4 > 8'd0)) //4
				begin
					angle_4 <= angle4-4'd1;
					//angle4 <= angle_4;
				end
			end
			else if (KEY1 == 0)
			begin
				angle_1 <= 8'd90;
				angle_2 <= 8'd90;
				angle_3 <= 8'd90;
				angle_4 <= 8'd90;
			end
			else
			begin 
				angle_1 <= angle_1;
				angle_2 <= angle_2;
				angle_3 <= angle_3;
				angle_4 <= angle_4;
			end
//	begin
//			if (KEY0 == 0)
//			begin
//				if (switches == 4'b1000 && (angle1 < 8'd180)&& angle1 == angle_1) //1
//				begin
//					angle_1 <= angle1+4'd1;
//					angle1 <= angle_1;
//				end
//				else if (switches == 4'b0100 && (angle2 < 8'd180)&& angle2 == angle_2) //2
//				begin
//					angle_2 = angle2+4'd1;
//					angle2 = angle_2;
//				end
//				else if (switches == 4'b0010 && (angle3 < 8'd180)&& angle3 == angle_3) //3
//				begin
//					angle_3 = angle3+4'd1;
//					angle3 = angle_3;
//				end
//				else if (switches == 4'b0001 && (angle4 < 8'd180) && angle4 == angle_4) //4
//				begin
//					angle_4 = angle4+4'd1;
//					angle4 = angle_4;
//				end
//			end
//			
//			else if (KEY3 == 0)
//			begin
//				if (switches == 4'b1000 && (angle1 > 8'd0)) //1
//				begin
//					angle_1 = angle1-4'd1;
//					angle1 = angle_1;
//				end
//				else if (switches == 4'b0100 && (angle2 > 8'd0)) //2
//				begin
//					angle_2 = angle2-4'd1;
//					angle2 = angle_2;
//				end
//				else if (switches == 4'b0010 && (angle3 > 8'd0)) //3
//				begin
//					angle_3 = angle3-4'd1;
//					angle3 = angle_3;
//				end
//				else if (switches == 4'b0001 && (angle4 > 8'd0)) //4
//				begin
//					angle_4 = angle4-4'd1;
//					angle4 = angle_4;
//				end
//			end
//			if (KEY0 == 0)
//			begin
//				if (switches == 4'b1000 && (angle1 < 8'd180)) //1
//				begin
//					angle1 <= angle1+4'd1;
//				end
//				else if (switches == 4'b0100 && (angle2 < 8'd180)) //2
//				begin
//					angle2 = angle2+4'd1;
//				end
//				else if (switches == 4'b0010 && (angle3 < 8'd180)) //3
//				begin
//					angle3 = angle3+4'd1;
//				end
//				else if (switches == 4'b0001 && (angle4 < 8'd180)) //4
//				begin
//					angle4 = angle4+4'd1;
//				end
//			end
//			
//			else if (KEY3 == 0)
//			begin
//				if (switches == 4'b1000 && (angle1 > 8'd0)) //1
//				begin
//					angle1 = angle1-4'd1;
//				end
//				else if (switches == 4'b0100 && (angle2 > 8'd0)) //2
//				begin
//					angle2 = angle2-4'd1;
//				end
//				else if (switches == 4'b0010 && (angle3 > 8'd0)) //3
//				begin
//					angle3 = angle3-4'd1;
//				end
//				else if (switches == 4'b0001 && (angle4 > 8'd0)) //4
//				begin
//					angle4 = angle4-4'd1;
//				end
//			end
//			else if (KEY1 == 0)
//			begin
//				angle1 <= 8'd90;
//				angle2 <= 8'd90;
//				angle3 <= 8'd90;
//				angle4 <= 8'd90;
//			end
//			else
//			begin
//				angle1 <= angle1;
//				angle2 <= angle2;
//				angle3 <= angle3;
//				angle4 <= angle4;
//			end

	end
//	
	always@(posedge clk)
	begin
	if (KEY0 == 1 && KEY1 == 1 && KEY3 == 1)
			begin
				angle1 <= angle_1;
				angle2 <= angle_2;
				angle3 <= angle_3;
				angle4 <= angle_4;
			end
	end
//	always@(posedge clk)
//	begin
//		case(switches)
//			4'b1000:
//			begin
//	//		if (switches == 4'b1000)
//				angle1_1 <= (angle1 / 8'd100)% 8'd10;
//				angle1_2 <= (angle1/ 8'd10) % 8'd10;
//				angle1_3 <= angle1 % 8'd10;
//				angle_out_1 <= {angle1_1[3:0], angle1_2[3:0], angle1_3[3:0]};
//				angle_out <= angle_out_1;
//			end
//	//		else if (switches == 4'b0100) //2
//			4'b0100:
//			begin
//				angle2_1 <= (angle2 / 8'd100) % 8'd10;
//				angle2_2 <= (angle2 / 8'd10) % 8'd10;
//				angle2_3 <= angle2 % 8'd10;
//				angle_out_2 <= {angle2_1[3:0], angle2_2[3:0], angle2_3[3:0]};
//				angle_out <= angle_out_2;
//			end
//	//		else if (switches == 4'b0010) //3
//			4'b0010:
//			begin
//				angle3_1 <= (angle3 / 8'd100) % 8'd10;
//				angle3_2 <= (angle3 / 8'd10) % 8'd10;
//				angle3_3 <= angle3 % 8'd10;
//				angle_out_3 <= {angle3_1[3:0], angle3_2[3:0], angle3_3[3:0]};
//				angle_out <= angle_out_3;
//			end
//	//		else if (switches == 4'b0001) //4
//			4'b0001:
//			begin
//				angle4_1 <= (angle4 / 8'd100) % 8'd10;
//				angle4_2 <= (angle4 / 8'd10) % 8'd10;
//				angle4_3 <= angle4 % 8'd10;
//				angle_out_4 <= {angle4_1[3:0], angle4_2[3:0], angle4_3[3:0]};
//				angle_out <= angle_out_4;
//			end
//			default: angle_out <= angle_out;
//		endcase
//	end
	
endmodule
