module hgfhgf(clk,c,i,j,out,am,reset,bottom1,bottom2,bottom3,bottom4);
input clk,reset,bottom1,bottom2,bottom3,bottom4;
output reg [25:0] c;
output reg [3:0] i,j,am;
output reg [7:0] out;

always@(posedge clk)
c=c+1;
always@(posedge c[25])
begin
		if (reset)
		begin	i=0; j=0; end
		
		if (bottom1)
		begin	
			i=1;		
			if (j==i)
			j=j;
			else if (j<=i)
			j=j+1;
			else if (j>i)
			j=j-1;
		end
		if (bottom2)
		begin
			i=2;
			if (j==i)
			j=j;
			else if (j<=i)
			j=j+1;
			else if (j>i)
			j=j-1;
		end
		
		if (bottom3)
		begin 
			i=3;
			if (j==i)
			j=j;
			else if (j<=i)
			j=j+1;
			else if (j>i)
			j=j-1;
		end
		
		if (bottom4)
		begin
			i=4;
			if (i==j)
			j=j;
			else if (j<=i)
			j=j+1;
			else if (j>i)
			j=j-1;
		end	
end		
		
always@(c)
begin
if(c[14]==0) am=4'b1110;
if(c[15]==0) am=4'b1101;
if(c[16]==0) am=4'b1011;
if(c[17]==0) am=4'b0111;
end

always@(c)
begin
	if (am==4'b1110)
	begin
	  if (j==0) out=8'b00000011; 
else if (j==1) out=8'b10011111;
else if (j==2) out=8'b00100101;
else if (j==3) out=8'b00001101;
else if (j==4) out=8'b10011001;
else if (j==5) out=8'b01001001;
else if (j==6) out=8'b11000001;
else if (j==7) out=8'b00011011;
else if (j==8) out=8'b00000001;
else if (j==9) out=8'b00011001;
end

else if (am==4'b1101)
begin
out=8'b00000011;
end

else if (am==4'b1011)
begin
	  if (i==0) out=8'b00000011; 
else if (i==1) out=8'b10011111;
else if (i==2) out=8'b00100101;
else if (i==3) out=8'b00001101;
else if (i==4) out=8'b10011001;
else if (i==5) out=8'b01001001;
else if (i==6) out=8'b11000001;
else if (i==7) out=8'b00011011;
else if (i==8) out=8'b00000001;
else if (i==9) out=8'b00011001;
end

else if (am==4'b0111)
begin
out=8'b00000011;
end
end
endmodule
