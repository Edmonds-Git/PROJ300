module KEY_INPUT(
	input logic KEY0,
	input logic KEY4,
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
	
	logic [3:0] switches;
	logic [7:0] angle_1, angle_2, angle_3, angle_4;
	assign switches = {SW1,SW2,SW3,SW4};
	
	
	always_ff@(posedge clk)
	begin
			if (KEY0 == 0)
			begin
				if (switches == 4'b1000 && (angle1 < 8'd180) && angle_1 == angle1) //1
				begin
					angle_1 <= angle1+4'd1;
				//	angle1 <= angle_1;
				end
				else if (switches == 4'b0100 && (angle2 < 8'd180) && angle_2 == angle2) //2
				begin
					angle_2 <= angle2+4'd1;
				//	angle2 <= angle2;
				end
				else if (switches == 4'b0010 && (angle3 < 8'd180) && angle_3 == angle3) //3
				begin
					angle_3 <= angle3+4'd1;
					//angle3<= angle_3;
				end
				else if (switches == 4'b0001 && (angle4 < 8'd180) && angle_4 == angle4) //4
				begin
					angle_4 <= angle4+4'd1;
				//	angle4 <= angle_4;
				end
			end
			
			else if (KEY3 == 0)
			begin
				if (switches == 4'b1000 && (angle1 > 8'd0) && angle_1 == angle1) //1
				begin
					angle_1 <= angle1-4'd1;
					//angle1 <= angle_1;
				end
				else if (switches == 4'b0100 && (angle2 > 8'd0) && angle_2 == angle2) //2
				begin
					angle_2 <= angle2-4'd1;
					//angle2 <= angle2;
				end
				else if (switches == 4'b0010 && (angle3 > 8'd0) && angle_3 == angle3) //3
				begin
					angle_3 <= angle3-4'd1;
					//angle3<= angle_3;
				end
				else if (switches == 4'b0001 && (angle4 > 8'd0) && angle_4 == angle4) //4
				begin
					angle_4 <= angle4-4'd1;
					//angle4 <= angle_4;
				end
			end
			else
			begin 
			if (switches == 4'b1000 && angle_1 == angle1) //1
				begin
					angle_1 <= angle_1;
					//angle1 <= angle_1;
				end
			else if (switches == 4'b0100 && angle_2 == angle2) //2
				begin
					angle_2 <= angle_2;
					//angle2 <= angle2;
				end
			else if (switches == 4'b0010 && angle_3 == angle3) //3
				begin
					angle_3 <= angle_3;
					//angle3<= angle_3;
				end
			else if (switches == 4'b0001 && angle_4 == angle4) //4
				begin
					angle_4 <= angle_4;
					//angle4 <= angle_4;
				end
//				angle_1 <= angle_1;
//				angle_2 <= angle_2;
//				angle_3 <= angle_3;
//				angle_4 <= angle_4;
			end
			if (KEY4 == 0 && KEY0 == 1 && KEY3 ==1) 
			begin
				if (switches == 4'b1000 && angle_1 == angle1 && KEY0 == 1 && KEY3 ==1) //1
				begin
					angle_1 <= 8'd10;
					//angle1 <= angle_1;
				end
				else if (switches == 4'b0100 && angle_2 == angle2 && KEY0 == 1 && KEY3 ==1) //2
				begin
					angle_2 <= 8'd10;
					//angle2 <= angle2;
				end
				else if (switches == 4'b0010 && angle_3 == angle3 && KEY0 == 1 && KEY3 ==1) //3
				begin
					angle_3 <= 8'd10;
					//angle3<= angle_3;
				end
				else if (switches == 4'b0001 && angle_4 == angle4 && KEY0 == 1 && KEY3 ==1) //4
				begin
					angle_4 <= 8'd10;
					//angle4 <= angle_4;
				end
			end
	end
//	
	always_ff@(posedge clk)
	begin
	if (KEY0 == 1 && KEY4 == 1 && KEY3 == 1)
	begin
//		angle1 <= angle_1;
//		angle2 <= angle_2;
//		angle3 <= angle_3;
//		angle4 <= angle_4;
		if (switches == 4'b1000 && angle_1 != angle1) //1
		begin
			angle1 <= angle_1;
		end
		else if (switches == 4'b0100 && angle_2 != angle2) //2
		begin
			angle2 <= angle_2;
		end
		else if (switches == 4'b0010 && angle_3 != angle3) //3
		begin
			angle3 <= angle_3;
		end
		else if (switches == 4'b0001 && angle_4 != angle4) //4
		begin
			angle4 <= angle_4;
		end
	end
	else
	begin
		if (switches == 4'b1000) //1
		begin
			angle1 <= angle1;
		end
		else if (switches == 4'b0100) //2
		begin
			angle2 <= angle2;
		end
		else if (switches == 4'b0010) //3
		begin
			angle3 <= angle3;
		end
		else if (switches == 4'b0001) //4
		begin
			angle4 <= angle4;
		end
//		angle1 <= angle1;
//		angle2 <= angle2;
//		angle3 <= angle3;
//		angle4 <= angle4;
	end
	end
	
endmodule
