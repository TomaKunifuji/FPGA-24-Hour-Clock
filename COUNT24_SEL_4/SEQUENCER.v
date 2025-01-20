module SEQUENCER (RESET, CLK, BAP_BTN3, CURRENT_STATE_TIME,SEL_MODE1);
input RESET, CLK, BAP_BTN3, SEL_MODE1;
output reg [1:0] CURRENT_STATE_TIME;
`include "param.v"

reg [1:0] next_state;

always @(BAP_BTN3 or SEL_MODE1 or CURRENT_STATE_TIME)
    if(SEL_MODE1 == 1'b1)
        case(CURRENT_STATE_TIME)
            MIN_SEC : if (BAP_BTN3 == 1'b1)
                        next_state <= HOUR_MIN;
                    else
                        next_state <= MIN_SEC;

            HOUR_MIN : if (BAP_BTN3 == 1'b1)
                        next_state <= MIN_SEC;
                    else
                        next_state <= HOUR_MIN;

            default : next_state <= MIN_SEC;
        endcase
    else

    next_state <= MIN_SEC;

always @(posedge CLK or posedge RESET)
    if (RESET == 1'b1)
        CURRENT_STATE_TIME <= MIN_SEC;
    else
        CURRENT_STATE_TIME <= next_state;

endmodule
