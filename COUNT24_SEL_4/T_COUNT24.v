module T_COUNT24;
reg RESET, SEL_DOWN, CLK, BTN1, BTN2;
wire [7:0] LED7seg;
wire [3:0] SA;

parameter SIM_SEC1_MAX = 2;
parameter CYCLE = 100;

COUNT24 i0(.RESET(RESET), .SEL_DOWN(SEL_DOWN), .CLK(CLK), .LED7seg(LED7seg), .SA(SA), .BTN1(BTN1), .BTN2(BTN2), .BTN3(BTN3));

defparam i0.i0.SEC1_MAX = SIM_SEC1_MAX;

always #(CYCLE/2)
    CLK = ~CLK;

initial
begin
    RESET = 1'b1;
    CLK = 1'b1;
    SEL_DOWN = 1'b0;
    BTN1 = 1'b0;
    BTN2 = 1'b0;
    #CYCLE RESET = 1'b0;
    #(CYCLE*24*60*60*SIM_SEC1_MAX)
    SEL_DOWN = 1'b1;
    BTN2 = 1'b1;
    #(CYCLE*24*60*60*SIM_SEC1_MAX)
    SEL_DOWN = 1'b0;
    BTN1 = 1'b1;
    #(CYCLE*24*60*60*SIM_SEC1_MAX)$finish;
end
endmodule
