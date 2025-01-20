module DECODER (LED_COUNT, LED7seg);
input [3:0] LED_COUNT;
output [7:0] LED7seg;

reg [7:0] LED7seg_TMP;

always @(LED_COUNT)
begin
	case (LED_COUNT)	      //ABCDEFGDp
		4'h0:LED7seg_TMP[7:1] <= 7'b0000001;
		4'h1:LED7seg_TMP[7:1] <= 7'b1001111;
		4'h2:LED7seg_TMP[7:1] <= 7'b0010010;
		4'h3:LED7seg_TMP[7:1] <= 7'b0000110;
		4'h4:LED7seg_TMP[7:1] <= 7'b1001100;
		4'h5:LED7seg_TMP[7:1] <= 7'b0100100;
		4'h6:LED7seg_TMP[7:1] <= 7'b0100000;
		4'h7:LED7seg_TMP[7:1] <= 7'b0001101;
		4'h8:LED7seg_TMP[7:1] <= 7'b0000000;
		4'h9:LED7seg_TMP[7:1] <= 7'b0000100;
		4'hA:LED7seg_TMP[7:1] <= 7'b0111000;	// F
		4'hB:LED7seg_TMP[7:1] <= 7'b1101010;	// n
		4'hC:LED7seg_TMP[7:1] <= 7'b0110001;
		4'hD:LED7seg_TMP[7:1] <= 7'b1000010;
		4'hE:LED7seg_TMP[7:1] <= 7'b0110000;
//		4'hF:LED7seg_TMP[7:1] <= 7'b0111000;
		4'hF:LED7seg_TMP[7:1] <= 7'b1111111;	// light off
	 default:LED7seg_TMP[7:1] <= 7'bXXXXXX;
	endcase
end


assign LED7seg = LED7seg_TMP;

endmodule