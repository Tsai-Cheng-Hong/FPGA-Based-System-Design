module dsasa(clk,reset,up1,up2,up3,up4,i,c,f,b,check,ck,out,am,re,bottom);
input clk,reset,check,up1,up2,up3,up4,re,bottom;
output reg [25:0] ck=0;
output reg [3:0] am,i,c,f,b;
output reg [7:0] out;

integer p,l,a,y;


always@(posedge clk)
ck=ck+1;
always@(posedge ck[23])
begin
		if (reset) begin i=0; c=0; f=0; b=0; end

if (up1)   begin if(i==9) i=0; else i=i+1; end
if (up2)	  begin if(c==9) c=0; else c=c+1; end
if (up3)	  begin if(f==9) f=0; else f=f+1; end
if (up4)	  begin if(b==9) b=0; else b=b+1; end
if (bottom)begin  p=i; l=c; a=f; y=b; 	i=0; c=0; f=0; b=0;	 end 


if (check) begin if (i==p && c==l && f==a && b==y) begin i=10;c=10;f=10;b=10;end
else begin i=11; c=11; f=11; b=11; end end
end


always@(ck)
begin
if (ck[14]==0) am=4'b1110;
if (ck[15]==0) am=4'b1101;
if (ck[16]==0) am=4'b1011;
if (ck[17]==0) am=4'b0111;
end

always@(ck[23])
begin
if (am==4'b1110)
begin
		if (i==1) begin out=8'b10011111;  end
else	if (i==2) begin out=8'b00100101;  end
else	if (i==3) begin out=8'b00001101;  end
else	if (i==4) begin out=8'b10011001;  end
else	if (i==5) begin out=8'b01001001;  end
else	if (i==6) begin out=8'b11000001;  end
else	if (i==7) begin out=8'b00001101;  end
else	if (i==8) begin out=8'b00000001;  end
else	if (i==9) begin out=8'b00001001;  end
else	if (i==0) begin out=8'b00000011;  end
else	if (i==10) begin out=8'b01001001;  end
else	if (i==11) begin out=8'b11100011;  end
end

else if (am==4'b1101)
begin
		if (c==1) begin out=8'b10011111;  end
else	if (c==2) begin out=8'b00100101;  end
else	if (c==3) begin out=8'b00001101;  end
else	if (c==4) begin out=8'b10011001;  end
else	if (c==5) begin out=8'b01001001;  end
else	if (c==6) begin out=8'b11000001;  end
else	if (c==7) begin out=8'b00001101;  end
else	if (c==8) begin out=8'b00000001;  end
else	if (c==9) begin out=8'b00001001;  end
else	if (c==0) begin out=8'b00000011;  end
else	if (c==10) begin out=8'b01001001;  end
else	if (c==11) begin out=8'b10011111;  end
end

else if (am==4'b1011)
begin
		if (f==1) begin out=8'b10011111;  end
else	if (f==2) begin out=8'b00100101;  end
else	if (f==3) begin out=8'b00001101;  end
else	if (f==4) begin out=8'b10011001;  end
else	if (f==5) begin out=8'b01001001;  end
else	if (f==6) begin out=8'b11000001;  end
else	if (f==7) begin out=8'b00011011;  end
else	if (f==8) begin out=8'b00000001;  end
else	if (f==9) begin out=8'b00001001;  end
else	if (f==0) begin out=8'b00000011;  end
else	if (f==10) begin out=8'b00010001;  end
else	if (f==11) begin out=8'b00010001;  end
end

else if (am==4'b0111)
begin
		if (b==1) begin out=8'b10011111;  end
else	if (b==2) begin out=8'b00100101;  end
else	if (b==3) begin out=8'b00001101;  end
else	if (b==4) begin out=8'b10011001;  end
else	if (b==5) begin out=8'b01001001;  end
else	if (b==6) begin out=8'b11000001;  end
else	if (b==7) begin out=8'b00011011;  end
else	if (b==8) begin out=8'b00000001;  end
else	if (b==9) begin out=8'b00001001;  end
else	if (b==0)  begin out=8'b00000011;  end
else	if (b==10) begin out=8'b00110001;  end
else	if (b==11) begin out=8'b01110001;  end
end
end

endmodule
