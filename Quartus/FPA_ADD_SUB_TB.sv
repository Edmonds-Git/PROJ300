module FPA_ADD_SUB_TB;

////output
logic [31:0]y;
//inputs
logic [31:0]x1;
logic [31:0]x2;
logic clk;
logic test_repeat;
FPA_ADD_SUB_MK3 u1 (y,errorwarning,x1,x2);
localparam SF = 2.0**-24.0; 

initial 
	begin
	clk = 1;
	forever // run clock forever
		begin
			#10ns clk = ~clk;
				if (test_repeat == 1) break;//stop clock when the final test is complete
		end
	end
//
initial
	begin
		x1 = 32'b00011110_001110111110011101101101; //30.234
		x2 = 32'b00001010_101000010100011110101110; //10.63
		#10ps;
		$display("%f + %f = %f", $itor(x1*SF), $itor(x2*SF), $itor(y*SF));
		#10ps;
		x1 = 32'b00011001_011011111101001000100000; //25.4368
		x2 = 32'b11110000_110000101101000011100101; //-15.239
		#10ps;
		$display("%f + %f = %f", $itor(x1*SF), $itor(x2*SF), $itor(y*SF));
	end
endmodule