module gfdgdfg(clk, reset, c, a, am, out);
    input clk;
    input reset;
    output reg[24:0] c=0;
    output reg[3:0] a;
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
else if (a==9) 
a=0;
else 
a=a+1;
end


always@(a)
begin 
if   (a==4'd0) begin out=8'b01111111;am=0;end
else if (a==4'd1) begin out=8'b10111111;am=0;end
else if (a==4'd2) begin out=8'b11011111;am=0;end
else if (a==4'd3) begin out=8'b11101111;am=0;end
else if (a==4'd4) begin out=8'b11110111;am=0;end
else if (a==4'd5) begin out=8'b11111011;am=0;end
else if (a==4'd6) begin out=8'b11111101;am=0;end
else if (a==4'd7) begin out=8'b11111011;am=0;end
else if (a==4'd8) begin out=8'b11110111; am=0; end
else if (a==4'd9) begin out=8'b11101111; am=0; end
end
endmodule