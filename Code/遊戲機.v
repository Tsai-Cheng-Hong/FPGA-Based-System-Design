module das(clk, am, out, reset, a, c,b,z,sw,up);
    input clk,up;
    output reg[3:0] am;
    output reg[7:0] out;
    input reset;
    output reg[3:1] a=4;
    output reg[25:0] c;
    input sw;
	output reg[4:0] b=1,z=10;

	integer i;
	integer o;
	
always@(posedge clk)
c=c+1;
always@(posedge c[24])
begin

	if(reset) 				begin
	a=4; b=1; z=10;  end
	
	if (sw) 
begin
	a={a[2:1],a[1]^a[3]};
	if (a==b)
	z=z+6;
	else if (a!=b)
	z=z-1; 
end

	  if (up && b==6)
		b=1;
else if (up && b<6)
	b=b+1;
end

always@(posedge c[24])
begin
		if (z<10)  			 begin         i=0; end
else	if (z>=10 && z<20) begin o=z-10; i=1; end
else	if (z>=20 && z<30) begin o=z-10; i=2; end
else	if (z>=30 && z<40) begin o=z-10; i=3; end
else	if (z>=40 && z<50) begin o=z-10; i=4; end
else	if (z>=50 && z<60) begin o=z-10; i=5; end
else	if (z>=60 && z<70) begin o=z-10; i=6; end
else	if (z>=70 && z<80) begin o=z-10; i=7; end
else	if (z>=80 && z<90) begin o=z-10; i=8; end
else	if (z>=90 && z<99) begin o=z-10; i=9; end	
end

always@(c)
begin
if (c[14]==0) am=4'b1110;
if (c[15]==0) am=4'b1101;
if (c[16]==0) am=4'b1011;
if (c[17]==0) am=4'b0111;
end


always@(a)
begin
if (am==4'b1110)
begin
		if (a==1) begin out=8'b10011111;  end
else	if (a==2) begin out=8'b00100101;  end
else	if (a==3) begin out=8'b00001101;  end
else	if (a==4) begin out=8'b10011001;  end
else	if (a==5) begin out=8'b01001001;  end
else	if (a==6) begin out=8'b11000001;  end
else	if (a==7) begin out=8'b00001101;  end
end

else if (am==4'b1101)
begin
		if (b==1) begin out=8'b10011111;  end
else	if (b==2) begin out=8'b00100101;  end
else	if (b==3) begin out=8'b00001101;  end
else	if (b==4) begin out=8'b10011001;  end
else	if (b==5) begin out=8'b01001001;  end
else	if (b==6) begin out=8'b11000001;  end
else	if (b==7) begin out=8'b00001101;  end
end

else if (am==4'b1011)
begin
		if (o==1) begin out=8'b10011111;  end
else	if (o==2) begin out=8'b00100101;  end
else	if (o==3) begin out=8'b00001101;  end
else	if (o==4) begin out=8'b10011001;  end
else	if (o==5) begin out=8'b01001001;  end
else	if (o==6) begin out=8'b11000001;  end
else	if (o==7) begin out=8'b00011011;  end
else	if (o==8) begin out=8'b00000001;  end
else	if (o==9) begin out=8'b00001001;  end
else	if (o==0) begin out=8'b00000011;  end
end

else if (am==4'b0111)
begin
		if (i==1) begin out=8'b10011111;  end
else	if (i==2) begin out=8'b00100101;  end
else	if (i==3) begin out=8'b00001101;  end
else	if (i==4) begin out=8'b10011001;  end
else	if (i==5) begin out=8'b01001001;  end
else	if (i==6) begin out=8'b11000001;  end
else	if (i==7) begin out=8'b00011011;  end
else	if (i==8) begin out=8'b00000001;  end
else	if (i==9) begin out=8'b00001001;  end
else	if (i==0)  begin out=8'b00000011;  end
end
end
endmodule
