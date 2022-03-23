module dfdf(clk,c,a,sw,am,out,reset);
input clk,sw,reset;
output reg[25:0] c;
output reg[3:1] a;
output reg[7:0] out;
output reg[3:0] am;

always@(posedge clk)
c=c+1;
always@(posedge c[25])
begin
if (reset)
a=3'b100;
else if (sw)
a={a[2:1],a[1]^a[3]};
end

always@(a)
begin
		if (a==0)begin  out=8'b00000011;am=0;end
else	if (a==1)begin  out=8'b10011111;am=0;end
else	if (a==2)begin  out=8'b00100101;am=0;end
else	if (a==3)begin  out=8'b00001101;am=0;end
else	if (a==4)begin  out=8'b10011001;am=0;end
else	if (a==5)begin  out=8'b01001001;am=0;end
else	if (a==6)begin  out=8'b11000001;am=0;end
else	if (a==7)begin  out=8'b00011011;am=0;end
end
endmodule
