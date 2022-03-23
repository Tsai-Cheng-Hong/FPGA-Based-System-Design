module randomnumber13_module(
input clk,
input clr,
input bin,
output reg[3:0]am,
output reg[4:1]Q,
output reg[3:0]a,
output reg[7:0]out,
output reg[25:0]c=0
);

always@(posedge clk)
begin
 c=c+1;
end		
		
always@(posedge c[23])
 begin
   if(clr) 
	begin
	  Q=4'b100;
	  a=0;
	  end
	else if(bin==1)
	  begin
	    Q={Q[3:1],Q[1]^Q[4]};
		 
		 	if(Q >=10)
       a=1;	
   else if(Q < 10)
	    a=0;
	  end
	  

	else
	   begin Q=Q; end
 end
 
 
 
 always@(c)
  begin	     
    if (c[15]==0) am=4'b1110;       
    if (c[10]==0) am=4'b1101;
  end
 
always@(c[22])
begin
  if(am==4'b1110)
	   begin
		 if     (Q==4'd0)  out=8'b00000011; 
		 else if(Q==4'd1)  out=8'b10011111; 
		 else if(Q==4'd2)  out=8'b00100101; 
		 else if(Q==4'd3)  out=8'b00001101; 
		 else if(Q==4'd4)  out=8'b10011001;
		 else if(Q==4'd5)  out=8'b01001001;
		 else if(Q==4'd6)  out=8'b01000001;
		 else if(Q==4'd7)  out=8'b00011111;
		 else if(Q==4'd8)  out=8'b00000001;
		 else if(Q==4'd9)  out=8'b00001001;
		 else if(Q==4'd10)  out=8'b00000011;
		 else if(Q==4'd11)  out=8'b10011111;
		 else if(Q==4'd12)  out=8'b00100101;
		 else if(Q==4'd13)  out=8'b00001101;
		 else if(Q==4'd14)  out=8'b00100101;
		 else if(Q==4'd15)  out=8'b10011111;
		end
		
   else if(am==4'b1101)    
    begin	   
      if     (a==1)  out=8'b10011111;      
      else if(a==2)  out=8'b00100101;      
      else if(a==3)  out=8'b00001101;      
      else if(a==4)  out=8'b10011001;      
      else if(a==5)  out=8'b01001001;     
      else if(a==6)  out=8'b11000001;     
      else if(a==7)  out=8'b00011011;      
      else if(a==8)  out=8'b00000001;      
      else if(a==9)  out=8'b00001001;      
      else if(a==0)  out=8'b00000011;    
    end
end
 
endmodule