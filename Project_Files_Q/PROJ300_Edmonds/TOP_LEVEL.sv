module TOP_LEVEL(
	input logic SW0,
	input logic SW1,
	input logic SW2,
	input logic SW3,
	input logic SW4,
	input logic SW6,
	input logic SW7,
	input logic SW8,
	input logic SW9,
	input logic clk,
	input logic rst,
	output logic servo1,
	output logic servo2,
	output logic servo3,
	output logic servo4,
	output [6:0] seg_H, seg_M, seg_L, seg_t,
	output logic LED0);

	wire logic [7:0]angle1;
	wire logic [7:0]angle2;
	wire logic [7:0]angle3;
	wire logic [7:0]angle4;
	wire logic move_complete;
	wire logic t_restart;
	wire logic [5:0]maze_state;
	wire logic [5:0]next_state;
	wire logic [31:0] final_Q [37][4];
	wire logic [5:0] blocked[16];
	wire logic [5:0]target_state;
	wire logic [5:0]start_state;
	wire logic timer_start;
	wire logic target_reached;
	wire logic [11:0]angle_out;
	wire logic rdy;

	
	
ANGLE_OUTPUT_UNIT ANGLE_OUTPUT_UNIT (
	.angle1(angle1),
	.angle2(angle2),
	.angle3(angle3),
	.angle4(angle4),
	.move_complete(move_complete),
	.t_restart(t_restart),
	.maze_state(maze_state),
	.clk(clk),
	.SW1(SW1),
	.SW2(SW2),
	.SW3(SW3),
	.SW4(SW4),
	.SW6(SW6),
	.SW7(SW7),
	.SW8(SW8),
	.SW9(SW9),
	.rdy(rdy),
	.next_state(next_state),
	.start_state(start_state),
	.rst(rst));
	
	PWM_SERVO_CONTROL PWM_SERVO_CONTROL (
	.servo1(servo1),
	.servo2(servo2),
	.servo3(servo3),
	.servo4(servo4),
	.clk(clk),
	.nextangle(SW0),
	.angle1(angle1),
	.angle2(angle2),
	.angle3(angle3),
	.angle4(angle4));
	
	Q_LEARN_V2 Q_LEARN_V2(
	.clk(clk),
	.rst(rst),
	.final_Q(final_Q),
	.blocked(blocked),
	.target_state(target_state),
	.start_state(start_state),
	.move_complete(move_complete),
	.maze_state(maze_state),
	.next_state(next_state),
	.timer_start(timer_start),
	.target_reached(target_reached));
	
//	Q_EXPLOIT Q_EXPLOIT (
//	.clk(clk),
//	.rst(rst),
//	.final_Q(final_Q),
//	.blocked(blocked),
//	.target_state(target_state),
//	.start_state(start_state),
//	.move_complete(move_complete),
//	.maze_state(maze_state),
//	.next_state(next_state),
//	.timer_start(timer_start),
//	.target_reached(target_reached));
	
	TIMER # (.N(1000000)) TIMER (
	.RDY(rdy), 
	.clk(clk), 
	.T_Start(timer_start), 
	.reset(rst), 
	.T_reStart(t_restart));
	
	ANGLE_DECODE ANGLE_DECODE(
	.angle1(angle1),
	.angle2(angle2),
	.angle3(angle3),
	.angle4(angle4),
	.SW1(SW1),
	.SW2(SW2),
	.SW3(SW3),
	.SW4(SW4),
	.clk(clk),
	.angle_out(angle_out));
	
	LED_7seg LED_7seg(
	 .Data_in(angle_out),
	 .clk(clk),
	 .target_reached(target_reached),
	 .seg_H(seg_H),
	 .seg_M(seg_M),
	 .seg_L(seg_L), 
	 .seg_t(seg_t));
	 
	always@(posedge clk)
	begin
		if (final_Q[1][1] != '0)
			LED0 = 1;
		else
			LED0 = 0;
	end
	
endmodule
