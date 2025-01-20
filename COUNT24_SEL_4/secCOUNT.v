module secCOUNT (RESET, CLK, ENABLE, ENABLE_kHz, EN05);
input RESET, CLK;
output ENABLE, ENABLE_kHz, EN05;
parameter SEC1_MAX = 125000000; // 125MHz

reg [26:0] tmp_count;
//reg [26:0] tmp_BTN2;
//reg tmp_HBTN2 = 1'b0;

always @(posedge CLK or posedge RESET)
begin
   if (RESET == 1'b1)
       tmp_count <= 27'h0000000;
   else if (ENABLE == 1'b1)
       tmp_count <= 27'h0000000;
   else
       tmp_count <= tmp_count + 27'h1;
end

/*always @(posedge CLK or posedge RESET)
begin
   if (RESET == 1'b1)
       tmp_BTN2 <= 27'h0000000;
   else if (BAP_BTN2 == 1'b1)
       tmp_BTN2 <= tmp_BTN2 + 27'h1;
   else 
       tmp_BTN2 <= 27'h0000000;
end


always @(posedge CLK or posedge RESET)
begin
   if (RESET == 1'b1)
       tmp_HBTN2 <= 1'b0;
   else if (tmp_BTN2 == (SEC1_MAX - 1))
       tmp_HBTN2 <= 1'b1;
   else if (BAP_BTN2 == 1'b0)
       tmp_HBTN2 <= 1'b0;
end
*/


assign ENABLE = (tmp_count == (SEC1_MAX - 1))? 1'b1 : 1'b0;
//assign HBTN2 = (tmp_HBTN2 == 1'b1)? (BAP_BTN2 == 1'b1)? 1'b1 : 1'b0 : 1'b0;
//assign ENABLE_kHz = (tmp_count[15:0] == 16'h0000)? 1'b1 : 1'b0;
assign ENABLE_kHz = (tmp_count[15:0] == 16'hFFFF)? 1'b1 : 1'b0;
assign EN05 = (tmp_count >= SEC1_MAX/2)? 1'b1 : 1'b0;

endmodule