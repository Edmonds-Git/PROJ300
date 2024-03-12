module FPA_ADD_SUB_MK3 (
	output logic [31:0]y,
	output logic errorwarning,
	input logic [31:0]x1,
	input logic [31:0]x2);

//scaling factor Q7.24
localparam SF = 2.0**-24.0; 
//assign errorwarning = 0;
always_comb
	begin
		y = x1 + x2;
		if (((x1[31] == 1) && (x2[31] == 1) && (y[31] == 0)) || ((x1[31] == 0) && (x2[31] == 0) && (y[31] == 1)))
			begin
				errorwarning = 1;
			end
	end
endmodule