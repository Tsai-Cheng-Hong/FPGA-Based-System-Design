module dsad(clk,c,reset,led,up,a,out,am0); //by Tsai Cheng Hong.
input clk,reset,up;
output reg led=0;   //Pin:c10
output reg [25:0] c=0; 
output reg [7:0] a,out;
output reg [3:0] am0;
// This is a flash-led's program.
always@(posedge clk)
c=c+1;
always@(posedge c[22])
begin
if (reset)
a=0;
if (up)
	begin
	if (a==5)
		begin
	a=0;
	led=~led; //When a is 5,led will open or close.  
		end
	else
		begin
	a=a+1;
		end
	end
end
				// The led is twinkling.
 always@(a)
	 begin
	  if     (a==4'd0) begin out=8'b00000011; am0=4'd14; end
	  else if(a==4'd1) begin out=8'b10011111; am0=4'd14; end
	  else if(a==4'd2) begin out=8'b00100101; am0=4'd14; end
	  else if(a==4'd3) begin out=8'b00001101; am0=4'd14; end
	  else if(a==4'd4) begin out=8'b10011001; am0=4'd14; end
	  else if(a==4'd5) begin out=8'b01001001; am0=4'd14; end
	  else if(a==4'd6) begin out=8'b11000001; am0=4'd14; end
	  else if(a==4'd7) begin out=8'b00011111; am0=4'd14; end
	  else if(a==4'd8) begin out=8'b00000001; am0=4'd14; end
	  else if(a==4'd9) begin out=8'b00011001; am0=4'd14; end
	 end

endmodule
