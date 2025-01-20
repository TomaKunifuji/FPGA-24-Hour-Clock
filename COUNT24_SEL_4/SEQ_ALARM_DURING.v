module SEQUENCER (RESET, CLK, BAP_BTN1, CURRENT_STATE_TIME, SEL_MODE2, SETUP_ALARM0);
input RESET, CLK, BAP_BTN1, SEL_MODE2, SETUP_ALARM0;
output reg [1:0] CURRENT_STATE_TIME;
`include "param.v"

reg [1:0] next_state;

always @(BAP_BTN1 or CURRENT_STATE_TIME)
       if(SEL_MODE2 == 1'b1 && SETUP_ALARM0 == 1'b1)
        case(CURRENT_STATE_TIME)
            NOT_ALARM_DURING : if (BAP_BTN1 == 1'b1)
                            next_state <= ALARM_DURING;
                            else
                            next_state <= NOT_ALARM_DURING;

            ALARM_DURING : if (BAP_BTN1 == 1'b1)
                            next_state <= NOT_ALARM_DURING;
                            else
                            next_state <= ALARM_DURING;



            default : next_state <= ALARM_OFF;
        endcase
//    else

//    next_state <= ALARM_OFF;

always @(posedge CLK or posedge RESET)
    if (RESET == 1'b1)
        ALARM_DURING <= 1';
    else
        ALARM_DURING <= next_state;

endmodule