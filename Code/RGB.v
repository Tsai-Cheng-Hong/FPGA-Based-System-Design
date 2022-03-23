module jhgj(clk, reset, g, c, am,out,led,r,y);
    input clk;
    input reset;
    output reg[4:0] g;
    output reg[4:0] r;
    output reg[4:0] y;
    output reg[25:0] c;
    output reg[3:0] am;
	 output reg[7:0] out;
	 output reg[7:0] led;
	 
always@(posedge clk)
c=c+1;
always@(posedge c[25])
begin
	if (reset || r==0)
	begin
	g=5; 
	end
	else if (g==0)
	g=19;
   else
	g=g-1;
end
always@(posedge c[25])
begin
	if (reset || r==0)
	y=8;
	else if (y==0)
	y=19;
	else
	y=y-1;
end
always@(posedge c[25])
begin
	if (reset)
	r=14;
	else if (r==0)
	r=14;
	else
	r=r-1;
end



always@(c)
begin
if (c[14]==0) am=4'b1110;
if (c[15]==0) am=4'b1101;
if (c[16]==0) am=4'b1011;
end

always@(g)
begin
	if (am==4'b1110)
		begin
		if (g==0)  begin out=8'b00000011; led=8'b00000001; end
 else if (g==1)  begin out=8'b10011111; led=8'b00000001; end
 else if (g==2)  begin out=8'b00100101; led=8'b00000001; end
 else if (g==3)  begin out=8'b00001101; led=8'b00000001; end
 else if (g==4)  begin out=8'b10011001; led=8'b00000001; end
 else if (g==5)  begin out=8'b01001001; led=8'b00000001; end
 else if (g==6)  begin out=8'b11111111; led=8'b00000000; end
 else if (g==7)  begin out=8'b11111111; led=8'b00000000; end
 else if (g==8)  begin out=8'b11111111; led=8'b00000000; end
 else if (g==9)  begin out=8'b11111111; led=8'b00000000; end
 else if (g==10) begin out=8'b11111111; led=8'b00000000; end
 else if (g==11) begin out=8'b11111111; led=8'b00000000; end
 else if (g==12) begin out=8'b11111111; led=8'b00000000; end
 else if (g==13) begin out=8'b11111111; led=8'b00000000; end
 else if (g==14) begin out=8'b11111111; led=8'b00000000; end
 else if (g==15) begin out=8'b11111111; led=8'b00000000; end
 else if (g==16) begin out=8'b11111111; led=8'b00000000; end
 else if (g==17) begin out=8'b11111111; led=8'b00000000; end
 else if (g==18) begin out=8'b11111111; led=8'b00000000; end
 else if (g==19) begin out=8'b11111111; led=8'b00000000; end
		end	 
else if (am==4'b1101)	 
	begin
		if (y==0) begin out=8'b00000011; led=8'b00000010; end
 else if (y==1) begin out=8'b10011111; led=8'b00000010; end
 else if (y==2) begin out=8'b00100101; led=8'b00000010; end
 else if (y==3) begin out=8'b11111111; led=8'b00000000; end
 else if (y==4) begin out=8'b11111111; led=8'b00000000; end
 else if (y==5) begin out=8'b11111111; led=8'b00000000; end
 else if (y==6) begin out=8'b11111111; led=8'b00000000; end
 else if (y==7) begin out=8'b11111111; led=8'b00000000; end
 else if (y==8) begin out=8'b11111111; led=8'b00000000; end
 else if (y==9)  begin out=8'b11111111; led=8'b00000000; end
 else if (y==10) begin out=8'b11111111; led=8'b00000000; end
 else if (y==11) begin out=8'b11111111; led=8'b00000000; end
 else if (y==12) begin out=8'b11111111; led=8'b00000000; end
 else if (y==13) begin out=8'b11111111; led=8'b00000000; end
 else if (y==14) begin out=8'b11111111; led=8'b00000000; end
 else if (y==15) begin out=8'b11111111; led=8'b00000000; end
 else if (y==16) begin out=8'b11111111; led=8'b00000000; end
 else if (y==17) begin out=8'b11111111; led=8'b00000000; end
 else if (y==18) begin out=8'b11111111; led=8'b00000000; end
 else if (y==19) begin out=8'b11111111; led=8'b00000000; end
	end
else if (am==4'b1011)
	begin
		if (r==0)  begin out=8'b00000011; led=8'b00000100; end
 else if (r==1)  begin out=8'b10011111; led=8'b00000100; end
 else if (r==2)  begin out=8'b00100101; led=8'b00000100; end
 else if (r==3)  begin out=8'b00001101; led=8'b00000100; end
 else if (r==4)  begin out=8'b10011001; led=8'b00000100; end
 else if (r==5)  begin out=8'b01001001; led=8'b00000100; end
 else if (r==6)  begin out=8'b11111111; led=8'b00000000; end
 else if (r==7)  begin out=8'b11111111; led=8'b00000000; end
 else if (r==8)  begin out=8'b11111111; led=8'b00000000; end
 else if (r==9)  begin out=8'b11111111; led=8'b00000000; end
 else if (r==10) begin out=8'b11111111; led=8'b00000000; end
 else if (r==11) begin out=8'b11111111; led=8'b00000000; end
 else if (r==12) begin out=8'b11111111; led=8'b00000000; end
 else if (r==13) begin out=8'b11111111; led=8'b00000000; end
 else if (r==14) begin out=8'b11111111; led=8'b00000000; end
 
		end
end
endmodule
