module gfg(clk,reset,right,stop,left,dot,am,c,a,out,z,x,b,v,up);
input clk,reset,right,left,stop,up;
output reg [25:0] c;
output reg [3:0] am,a=1,z,x,b,v;
output reg dot;
output reg [6:0] out;

always@(posedge clk)
c=c+1;
always@(posedge c[25])
begin
	if (reset)
	a=0;
	if (stop)
	begin
		   if (left)
		begin if (a==4) a=4'd1; else a=a+1; end
	else  if (right)
		begin if (a==1 || a==0) a=4'd4; else a=a-1; end

	
	if (up) begin if (a==1) begin if (z==9) z=0; else z=z+1; end else z=z; end
	if (up) begin if (a==2) begin if (x==9) x=0; else x=x+1; end else x=x; end
	if (up) begin if (a==3) begin if (v==9) v=0; else v=v+1; end else v=v; end	
	if (up) begin if (a==4) begin if (b==9) b=0; else b=b+1; end else b=b; end
	end
	else 
	begin
	a=0;
	end
end
	
	always@(c)
	begin
	if (c[15]==0) am=4'b1110;
	if (c[16]==0) am=4'b1101;
	if (c[17]==0) am=4'b1011;
	if (c[14]==0) am=4'b0111;
	end
	
	
always@(a)
begin
if (am==4'b1110)
begin
		if (a==0) dot=1;
else 	if (a==1) dot=0;
else 	if (a==2) dot=1;
else 	if (a==3) dot=1;
else 	if (a==4) dot=1;

	  if(z==1)  begin out=7'b1001111; end
else if(z==2)  begin out=7'b0010010; end
else if(z==3)  begin out=7'b0000110; end
else if(z==4)  begin out=7'b1001100; end
else if(z==5)  begin out=7'b0100100; end
else if(z==6)  begin out=7'b1100000; end
else if(z==7)  begin out=7'b0001101; end
else if(z==8)  begin out=7'b0000000; end
else if(z==9)  begin out=7'b0000100; end
else if(z==0)  begin out=7'b0000001; end

end

else if (am==4'b1101)
begin
		if (a==0) dot=1;
else 	if (a==1) dot=1;
else 	if (a==2) dot=0;
else 	if (a==3) dot=1;
else 	if (a==4) dot=1;

	  if(x==1)  begin out=7'b1001111; end
else if(x==2)  begin out=7'b0010010; end
else if(x==3)  begin out=7'b0000110; end
else if(x==4)  begin out=7'b1001100; end
else if(x==5)  begin out=7'b0100100; end
else if(x==6)  begin out=7'b1100000; end
else if(x==7)  begin out=7'b0001101; end
else if(x==8)  begin out=7'b0000000; end
else if(x==9)  begin out=7'b0000100; end
else if(x==0)  begin out=7'b0000001; end

end

else if (am==4'b1011)
begin
		if (a==0) dot=1;
else 	if (a==1) dot=1;
else 	if (a==2) dot=1;
else 	if (a==3) dot=0;
else 	if (a==4) dot=1;

	  if(v==1)  begin out=7'b1001111; end
else if(v==2)  begin out=7'b0010010; end
else if(v==3)  begin out=7'b0000110; end
else if(v==4)  begin out=7'b1001100; end
else if(v==5)  begin out=7'b0100100; end
else if(v==6)  begin out=7'b1100000; end
else if(v==7)  begin out=7'b0001101; end
else if(v==8)  begin out=7'b0000000; end
else if(v==9)  begin out=7'b0000100; end
else if(v==0)  begin out=7'b0000001; end

end

else if (am==4'b0111)
begin
		if (a==0) dot=1;
else 	if (a==1) dot=1;
else 	if (a==2) dot=1;
else 	if (a==3) dot=1;
else 	if (a==4) dot=0;

	  if(b==1)  begin out=7'b1001111; end
else if(b==2)  begin out=7'b0010010; end
else if(b==3)  begin out=7'b0000110; end
else if(b==4)  begin out=7'b1001100; end
else if(b==5)  begin out=7'b0100100; end
else if(b==6)  begin out=7'b1100000; end
else if(b==7)  begin out=7'b0001101; end
else if(b==8)  begin out=7'b0000000; end
else if(b==9)  begin out=7'b0000100; end
else if(b==0)  begin out=7'b0000001; end

end
end

endmodule
