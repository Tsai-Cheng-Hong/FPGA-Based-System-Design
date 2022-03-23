module fsdfds(clk, reset, a, c, am, out,sw,sw1);
    input clk;
    input reset;
	 input sw;
	 input sw1;
    output reg[3:0] a;
    output reg[24:0] c=0;
    output reg[3:0] am;
    output reg[7:0] out;
always@(posedge clk)
c=c+1;
always@(posedge c[24])
begin
	if (reset)
	begin
	a=0;
	end
	
	else if (sw1)
	begin
	if (a==0)
	a=4'd9;
	else 
	a=a-1;
	end
	else
	a=a;
end

always@(a)
begin
if 		(a==4'd0) begin out=8'b00000011; am=4'b1110; end
else if  (a==4'd1) begin out=8'b10011111; am=0; end
else if  (a==4'd2) begin out=8'b00100101; am=0; end
else if  (a==4'd3) begin out=8'b00001101; am=0; end
else if  (a==4'd4) begin out=8'b10011001; am=0; end
else if  (a==4'd5) begin out=8'b01001001; am=0; end
else if  (a==4'd6) begin out=8'b11000001; am=0; end
else if  (a==4'd7) begin out=8'b00011011; am=0; end
else if  (a==4'd8) begin out=8'b00000001; am=0; end
else if  (a==4'd9) begin out=8'b00001001; am=0; end
end
endmodule
