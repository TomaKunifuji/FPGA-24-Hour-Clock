module DE_SELECTER(CLK, RESET, SEL, L1, L2, L3, L4, 
         COUNT_10, COUNT_10m, COUNT_10h, COUNT_6, COUNT_6m, COUNT_2h,
         EN05, SEL_MODE, SETUP_TIME,
         ACOUNT_10m, ACOUNT_10h, ACOUNT_6m, ACOUNT_2h, BAP_BTN1, SETUP_ALARM, ALARM_STATE, ALARM_ON);
input [6:0] SETUP_TIME;
input [4:0] SEL_MODE,SETUP_ALARM;
input [3:0] COUNT_10, COUNT_10m, COUNT_10h, ACOUNT_10m, ACOUNT_10h;
input [2:0] COUNT_6, COUNT_6m, ACOUNT_6m;
input [1:0] COUNT_2h, ACOUNT_2h, SEL;
input CLK, RESET, EN05, ALARM_ON, BAP_BTN1;
output[3:0] L1, L2, L3, L4;
output ALARM_STATE;

reg [3:0] L1, L2, L3, L4;
reg ALARM_FLAG, ALARM_FLAG_FF, ALARM_FLAG_FF2, ALARM_DURING;


always @(*)
begin
    case(1'b1)
        //==============================SETTIME======================================//
        SEL_MODE[0] :        //SET_TIME
            case(1'b1)
                SETUP_TIME[0] :     //BASE
                    begin
                        L1 <= COUNT_10m        | {4{EN05}};
                        L2 <= {1'b0,COUNT_6m}  | {4{EN05}};
                        L3 <= COUNT_10h        | {4{EN05}};
                        L4 <= {2'b00,COUNT_2h} | {4{EN05}};
                    end

                SETUP_TIME[1] :      //HOUR2
                    begin
                        L1 <= COUNT_10m;       
                        L2 <= {1'b0,COUNT_6m}; 
                        L3 <= COUNT_10h;       
                        L4 <= {2'b00,COUNT_2h}  | {4{EN05}};
                    end

                SETUP_TIME[2] :      //HOUR4
                    begin
                        L1 <= COUNT_10m;       
                        L2 <= {1'b0,COUNT_6m}; 
                        L3 <= COUNT_10h         | {4{EN05}};
                        L4 <= {2'b00,COUNT_2h};
                    end

                SETUP_TIME[3] :      //MIN6
                    begin
                         L1 <= COUNT_10m;       
                        L2 <= {1'b0,COUNT_6m}   | {4{EN05}}; 
                        L3 <= COUNT_10h;       
                        L4 <= {2'b00,COUNT_2h};
                    end

                SETUP_TIME[4] :      //MIN10
                    begin
                        L1 <= COUNT_10m         | {4{EN05}};       
                        L2 <= {1'b0,COUNT_6m}; 
                        L3 <= COUNT_10h;       
                        L4 <= {2'b00,COUNT_2h};
                    end

                SETUP_TIME[5] :      //SEC6
                    begin
                        L1 <= COUNT_10;        
                        L2 <= {1'b0,COUNT_6}   | {4{EN05}};
                        L3 <= 4'hf;
                        L4 <= 4'hf;
                    end

                SETUP_TIME[6] :      //SEC10
                    begin
                        L1 <= COUNT_10         | {4{EN05}};
                        L2 <= {1'b0,COUNT_6};
                        L3 <= 4'hf;
                        L4 <= 4'hf;
                    end

            endcase
        //==============================TIME======================================//
        SEL_MODE[1] :       
        begin
            if(SEL == 2'b10) //hour:min  min:sec
            begin            // PSW
                L1 <= COUNT_10m;
                L2 <= {1'b0,COUNT_6m};
                L3 <= COUNT_10h;
                L4 <= {2'b00,COUNT_2h};
            end
            else
            begin
                L1 <= COUNT_10;
                L2 <= {1'b0,COUNT_6};
                L3 <= COUNT_10m;
                L4 <= {1'b0,COUNT_6m};
            end
        end

        //==============================ALARM======================================//
        SEL_MODE[2] :        //ALARM
            begin
                case(1'b1)
                SETUP_ALARM[0] :     //BASE
                    begin
                        if(ALARM_ON == 1'b0)
                        begin
                            L1 <= 4'hA;     //F
                            L2 <= 4'hA;     //F
                            L3 <= 4'h0;     //O
                            L4 <= 4'hF;
                        end
                        else
                        begin
                            L1 <= 4'hB;     //n
                            L2 <= 4'h0;     //O
                            L3 <= 4'hF;
                            L4 <= 4'hF;
                        end

                    end

                SETUP_ALARM[1] :      //HOUR2
                    begin
                        L1 <= ACOUNT_10m;       
                        L2 <= {1'b0,ACOUNT_6m}; 
                        L3 <= ACOUNT_10h;       
                        L4 <= {2'b00,ACOUNT_2h}  | {4{EN05}};
                    end

                SETUP_ALARM[2] :      //HOUR4
                    begin
                        L1 <= ACOUNT_10m;       
                        L2 <= {1'b0,ACOUNT_6m}; 
                        L3 <= ACOUNT_10h         | {4{EN05}};
                        L4 <= {2'b00,ACOUNT_2h};
                    end

                SETUP_ALARM[3] :      //MIN6
                    begin
                        L1 <= ACOUNT_10m;       
                        L2 <= {1'b0,ACOUNT_6m}   | {4{EN05}}; 
                        L3 <= ACOUNT_10h;       
                        L4 <= {2'b00,ACOUNT_2h};
                    end

                SETUP_ALARM[4] :      //MIN10
                    begin
                        L1 <= ACOUNT_10m         | {4{EN05}};       
                        L2 <= {1'b0,ACOUNT_6m}; 
                        L3 <= ACOUNT_10h;       
                        L4 <= {2'b00,ACOUNT_2h};
                    end
                default : 
                    begin // Error
                        L1 <= 4'he;
                        L2 <= 4'he;
                        L3 <= 4'he;
                        L4 <= 4'he;
                    end
                endcase
            end
        //==============================KITCHEN======================================//

        SEL_MODE[3] :        //KITCHEN 
            begin
                L1 <= 4'h3;
                L2 <= 4'h3;
                L3 <= 4'h3;
                L4 <= 4'h3;
            end

        //==============================STOPWATCH======================================//
        SEL_MODE[4] :        //STOPWATCH
            begin
                L1 <= 4'h4;
                L2 <= 4'h4;
                L3 <= 4'h4;
                L4 <= 4'h4;
            end

        default :
            begin
                L1 <= 4'hf;
                L2 <= 4'hf;
                L3 <= 4'hf;
                L4 <= 4'hf;
            end

    endcase
end




always @(*)  
    if({COUNT_10m, COUNT_10h, COUNT_6m, COUNT_2h} == {ACOUNT_10m, ACOUNT_10h, ACOUNT_6m, ACOUNT_2h})
        ALARM_FLAG <= 1'b1;
    else
        ALARM_FLAG <= 1'b0;

always @(posedge CLK or posedge RESET)          //FF1
    if (RESET == 1'b1) 
        ALARM_FLAG_FF <= 1'b0;
    else
        ALARM_FLAG_FF <= ALARM_FLAG;

always @(posedge CLK or posedge RESET)          //FF2
    if (RESET == 1'b1) 
        ALARM_FLAG_FF2 <= 1'b0;
    else
        ALARM_FLAG_FF2 <= ALARM_FLAG_FF;

wire ALARM_FLAG_RISE = ALARM_FLAG_FF & ~ALARM_FLAG_FF2;
wire ALARM_FLAG_FALL = ~ALARM_FLAG_FF & ALARM_FLAG_FF2;

always @(posedge CLK or posedge RESET)          //ALARM_DURING_SEQ
    if (RESET == 1'b1)
        ALARM_DURING <= 1'b0;
    else if(ALARM_FLAG_RISE == 1'b1)
        ALARM_DURING <= 1'b1;
    else if(ALARM_FLAG_FALL == 1'b1 || BAP_BTN1 == 1'b1)
        ALARM_DURING <= 1'b0;

wire ALARM_STATE = ALARM_DURING && (ALARM_ON == 1'b1); 

endmodule
