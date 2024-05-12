//============================================================================================
//7-segments LED displays - modified version of https://github.com/arnaudeveloper/Display_7seg
//============================================================================================
// Credit for this goes to https://github.com/arnaudeveloper
//============================================================================================
module LED_7seg(
	 input [11:0] Data_in,
	 input clk,
	 input target_reached,
	 output [6:0] seg_H, seg_M, seg_L, seg_t
);

reg [6:0] SevenSeg_H;
reg [6:0] SevenSeg_M;
reg [6:0] SevenSeg_L;
reg [6:0] sevenseg_t;

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
	 default:SevenSeg_L = 7'b0000001;	
	endcase
	
	case(Data_in[7:4])
	 4'h0: SevenSeg_M = 7'b0000001;		//0
    4'h1: SevenSeg_M = 7'b1001111;		//1
    4'h2: SevenSeg_M = 7'b0010010;		//2
    4'h3: SevenSeg_M = 7'b0000110;		//3
    4'h4: SevenSeg_M = 7'b1001100;		//4
    4'h5: SevenSeg_M = 7'b0100100;		//5
    4'h6: SevenSeg_M = 7'b0100000;		//6
    4'h7: SevenSeg_M = 7'b0001111;		//7
    4'h8: SevenSeg_M = 7'b0000000;		//8
    4'h9: SevenSeg_M = 7'b0001100;		//9
	 4'ha: SevenSeg_M = 7'b0001000;		//A
	 4'hb: SevenSeg_M = 7'b1100000;		//b
	 4'hc: SevenSeg_M = 7'b0110001;		//C
	 4'hd: SevenSeg_M = 7'b1000010;		//d
	 4'he: SevenSeg_M = 7'b0110000;		//E
	 4'hf: SevenSeg_M = 7'b0111000;		//F
	 default:SevenSeg_M = 7'b0000001;	
	 
	 endcase
	 
	 case(Data_in[11:8])
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
	 default:SevenSeg_H = 7'b0000001;	
	 
	endcase
	case(target_reached)
	1: sevenseg_t = 7'b1001111;
	default:sevenseg_t = 7'b0000001;
	endcase
end

assign {seg_H[0],seg_H[1],seg_H[2],seg_H[3],seg_H[4],seg_H[5],seg_H[6]} = SevenSeg_H;
assign {seg_M[0],seg_M[1],seg_M[2],seg_M[3],seg_M[4],seg_M[5],seg_M[6]} = SevenSeg_M;
assign {seg_L[0],seg_L[1],seg_L[2],seg_L[3],seg_L[4],seg_L[5],seg_L[6]} = SevenSeg_L;
assign {seg_t[0],seg_t[1],seg_t[2],seg_t[3],seg_t[4],seg_t[5],seg_t[6]} = sevenseg_t;

endmodule
