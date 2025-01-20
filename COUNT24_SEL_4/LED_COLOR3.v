
module LED_COLOR3 (ALARM_STATE, CURRENT_STATE_COLOR);
input ALARM_STATE;
output reg [2:0] CURRENT_STATE_COLOR;

always @(ALARM_STATE)
    if (ALARM_STATE == 1'b1)
        CURRENT_STATE_COLOR <= 3'b001;
    else
        CURRENT_STATE_COLOR <= 3'b100;


endmodule