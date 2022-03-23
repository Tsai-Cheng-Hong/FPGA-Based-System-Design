module bbb(clk,re,a,out,c,am);
   input clk,re ;
	output reg [3:0]a ;
	output reg [7:0]out ;
	output reg [25:0]c=0;
	output reg [3:0] am; 
   always@(posedge clk)
	c=c+1;
	always@(posedge c[23])
	begin 
	if(re)
	a=0;
	else if(a==6)
	a=0;
	else 
	a=a+1;
	end
	
	always@(c)
	begin
	if (c[15]==0) am=4'b1110;
	if (c[14]==0) am=4'b1101;
	if (c[16]==0) am=4'b1011;
	if (c[17]==0) am=4'b0111;
	end
	
	always@(a)
	begin
if (am==4'b1110)
	begin
	if(a==0)
	out=8'b 01111111;
	else if(a==1)
	out=8'b10111111;
	else if(a==2)
	out=8'b11011111;
	else if(a==3)
	out=8'b11101111;
	else if(a==4)
	out=8'b11110111;
	else if(a==5)
	out=8'b11111011;
	else if(a==6)
	out=8'b11111101;
	end
else if (am==4'b1101)
	begin
   if(a==0)
	out=8'b10111111;
	else if(a==1)
	out=8'b11011111;
	else if(a==2)
	out=8'b11110111;
	else if(a==3)
	out=8'b01111111;
	else if(a==4)
	out=8'b11101111;
	else if(a==5)
	out=8'b11111101;
	else if(a==6)
	out=8'b11111011;
	end
else if (am==4'b1011)
	begin
	if(a==0)
	out=8'b01111111;
	else if(a==1)
	out=8'b11111101;
	else if(a==2)
	out=8'b11011111;
	else if(a==3)
	out=8'b11101111;
	else if(a==4)
	out=8'b11111101;
	else if(a==5)
	out=8'b11111110;
	else if(a==6)
	out=8'b11111011;
	end
else if (am==4'b0111)
	begin
	if(a==0)
	out=8'b11110111;
	else if(a==1)
	out=8'b10111111;
	else if(a==2)
	out=8'b11111011;
	else if(a==3)
	out=8'b11111101;
	else if(a==4)
	out=8'b10111111;
	else if(a==5)
	out=8'b01111111;
	else if(a==6)
	out=8'b11011111;
	end
	end
	
	
	
	
	

endmodule