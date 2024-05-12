module ANGLE_OUTPUT_UNIT_TB;
logic [7:0]angle1;
logic [7:0]angle2;
logic [7:0]angle3;
logic [7:0]angle4;
logic clk;
logic SW1;
logic SW2;
logic SW3;
logic SW4;
logic SW6;
logic SW7;
logic SW8;
logic SW9;
ANGLE_OUTPUT_UNIT u1(angle1,angle2,angle3,angle4,clk,SW1,SW2,SW3,SW4,SW6,SW7,SW8,SW9);

	initial 
	begin
		clk = 1;
		angle1 = 8'd200; //set default value of angles to 200 so the "is not zero" checks function correctly
		angle2 = 8'd200;
		angle3 = 8'd200;
		angle4 = 8'd200;
		forever // run clock forever
		begin
			#10ns clk = ~clk;
		end
	end
	
	initial 
	begin
		@(posedge clk)
		//angle 1 test
		$display ("testing angle1");
		SW1 = 0;
		SW2 = 0;
		SW3 = 0;
		SW4 = 0;
		@(posedge clk)
		#10ps;
		assert (angle1 != 8'd0) $display ("pass angle1 is %d",angle1); else $error ("fail angle1 is %d", angle1);
		@(posedge clk)
		SW9 = 1;
		@(posedge clk)
		#10ps;
		assert (angle1 == 8'd0) $display ("pass angle1 is %d",angle1); else $error ("fail angle1 is %d", angle1);
		@(posedge clk)
		SW9 = 0;
		SW1 = 1;
		SW2 = 1;
		SW3 = 0;
		SW4 = 0;
		@(posedge clk)
		#10ps;
		assert (angle1 != 8'd90) $display ("pass angle1 is %d",angle1); else $error ("fail angle1 is %d", angle1);
		@(posedge clk)
		SW9 = 1;
		@(posedge clk)
		#10ps;
		assert (angle1 == 8'd90) $display ("pass angle1 is %d",angle1); else $error ("fail angle1 is %d", angle1);
		@(posedge clk)
		SW9 = 0;
		SW1 = 1;
		SW2 = 1;
		SW3 = 1;
		SW4 = 1;
		@(posedge clk)
		#10ps;
		assert (angle1 != 8'd180) $display ("pass angle1 is %d",angle1); else $error ("fail angle1 is %d", angle1);
		@(posedge clk)
		SW9 = 1;
		@(posedge clk)
		#10ps;
		assert (angle1 == 8'd180) $display ("pass angle1 is %d",angle1); else $error ("fail angle1 is %d", angle1);
		$display ("angle1 test complete");
		//angle 1 test complete
		@(posedge clk)
		$display ("testing angle2");
		SW8 = 0;
		SW1 = 0;
		SW2 = 0;
		SW3 = 0;
		SW4 = 0;
		@(posedge clk)
		#10ps;
		assert (angle2 != 8'd0) $display ("pass angle2 is %d",angle1); else $error ("fail angle2 is %d", angle1);
		@(posedge clk)
		SW8 = 1;
		@(posedge clk)
		#10ps;
		assert (angle2 == 8'd0) $display ("pass angle2 is %d",angle1); else $error ("fail angle2 is %d", angle1);
		@(posedge clk)
		SW8 = 0;
		SW1 = 1;
		SW2 = 1;
		SW3 = 0;
		SW4 = 0;
		@(posedge clk)
		#10ps;
		assert (angle2 != 8'd90) $display ("pass angle2 is %d",angle1); else $error ("fail angle2 is %d", angle1);
		@(posedge clk)
		SW8 = 1;
		@(posedge clk)
		#10ps;
		assert (angle2 == 8'd90) $display ("pass angle2 is %d",angle1); else $error ("fail angle2 is %d", angle1);
		@(posedge clk)
		SW8 = 0;
		SW1 = 1;
		SW2 = 1;
		SW3 = 1;
		SW4 = 1;
		@(posedge clk)
		#10ps;
		assert (angle2 != 8'd180) $display ("pass angle2 is %d",angle1); else $error ("fail angle2 is %d", angle1);
		@(posedge clk)
		SW8 = 1;
		@(posedge clk)
		#10ps;
		assert (angle2 == 8'd180) $display ("pass angle2 is %d",angle1); else $error ("fail angle2 is %d", angle1);
		$display ("angle2 test complete");
		@(posedge clk)
		$display ("testing angle3");
		SW7 = 0;
		SW1 = 0;
		SW2 = 0;
		SW3 = 0;
		SW4 = 0;
		@(posedge clk)
		#10ps;
		assert (angle3 != 8'd0) $display ("pass angle3 is %d",angle1); else $error ("fail angle3 is %d", angle1);
		@(posedge clk)
		SW7 = 1;
		@(posedge clk)
		#10ps;
		assert (angle3 == 8'd0) $display ("pass angle3 is %d",angle1); else $error ("fail angle3 is %d", angle1);
		@(posedge clk)
		SW7 = 0;
		SW1 = 1;
		SW2 = 1;
		SW3 = 0;
		SW4 = 0;
		@(posedge clk)
		#10ps;
		assert (angle3 != 8'd90) $display ("pass angle3 is %d",angle1); else $error ("fail angle3 is %d", angle1);
		@(posedge clk)
		SW7 = 1;
		@(posedge clk)
		#10ps;
		assert (angle3 == 8'd90) $display ("pass angle3 is %d",angle1); else $error ("fail angle3 is %d", angle1);
		@(posedge clk)
		SW7 = 0;
		SW1 = 1;
		SW2 = 1;
		SW3 = 1;
		SW4 = 1;
		@(posedge clk)
		#10ps;
		assert (angle3 != 8'd180) $display ("pass angle3 is %d",angle1); else $error ("fail angle3 is %d", angle1);
		@(posedge clk)
		SW7 = 1;
		@(posedge clk)
		#10ps;
		assert (angle3 == 8'd180) $display ("pass angle3 is %d",angle1); else $error ("fail angle3 is %d", angle1);
		$display ("angle3 test complete");
		@(posedge clk)
		$display ("testing angle4");
		SW6 = 0;
		SW1 = 0;
		SW2 = 0;
		SW3 = 0;
		SW4 = 0;
		@(posedge clk)
		#10ps;
		assert (angle4 != 8'd0) $display ("pass angle4 is %d",angle1); else $error ("fail angle4 is %d", angle1);
		@(posedge clk)
		SW6 = 1;
		@(posedge clk)
		#10ps;
		assert (angle4 == 8'd0) $display ("pass angle4 is %d",angle1); else $error ("fail angle4 is %d", angle1);
		@(posedge clk)
		SW6 = 0;
		SW1 = 1;
		SW2 = 1;
		SW3 = 0;
		SW4 = 0;
		@(posedge clk)
		#10ps;
		assert (angle4 != 8'd90) $display ("pass angle4 is %d",angle1); else $error ("fail angle4 is %d", angle1);
		@(posedge clk)
		SW6 = 1;
		@(posedge clk)
		#10ps;
		assert (angle4 == 8'd90) $display ("pass angle4 is %d",angle1); else $error ("fail angle4 is %d", angle1);
		@(posedge clk)
		SW6 = 0;
		SW1 = 1;
		SW2 = 1;
		SW3 = 1;
		SW4 = 1;
		@(posedge clk)
		#10ps;
		assert (angle4 != 8'd180) $display ("pass angle4 is %d",angle1); else $error ("fail angle4 is %d", angle1);
		@(posedge clk)
		SW6 = 1;
		@(posedge clk)
		#10ps;
		assert (angle4 == 8'd180) $display ("pass angle4 is %d",angle1); else $error ("fail angle4 is %d", angle1);
		$display ("angle4 test complete");
		@(posedge clk)
		$stop;
	end
endmodule
		