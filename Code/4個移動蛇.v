module dsadsa(clk,reset,am,a,c,out);
input clk,reset;
output reg [3:0] am,a;
output reg [25:0] c=0;
output reg [7:0] out;

always@(posedge clk)
c=c+1;
always@(posedge c[23])
begin
if (reset)
a=0;
else if (a==4'd8)
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
if 		(a==4'd0) begin out=8'b00011111; end
else if  (a==4'd1) begin out=8'b10001111; end
else if  (a==4'd2) begin out=8'b11000111; end
else if  (a==4'd3) begin out=8'b11100011; end
else if  (a==4'd4) begin out=8'b11010101; end
else if  (a==4'd5) begin out=8'b11001101; end
else if  (a==4'd6) begin out=8'b11000111; end
else if  (a==4'd7) begin out=8'b11100011; end
else if  (a==4'd8) begin out=8'b01110011; end
end
else if (am==4'b1101)
begin
if 		(a==4'd0) begin out=8'b10001111; end
else if  (a==4'd1) begin out=8'b00011111; end
else if  (a==4'd2) begin out=8'b00111011; end
else if  (a==4'd3) begin out=8'b01111001; end
else if  (a==4'd4) begin out=8'b11011001; end
else if  (a==4'd5) begin out=8'b11001101; end
else if  (a==4'd6) begin out=8'b11000111; end
else if  (a==4'd7) begin out=8'b11100011; end
else if  (a==4'd8) begin out=8'b01110011; end
end
else if (am==4'b1011)
begin
if 		(a==4'd0) begin out=8'b10001111; end
else if  (a==4'd1) begin out=8'b11000111; end
else if  (a==4'd2) begin out=8'b11100011; end
else if  (a==4'd3) begin out=8'b01110011; end
else if  (a==4'd4) begin out=8'b00111011; end
else if  (a==4'd5) begin out=8'b00111101; end
else if  (a==4'd6) begin out=8'b10110101; end
else if  (a==4'd7) begin out=8'b11100101; end
else if  (a==4'd8) begin out=8'b11000111; end
end
else if (am==4'b0111)
begin
if 		(a==4'd0) begin out=8'b01110011;  end
else if  (a==4'd1) begin out=8'b11100011;  end
else if  (a==4'd2) begin out=8'b11000111;  end
else if  (a==4'd3) begin out=8'b11001101;  end
else if  (a==4'd4) begin out=8'b11010101;  end
else if  (a==4'd5) begin out=8'b11100101;  end
else if  (a==4'd6) begin out=8'b11000111;  end
else if  (a==4'd7) begin out=8'b10001111;  end
else if  (a==4'd8) begin out=8'b00011111;  end
end
end
endmodule