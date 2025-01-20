module DCOUNT (RESET, CLK, ENABLE_kHz, L1, L2, L3, L4, SA, L);
input RESET, CLK, ENABLE_kHz;
input [3:0] L1, L2, L3, L4;
output [3:0] SA;
output [3:0] L;

parameter MAX_COUNT = 3'b111;
reg [2:0] sa_count_tmp;
reg [3:0] sa_count;
reg [3:0] L_tmp;


assign SA = sa_count;
assign L = L_tmp;

always @(posedge CLK or posedge RESET)
begin
    if (RESET == 1'b1) 
     begin   //RESET_push
       sa_count_tmp <= 3'b000;
     end
    else if (ENABLE_kHz == 1'b1)
        if (sa_count_tmp == MAX_COUNT)
            sa_count_tmp <= 3'b000;
        else
            sa_count_tmp <= sa_count_tmp + 1'b1;
end

always @(posedge CLK or posedge RESET)
begin
        if (RESET == 1'b1) 
            begin
                sa_count <= 4'b0000;
                L_tmp <= 4'h0;
            end
        else if (sa_count_tmp[0] == 1'b0) 
            begin
                sa_count <= sa_count; L_tmp <= L_tmp;
            end
        else
                case (sa_count_tmp[2:1])
                    2'b00:begin
                            sa_count <= 4'b1110;L_tmp <= L1;
                        end
                    2'b01:begin
                            sa_count <= 4'b1101;L_tmp <= L2;
                        end
                    2'b10:begin
                            sa_count <= 4'b1011;L_tmp <= L3;
                        end
                    2'b11:begin
                            sa_count <= 4'b0111;L_tmp <= L4;
                        end
                    default:begin
                                sa_count <= 4'bxxxxx;
                        end
                endcase

end
endmodule