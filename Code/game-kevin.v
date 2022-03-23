module h7(
            input             rclock,
				input      [3:0]  button,
				output reg [3:0]  guess = 1,
				output reg [6:0]  point = 10,
				output reg [3:1]  Q = 3'b100,
				output reg [7:0]  out,
				output reg [3:0]  an = 4'b1111,
				output reg [25:0] pclock=0);
	
	integer a;
   integer b;
	
	always@(posedge rclock) pclock = pclock + 1;
	
	always@(posedge pclock[24]) begin
	  if(button[0]) begin 
	    Q = {Q[2:1],Q[1]^Q[3]}; 			  //亂數
	  
	    if(Q == guess) point = point + 6; //籌碼+6
		 else point = point - 1;     		  //籌碼-1
	  end
	  
	  if     (button[1] && guess != 6) guess = guess + 1; //上數計數器
	  else if(button[1] && guess == 6) guess = 1;			
     else if(button[1] == 0) guess = guess;					

	  if(button[2]) begin //歸零
	    guess = 1;
		 point = 10;
	  end

	end
	
	always@(pclock) begin   //七段4個不同閃
		if(pclock[15] == 0) an = 4'b1110;
		if(pclock[15] == 1) an = 4'b1101;	
      if(pclock[16] == 0) an = 4'b1011;
      if(pclock[17] == 0) an = 4'b0111;				
   end
	
	always@(point) begin			// 讓point不溢位,凱文好聰明
	  if     (point < 10)                 begin a = point; b = 0; end
	  else if(point >= 10 && point <  20) begin a = point - 10; b = 1; end
	  else if(point >= 20 && point <  30) begin a = point - 20; b = 2; end
	  else if(point >= 30 && point <  40) begin a = point - 30; b = 3; end
	  else if(point >= 40 && point <  50) begin a = point - 40; b = 4; end
	  else if(point >= 50 && point <  60) begin a = point - 50; b = 5; end
	  else if(point >= 60 && point <  70) begin a = point - 60; b = 6; end
	  else if(point >= 70 && point <  80) begin a = point - 70; b = 7; end
	  else if(point >= 80 && point <  90) begin a = point - 80; b = 8; end
	  else if(point >= 90 && point < 100) begin a = point - 90; b = 9; end

	end
	
	always@(an) begin
	    if(an == 4'b1110) begin
	      if     (Q==4'd1) out=8'b10011111;
	      else if(Q==4'd2) out=8'b00100101;
	      else if(Q==4'd3) out=8'b00001101;
	      else if(Q==4'd4) out=8'b10011001;
	      else if(Q==4'd5) out=8'b01001001;
	      else if(Q==4'd6) out=8'b01000001;
	      else if(Q==4'd7) out=8'b00001101;
		 end
		 if(an == 4'b1101) begin
	      if     (guess==4'd1) out=8'b10011111;
	      else if(guess==4'd2) out=8'b00100101;
	      else if(guess==4'd3) out=8'b00001101;
	      else if(guess==4'd4) out=8'b10011001;
	      else if(guess==4'd5) out=8'b01001001;
	      else if(guess==4'd6) out=8'b01000001;
		 end
		 if(an == 4'b1011) begin
		   if     (a==4'd0) out=8'b00000011; 
	      else if(a==4'd1) out=8'b10011111; 
	      else if(a==4'd2) out=8'b00100101; 
	      else if(a==4'd3) out=8'b00001101; 
	      else if(a==4'd4) out=8'b10011001; 
	      else if(a==4'd5) out=8'b01001001; 
	      else if(a==4'd6) out=8'b01000001; 
	      else if(a==4'd7) out=8'b00011111;
			else if(a==4'd8) out=8'b00000001;
			else if(a==4'd9) out=8'b00001001;			
		 end
		 if(an == 4'b0111) begin
		   if     (b==4'd0) out=8'b00000011; 
	      else if(b==4'd1) out=8'b10011111; 
	      else if(b==4'd2) out=8'b00100101; 
	      else if(b==4'd3) out=8'b00001101; 
	      else if(b==4'd4) out=8'b10011001; 
	      else if(b==4'd5) out=8'b01001001; 
	      else if(b==4'd6) out=8'b01000001; 
	      else if(b==4'd7) out=8'b00011111;
			else if(b==4'd8) out=8'b00000001;
			else if(b==4'd9) out=8'b00001001;			
		 end

	end
endmodule






