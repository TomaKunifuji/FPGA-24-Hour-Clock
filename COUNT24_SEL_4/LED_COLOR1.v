
module LED_COLOR1 (SETUP_TIME,CURRENT_STATE_LED);
input [7:0] SETUP_TIME;
output reg [3:0] CURRENT_STATE_LED;

`include "param.v"

always @(SETUP_TIME)
    case (SETUP_TIME)
        BASE   : CURRENT_STATE_LED <= 4'b0001;
        SEC1   : CURRENT_STATE_LED <= 4'b0010;
        SEC10  : CURRENT_STATE_LED <= 4'b0011;
        MIN1   : CURRENT_STATE_LED <= 4'b0100;
        MIN10  : CURRENT_STATE_LED <= 4'b0101;
        HOUR1  : CURRENT_STATE_LED <= 4'b0110;
        HOUR10 : CURRENT_STATE_LED <= 4'b0111;
        default : CURRENT_STATE_LED  <= 4'b1111;
    endcase

endmodule