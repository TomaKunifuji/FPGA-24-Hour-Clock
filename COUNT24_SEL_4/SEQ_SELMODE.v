module SEQ_SELMODE (RESET, CLK, BAP_BTN1, CURRENT_STATE_TIME);
input RESET, CLK, BAP_BTN1;
output reg [4:0] CURRENT_STATE_TIME;
`include "param.v"

reg [4:0] next_state;

always @(BAP_BTN1 or CURRENT_STATE_TIME)
    case(CURRENT_STATE_TIME)

        SET_TIME : if (BAP_BTN1 == 1'b1)
                    next_state <= TIME;
                else
                    next_state <= SET_TIME;

        TIME : if (BAP_BTN1 == 1'b1)
                    next_state <= ALARM;
                else
                    next_state <= TIME;

        ALARM : if (BAP_BTN1 == 1'b1)
                    next_state <= KITCHEN;
                else
                    next_state <= ALARM;

        KITCHEN : if (BAP_BTN1 == 1'b1)
                    next_state <= STOPWATCH;
                else
                    next_state <= KITCHEN;
                    
        STOPWATCH : if (BAP_BTN1 == 1'b1)
                    next_state <= SET_TIME;
                else
                    next_state <= STOPWATCH;

        default : next_state <= SET_TIME;
    endcase

always @(posedge CLK or posedge RESET)
    if (RESET == 1'b1)
        CURRENT_STATE_TIME <= SET_TIME;
    else
        CURRENT_STATE_TIME <= next_state;

endmodule
