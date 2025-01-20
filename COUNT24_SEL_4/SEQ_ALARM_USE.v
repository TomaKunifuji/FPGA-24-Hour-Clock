module SEQ_ALARM_USE (RESET, CLK, BAP_BTN3, ALARM_ON, SEL_MODE2, SETUP_ALARM0);
input RESET, CLK, BAP_BTN3, SEL_MODE2, SETUP_ALARM0;
output reg ALARM_ON;

always @(posedge CLK or posedge RESET)
    if (RESET == 1'b1)
        ALARM_ON <= 1'b0;
    else if (SEL_MODE2 == 1'b1 && SETUP_ALARM0 == 1'b1 && BAP_BTN3 == 1'b1)
            ALARM_ON <= ~ALARM_ON;
            
endmodule