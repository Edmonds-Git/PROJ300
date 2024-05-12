module KEY_INPUT(
	input logic KEY0,
	input logic KEY3,
	input logic SW1,
	input logic SW2,
	input logic SW3,
	input logic SW4,
	output logic [7:0]angle1 = 0,
	output logic [7:0]angle2 = 0,
	output logic [7:0]angle3 = 0,
	output logic [7:0]angle4 = 0,
	output logic [11:0]angle_out = 0);
	
	logic [3:0] switches;
	logic [3:0] out1_1, out1_2, out1_3;
	logic [3:0] angle1_1, angle1_2, angle1_3, angle2_1, angle2_2, angle2_3, angle3_1, angle3_2, angle3_3, angle4_1, angle4_2, angle4_3;
	logic [11:0] angle_out_1, angle_out_2, angle_out_3, angle_out_4;
	//logic [3:0] angleswitch;
	assign switches = {SW1,SW2,SW3,SW4};
	
	
	always@( KEY0 or  KEY3)
	begin
			if (KEY0 == 1)
			begin
				if (switches == 4'b1000) //1
					angle1 = angle1+4'd1;
			end
			else
				if (switches == 4'b1000) //1
				angle1 = angle1-4'd1;
			end
			else if (switches == 4'b0100) //2
			begin
				begin
					if (switches == 4'b1000) //1
						angle2 = angle2+4'd1;
				end
				else
					begin
					if (switches == 4'b1000) //1
						angle2 = angle2-4'd1;
					end
			end
			else if (switches == 4'b0010) //3
			begin
				if (KEY0 == 1)
					angle3 = angle3+4'd1;
				else
				begin
					angle3 = angle3-4'd1;
				end
			end
			else if (switches == 4'b0001) //4
			begin
				if (KEY0 == 1)
					angle4 = angle4+4'd1;
				else
				begin
					angle4 = angle4-4'd1;
				end
			end
	end
	
	always_comb
		if (switches == 4'b1000)
		begin
			angle1_1 = angle1 % 100;
			angle1_2 = (angle1 % 100) / 10;
			angle1_3 = angle1 % 10;
			angle_out_1 = {angle1_1, angle1_2, angle1_3};
			angle_out = angle_out_1;
		end
		else if (switches == 4'b0100) //2
		begin
			angle2_1 = angle2 % 100;
			angle2_2 = (angle2 % 100) / 10;
			angle2_3 = angle2 % 10;
			angle_out_2 = {angle2_1, angle2_2, angle2_3};
			angle_out = angle_out_1;
		end
		else if (switches == 4'b0010) //3
		begin
			angle3_1 = angle3 % 100;
			angle3_2 = (angle3 % 100) / 10;
			angle3_3 = angle3 % 10;
			angle_out_3 = {angle3_1, angle3_2, angle3_3};
			angle_out = angle_out_3;
		end
		else if (switches == 4'b0001) //4
		begin
			angle4_1 = angle4 % 100;
			angle4_2 = (angle4 % 100) / 10;
			angle4_3 = angle4 % 10;
			angle_out_4 = {angle4_1, angle4_2, angle4_3};
			angle_out = angle_out_4;
		end
	end
	
endmodule
