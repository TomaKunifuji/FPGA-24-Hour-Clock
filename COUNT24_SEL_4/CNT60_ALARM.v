module CNT60_ALARM (RESET, CLK, COUNT_10, COUNT_6, SEL_DOWN, BAP_BTN3, SETTIME1, SETTIME10);
input RESET, CLK, SEL_DOWN, BAP_BTN3, SETTIME1, SETTIME10;
output reg [3:0] COUNT_10;
output reg [2:0] COUNT_6;
//output reg COUT;                    

//reg CARRY;

always @(posedge CLK or posedge RESET)         	 //10_COUNT
begin
    if (RESET == 1'b1)                         //RESET_push
       COUNT_10 <= 4'h0; 
//    else if ((ENABLE == 1'b1 && CIN == 1'b1 && BASE == 1'b1) || //usual
//              (BASE == 1'b0 && SETTIME1 == 1'b1 && BAP_BTN3 == 1'b1)) //time set 
    else if (SETTIME1 == 1'b1 && BAP_BTN3 == 1'b1)
        if (SEL_DOWN == 1'b0)                            //UP
               if (COUNT_10 == 4'h9)                 //COUNT_IN_9
                     COUNT_10 <= 4'h0; 
               else
                     COUNT_10 <= COUNT_10 + 4'h1;
	else                            
	   if (COUNT_10 == 4'h0)      
                 COUNT_10 <= 4'h9; 
           else
                 COUNT_10 <= COUNT_10 - 4'h1;

end
/*
always @(COUNT_10 or SEL_DOWN or CIN)               //CARRY_10
begin
	if (SEL_DOWN == 1'b0)
        if (COUNT_10 == 4'h9 && CIN == 1'b1)
            CARRY <= 1'b1;
        else    
            CARRY <= 1'b0;
    else
        if (COUNT_10 == 4'h0 && CIN == 1'b1)
            CARRY <= 1'b1;		
        else
            CARRY <= 1'b0;
end
*/

always @(posedge CLK or posedge RESET)          //6_COUNT
begin
    if (RESET == 1'b1)                          //RESET_push
            COUNT_6 <= 3'b000;
    //else if (ENABLE == 1'b1 && CARRY == 1'b1)
//    else if ((ENABLE == 1'b1 && CARRY == 1'b1 && BASE == 1'b1) || //usual
 //        (BASE == 1'b0 && SETTIME10 == 1'b1 && BAP_BTN3 == 1'b1)) //time set 
    else if (SETTIME10 == 1'b1 && BAP_BTN3 == 1'b1)

	    if (SEL_DOWN == 1'b0)                       //UP
                if (COUNT_6 == 3'b101)         
                    COUNT_6 <= 3'b000;   
           	    else
                    COUNT_6 <= COUNT_6 + 3'b001;
     
	    else                                    //SEL_DOWN
                if (COUNT_6 == 3'b000)        
                    COUNT_6 <= 3'b101;
                else
                    COUNT_6 <= COUNT_6 - 3'b001;
          
end
/*
always @(COUNT_6 or SEL_DOWN or CARRY)              //COUT
begin
	if (SEL_DOWN == 1'b0)
        if (COUNT_6 == 3'b101 && CARRY == 1'b1 )
            COUT <= 1'b1;
        else    
            COUT <= 1'b0;
    else
        if (COUNT_6 == 4'h0 && CARRY == 1'b1 )
            COUT <= 1'b1;		
        else
            COUT <= 1'b0;
end
*/
endmodule