module FPA_ADD_SUB (
	output logic [31:0]y,
	input logic [31:0]x1,
	input logic [31:0]x2);

// split input	
assign [14:0]interx1 = x1[30:15];
assign [14:0]fractx1 = x1[14:0];
assign [14:0]interx2 = x2[30:15];
assign [14:0]fractx2 = x2[14:0];
// split output
logic [14:0]intout;
logic [14:0]intofl
always_comb
	begin
		// add
		if (((x1[31] == 0) && (x2[31] == 0)) || ((x1[31] == 1) && (x2[31] == 1));
			begin
				for (int i = 0; i < 14; i++)
					begin
						intx1_digi = interx1[i];
						intx2_digi = interx2[i];
							case({intx1_digi,intx2_digi})
								2'b00 : intout[i] = 0;
								2'b01 : intout[i] = 1;
								2'b10 : intout[i] = 1;
								2'b11 : 
									begin 
										intout[i] = 0;
										intofl[i] = 1;
									end
							endcase
					end
			end
		// subtract
		else 
			begin
				for (int i = 0; i < 14; i++)
					begin
						intx1_digi = interx1[i];
						intx2_digi = interx2[i];
							case({intx1_digi,intx2_digi})
								2'b00 : intout[i] = 0;
								2'b01 :
									begin 
										if (x1[31] = 1)
											intout[i] = 1;
										else
											intout[i] = 0;
											intofl[i] = 1;
									end
								2'b10 : 
									begin 
										if (x2[31] = 1)
											intout[i] = 1;
										else
											intout[i] = 0;
											intofl[i] = 1;
									end
								2'b11 : intout[i] = 0;
							endcase
					end
			end
	end