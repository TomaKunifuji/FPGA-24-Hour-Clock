module SEQ_SET_TIME (RESET, CLK, BAP_BTN2, CURRENT_STATE_TIME, SEL_MODE0);
input RESET, CLK, BAP_BTN2, SEL_MODE0;
output reg [6:0] CURRENT_STATE_TIME;
`include "param.v"

reg [6:0] next_state;

always @(BAP_BTN2 or SEL_MODE0 or CURRENT_STATE_TIME)
    if(SEL_MODE0 == 1'b1)
        case(CURRENT_STATE_TIME)
            BASE : if (BAP_BTN2 == 1'b1)
                        next_state <= HOUR10;
                    else
                        next_state <= BASE;
        
            HOUR10 : if (BAP_BTN2 == 1'b1)
                        next_state <= HOUR1;
                    else
                        next_state <= HOUR10;

            HOUR1 : if (BAP_BTN2 == 1'b1)
                        next_state <= MIN10;
                    else
                        next_state <= HOUR1;

            MIN10 : if (BAP_BTN2 == 1'b1)
                        next_state <= MIN1;
                    else
                        next_state <= MIN10;

            MIN1 : if (BAP_BTN2 == 1'b1)
                        next_state <= SEC10;
                    else
                        next_state <= MIN1;

            SEC10 : if (BAP_BTN2 == 1'b1)
                        next_state <= SEC1;
                    else
                        next_state <= SEC10;

            SEC1: if (BAP_BTN2 == 1'b1)
                        next_state <= BASE;
                    else
                        next_state <= SEC1;
            
            default : next_state <= BASE;    
        endcase
    else
       next_state <= BASE;
       
always @(posedge CLK or posedge RESET)
    if(RESET == 1'b1)
        CURRENT_STATE_TIME <= BASE;
    else
        CURRENT_STATE_TIME <= next_state;

endmodule
