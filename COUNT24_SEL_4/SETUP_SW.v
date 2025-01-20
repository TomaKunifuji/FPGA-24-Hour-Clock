module SETUP_SW (CLK, ENABLE_kHz, BTN, BAP_BTN);
input ENABLE_kHz, CLK, BTN;
output BAP_BTN;

reg [1:0] META = 2'b00, ED = 2'b00;
reg [3:0] SFT = 3'b000;
wire CHATA;

always @(posedge CLK)
    META <= {META[0], BTN};

always @(posedge CLK)
    if(ENABLE_kHz == 1'b1)
        SFT <= {SFT[2:0], META[1]};

assign CHATA = &SFT;    

always @(posedge CLK)
    ED <= {ED[0], CHATA};

assign BAP_BTN = ED[0] & ~ED[1];

endmodule