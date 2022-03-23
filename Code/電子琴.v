module hfghgf(clk,reset,up,down,clk_o,s,cnt,up_d,down_d,clk_d,Q1,Q2,vio,vic,vco);
input clk,reset,up,down,up_d,down_d,vic,vio,vco;
output clk_o,Q1,Q2,clk_d;
output reg[2:0]s;
output reg[14:0]cnt;
reg clk_d,clk_o;
reg [15:0]Q1;
reg [14:0]Q2;

always@(posedge clk or posedge reset)
begin
	if (reset)
	Q1=0;
	else begin
		Q1=Q1+1;
		clk_d=Q1[15]; //~156H
// 	clk_d=Q1[1]; //
end	end
/*
debounce d1(clk_d, up , up_d);
debounce d2(clk_d, down,down_d);
*/
always@(posedge clk_d or posedge reset)
begin
	if (reset)
	s=0;
	else if (up)
	s=1;
	else if (up_d)
	s=2;
	else if (down)
	s=3;
	else if (down_d)
	s=4;
	else if (vic)
	s=5;
	else if (vio)
	s=6;
	else if (vco)
	s=7;
	else s=0;
end
always@(s)
case(s)
0 			:cnt=0;
1 			:cnt=19120; //do
2			:cnt=17036; //re
3 			:cnt=15175; //me
4 			:cnt=14327; //fa
5 			:cnt=12755; //so
6 			:cnt=11364; //la
7			:cnt=10121; //si
default	:cnt=0;
endcase

always@(posedge clk)
if (reset||Q2==cnt)
	Q2=0;
else
Q2=Q2+1;

always@(s)
if (s<=1)
clk_o=Q2[14];
else
clk_o=Q2[13];

endmodule
