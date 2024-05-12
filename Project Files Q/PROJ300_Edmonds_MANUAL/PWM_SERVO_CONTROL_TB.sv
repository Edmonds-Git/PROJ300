module PWM_SERVO_CONTROL_TB;
	logic servo1;
	logic servo2;
	logic servo3;
	logic servo4;
	logic clk;
	logic nextangle; //used to reset and assign new values
	logic [7:0]angle1;
	logic [7:0]angle2;
	logic [7:0]angle3;
	logic [7:0]angle4;
	//pass and fail used to view how many asserts failed
	logic [7:0]pass = 0;
	logic [7:0]fail = 0;
	PWM_SERVO_CONTROL u1(servo1,servo2,servo3,servo4,clk,nextangle,angle1,angle2,angle3,angle4);
	
	initial 
	begin
		clk = 1;
		nextangle = 0;
		forever // run clock forever
		begin
			#10ns clk = ~clk;
		end
	end
	
	initial
	begin
		@(posedge clk)
		angle1 = 8'd180;
		#10ps;
		nextangle = 1'd1;
		@(posedge clk)
		nextangle = 0;
		@(posedge clk)
		assert (servo1 == 0) begin pass = pass +1; $display ("pass servo1 is %d PWM is working",servo1);end else begin $error ("fail servo is %d PWM is not working", servo1); fail = fail + 1;end
		#17602us;
		assert (servo1 == 1) begin pass = pass +1; $display ("pass servo1 is %d PWM is working",servo1);end else begin $error ("fail servo is %d PWM is not working", servo1); fail = fail + 1;end
		#2399us;
		assert (servo1 == 0) begin pass = pass +1; $display ("pass servo1 is %d PWM is working",servo1);end else begin $error ("fail servo is %d PWM is not working", servo1); fail = fail + 1;end
		@(posedge clk)
		nextangle = 1'd0;
		$stop;
	end
endmodule