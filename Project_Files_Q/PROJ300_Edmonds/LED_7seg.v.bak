//=====================================================================
//7-segments LED displays
//=====================================================================

module LED_7seg(
	 input [7:0] Data_in,
	 output [6:0] seg_H, seg_L
);

reg [6:0] SevenSeg_H;
reg [6:0] SevenSeg_L;

always @(*)
begin
	case(Data_in[3:0])
	 4'h0: SevenSeg_L = 7'b0000001;		//0
    4'h1: SevenSeg_L = 7'b1001111;		//1
    4'h2: SevenSeg_L = 7'b0010010;		//2
    4'h3: SevenSeg_L = 7'b0000110;		//3
    4'h4: SevenSeg_L = 7'b1001100;		//4
    4'h5: SevenSeg_L = 7'b0100100;		//5
    4'h6: SevenSeg_L = 7'b0100000;		//6
    4'h7: SevenSeg_L = 7'b0001111;		//7
    4'h8: SevenSeg_L = 7'b0000000;		//8
    4'h9: SevenSeg_L = 7'b0001100;		//9
	 4'ha: SevenSeg_L = 7'b0001000;		//A
	 4'hb: SevenSeg_L = 7'b1100000;		//b
	 4'hc: SevenSeg_L = 7'b0110001;		//C
	 4'hd: SevenSeg_L = 7'b1000010;		//d
	 4'he: SevenSeg_L = 7'b0110000;		//E
	 4'hf: SevenSeg_L = 7'b0111000;		//F
	 
	endcase
	
	case(Data_in[7:4])
	 4'h0: SevenSeg_H = 7'b0000001;		//0
    4'h1: SevenSeg_H = 7'b1001111;		//1
    4'h2: SevenSeg_H = 7'b0010010;		//2
    4'h3: SevenSeg_H = 7'b0000110;		//3
    4'h4: SevenSeg_H = 7'b1001100;		//4
    4'h5: SevenSeg_H = 7'b0100100;		//5
    4'h6: SevenSeg_H = 7'b0100000;		//6
    4'h7: SevenSeg_H = 7'b0001111;		//7
    4'h8: SevenSeg_H = 7'b0000000;		//8
    4'h9: SevenSeg_H = 7'b0001100;		//9
	 4'ha: SevenSeg_H = 7'b0001000;		//A
	 4'hb: SevenSeg_H = 7'b1100000;		//b
	 4'hc: SevenSeg_H = 7'b0110001;		//C
	 4'hd: SevenSeg_H = 7'b1000010;		//d
	 4'he: SevenSeg_H = 7'b0110000;		//E
	 4'hf: SevenSeg_H = 7'b0111000;		//F
	 
	endcase
end

assign {seg_H[0],seg_H[1],seg_H[2],seg_H[3],seg_H[4],seg_H[5],seg_H[6]} = SevenSeg_H;
assign {seg_L[0],seg_L[1],seg_L[2],seg_L[3],seg_L[4],seg_L[5],seg_L[6]} = SevenSeg_L;

endmodule
