
module LED_COLOR2 (SEL_MODE, CURRENT_STATE_COLOR);
input [4:0] SEL_MODE;
output reg [2:0] CURRENT_STATE_COLOR;

`include "param.v"

always @(SEL_MODE)
    case (SEL_MODE)
        SET_TIME  : CURRENT_STATE_COLOR     <= 3'b001;
        TIME      : CURRENT_STATE_COLOR     <= 3'b010;
        ALARM     : CURRENT_STATE_COLOR     <= 3'b011;
        KITCHEN   : CURRENT_STATE_COLOR     <= 3'b100;
        STOPWATCH : CURRENT_STATE_COLOR     <= 3'b101;
        default : CURRENT_STATE_COLOR       <= 3'b111;
    endcase

endmodule