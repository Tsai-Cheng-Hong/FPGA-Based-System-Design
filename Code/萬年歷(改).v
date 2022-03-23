module gfdg(clk,c,reset,q,w,e,a,s,d,out,am,up1,up2,time1,time2,time3);
input clk,reset,up1,up2,time1,time2,time3;
output reg [7:0] out;
output reg [25:0] c=0;
output reg [7:0] q,w,e,a,s,d; 
output reg [3:0] am;

always@(posedge clk)
c=c+1;
always@(posedge c[21])
begin
		if (reset)
		begin q=0; w=0; end
		
		if (time1)
		begin
		if (up1) //sec
 		begin if (q>59) begin q=0; w=w+1; end else q=q+1; end
		else if (up2) //min
		begin if (w>59) begin w=0; e=e+1; end else w=w+1; end

		end
		
		if (time2)
		begin
		if (up1) //hour
		begin if (e>23) begin e=0; a=a+1; end else e=e+1; end
		else	if (up2) //day
		begin if (a>30) begin a=0; s=s+1; end else a=a+1; end
		end
		
		if (time3)
		begin
		if (up1) //month
		begin if (s>12) begin s=0; d=d+1; end else s=s+1; end
		if (up2) //year
		begin if (d>99) begin d=0; end        else d=d+1; end
		end

		if (q>59)
		begin	q=0; w=w+1; end
		if (w>59)
		begin w=0; e=e+1; end
		if (e>23)
		begin e=0; a=a+1; end
		if (a>30)
		begin a=0; s=s+1; end
		if (s>12)
		begin s=0; d=d+1; end
		if (d>99)
		begin d=0; end 
		else
		q=q+1;
end

always@(c)
begin
if(c[15]==0) am=4'b1110;
if(c[16]==0) am=4'b1101;
if(c[17]==0) am=4'b1011;
if(c[18]==0) am=4'b0111;
end

always@(q)
begin
	if (am==4'b1110 && time1)
	begin
		if (q==0)  out=8'b00000011;
else	if (q==1)  out=8'b10011111; 
else	if (q==2)  out=8'b00100101; 
else	if (q==3)  out=8'b00001101; 
else	if (q==4)  out=8'b10011001; 
else	if (q==5)  out=8'b01001001; 
else	if (q==6)  out=8'b11000001; 
else	if (q==7)  out=8'b00011011; 
else	if (q==8)  out=8'b00000001; 
else	if (q==9)  out=8'b00001001; 

else	if (q==10)  out=8'b00000011;
else	if (q==11)  out=8'b10011111; 
else	if (q==12)  out=8'b00100101; 
else	if (q==13)  out=8'b00001101; 
else	if (q==14)  out=8'b10011001; 
else	if (q==15)  out=8'b01001001; 
else	if (q==16)  out=8'b11000001; 
else	if (q==17)  out=8'b00011011; 
else	if (q==18)  out=8'b00000001; 
else	if (q==19)  out=8'b00001001; 

else	if (q==20)  out=8'b00000011;
else	if (q==21)  out=8'b10011111; 
else	if (q==22)  out=8'b00100101; 
else	if (q==23)  out=8'b00001101; 
else	if (q==24)  out=8'b10011001; 
else	if (q==25)  out=8'b01001001; 
else	if (q==26)  out=8'b11000001; 
else	if (q==27)  out=8'b00011011; 
else	if (q==28)  out=8'b00000001; 
else	if (q==29)  out=8'b00001001; 

else	if (q==30)  out=8'b00000011;
else	if (q==31)  out=8'b10011111; 
else	if (q==32)  out=8'b00100101; 
else	if (q==33)  out=8'b00001101; 
else	if (q==34)  out=8'b10011001; 
else	if (q==35)  out=8'b01001001; 
else	if (q==36)  out=8'b11000001; 
else	if (q==37)  out=8'b00011011; 
else	if (q==38)  out=8'b00000001; 
else	if (q==39)  out=8'b00001001; 

else	if (q==40)  out=8'b00000011;
else	if (q==41)  out=8'b10011111; 
else	if (q==42)  out=8'b00100101; 
else	if (q==43)  out=8'b00001101; 
else	if (q==44)  out=8'b10011001; 
else	if (q==45)  out=8'b01001001; 
else	if (q==46)  out=8'b11000001; 
else	if (q==47)  out=8'b00011011; 
else	if (q==48)  out=8'b00000001; 
else	if (q==49)  out=8'b00001001; 

else	if (q==50)  out=8'b00000011;
else	if (q==51)  out=8'b10011111; 
else	if (q==52)  out=8'b00100101; 
else	if (q==53)  out=8'b00001101; 
else	if (q==54)  out=8'b10011001; 
else	if (q==55)  out=8'b01001001; 
else	if (q==56)  out=8'b11000001; 
else	if (q==57)  out=8'b00011011; 
else	if (q==58)  out=8'b00000001; 
else	if (q==59)  out=8'b00001001; 
else	if (q==60)  out=8'b00000011;
end

else if  (am==4'b1101 && time1)
begin
		if (q==0)  out=8'b00000011;
else	if (q==1)  out=8'b00000011;
else	if (q==2)  out=8'b00000011;
else	if (q==3)  out=8'b00000011;
else	if (q==4)  out=8'b00000011;
else	if (q==5)  out=8'b00000011;
else	if (q==6)  out=8'b00000011;
else	if (q==7)  out=8'b00000011;
else	if (q==8)  out=8'b00000011;
else	if (q==9)  out=8'b00000011;

else	if (q==10)  out=8'b10011111; 
else	if (q==11)  out=8'b10011111; 
else	if (q==12)  out=8'b10011111; 
else	if (q==13)  out=8'b10011111; 
else	if (q==14)  out=8'b10011111; 
else	if (q==15)  out=8'b10011111; 
else	if (q==16)  out=8'b10011111; 
else	if (q==17)  out=8'b10011111; 
else	if (q==18)  out=8'b10011111; 
else	if (q==19)  out=8'b10011111; 

else	if (q==20)  out=8'b00100101;
else	if (q==21)  out=8'b00100101;
else	if (q==22)  out=8'b00100101;
else	if (q==23)  out=8'b00100101;
else	if (q==24)  out=8'b00100101;
else	if (q==25)  out=8'b00100101;
else	if (q==26)  out=8'b00100101;
else	if (q==27)  out=8'b00100101;
else	if (q==28)  out=8'b00100101;
else	if (q==29)  out=8'b00100101; 

else	if (q==30)  out=8'b00001101;
else	if (q==31)  out=8'b00001101; 
else	if (q==32)  out=8'b00001101; 
else	if (q==33)  out=8'b00001101; 
else	if (q==34)  out=8'b00001101; 
else	if (q==35)  out=8'b00001101; 
else	if (q==36)  out=8'b00001101; 
else	if (q==37)  out=8'b00001101; 
else	if (q==38)  out=8'b00001101; 
else	if (q==39)  out=8'b00001101;
  
else	if (q==40)  out=8'b10011001; 
else	if (q==41)  out=8'b10011001; 
else	if (q==42)  out=8'b10011001;
else	if (q==43)  out=8'b10011001; 
else	if (q==44)  out=8'b10011001; 
else	if (q==45)  out=8'b10011001; 
else	if (q==46)  out=8'b10011001; 
else	if (q==47)  out=8'b10011001; 
else	if (q==48)  out=8'b10011001; 
else	if (q==49)  out=8'b10011001;

else	if (q==50)  out=8'b01001001; 
else	if (q==51)  out=8'b01001001; 
else	if (q==52)  out=8'b01001001; 
else	if (q==53)  out=8'b01001001; 
else	if (q==54)  out=8'b01001001; 
else	if (q==55)  out=8'b01001001; 
else	if (q==56)  out=8'b01001001; 
else	if (q==57)  out=8'b01001001; 
else	if (q==58)  out=8'b01001001; 
else	if (q==59)  out=8'b01001001;   
end
else	if (am==4'b1011 && time1)
	begin
		if (w==0)  out=8'b00000011;
else	if (w==1)  out=8'b10011111; 
else	if (w==2)  out=8'b00100101; 
else	if (w==3)  out=8'b00001101; 
else	if (w==4)  out=8'b10011001; 
else	if (w==5)  out=8'b01001001; 
else	if (w==6)  out=8'b11000001; 
else	if (w==7)  out=8'b00011011; 
else	if (w==8)  out=8'b00000001; 
else	if (w==9)  out=8'b00001001; 

else	if (w==10)  out=8'b00000011;
else	if (w==11)  out=8'b10011111; 
else	if (w==12)  out=8'b00100101; 
else	if (w==13)  out=8'b00001101; 
else	if (w==14)  out=8'b10011001; 
else	if (w==15)  out=8'b01001001; 
else	if (w==16)  out=8'b11000001; 
else	if (w==17)  out=8'b00011011; 
else	if (w==18)  out=8'b00000001; 
else	if (w==19)  out=8'b00001001; 

else	if (w==20)  out=8'b00000011;
else	if (w==21)  out=8'b10011111; 
else	if (w==22)  out=8'b00100101; 
else	if (w==23)  out=8'b00001101; 
else	if (w==24)  out=8'b10011001; 
else	if (w==25)  out=8'b01001001; 
else	if (w==26)  out=8'b11000001; 
else	if (w==27)  out=8'b00011011; 
else	if (w==28)  out=8'b00000001; 
else	if (w==29)  out=8'b00001001; 

else	if (w==30)  out=8'b00000011;
else	if (w==31)  out=8'b10011111; 
else	if (w==32)  out=8'b00100101; 
else	if (w==33)  out=8'b00001101; 
else	if (w==34)  out=8'b10011001; 
else	if (w==35)  out=8'b01001001; 
else	if (w==36)  out=8'b11000001; 
else	if (w==37)  out=8'b00011011; 
else	if (w==38)  out=8'b00000001; 
else	if (w==39)  out=8'b00001001; 

else	if (w==40)  out=8'b00000011;
else	if (w==41)  out=8'b10011111; 
else	if (w==42)  out=8'b00100101; 
else	if (w==43)  out=8'b00001101; 
else	if (w==44)  out=8'b10011001; 
else	if (w==45)  out=8'b01001001; 
else	if (w==46)  out=8'b11000001; 
else	if (w==47)  out=8'b00011011; 
else	if (w==48)  out=8'b00000001; 
else	if (w==49)  out=8'b00001001; 

else	if (w==50)  out=8'b00000011;
else	if (w==51)  out=8'b10011111; 
else	if (w==52)  out=8'b00100101; 
else	if (w==53)  out=8'b00001101; 
else	if (w==54)  out=8'b10011001; 
else	if (w==55)  out=8'b01001001; 
else	if (w==56)  out=8'b11000001; 
else	if (w==57)  out=8'b00011011; 
else	if (w==58)  out=8'b00000001; 
else	if (w==59)  out=8'b00001001; 
else	if (w==60)  out=8'b00000011;
end
else if  (am==4'b0111  && time1)
begin
		if (w==0)  out=8'b00000011;
else	if (w==1)  out=8'b00000011;
else	if (w==2)  out=8'b00000011;
else	if (w==3)  out=8'b00000011;
else	if (w==4)  out=8'b00000011;
else	if (w==5)  out=8'b00000011;
else	if (w==6)  out=8'b00000011;
else	if (w==7)  out=8'b00000011;
else	if (w==8)  out=8'b00000011;
else	if (w==9)  out=8'b00000011;

else	if (w==10)  out=8'b10011111; 
else	if (w==11)  out=8'b10011111; 
else	if (w==12)  out=8'b10011111; 
else	if (w==13)  out=8'b10011111; 
else	if (w==14)  out=8'b10011111; 
else	if (w==15)  out=8'b10011111; 
else	if (w==16)  out=8'b10011111; 
else	if (w==17)  out=8'b10011111; 
else	if (w==18)  out=8'b10011111; 
else	if (w==19)  out=8'b10011111; 

else	if (w==20)  out=8'b00100101;
else	if (w==21)  out=8'b00100101;
else	if (w==22)  out=8'b00100101;
else	if (w==23)  out=8'b00100101;
else	if (w==24)  out=8'b00100101;
else	if (w==25)  out=8'b00100101;
else	if (w==26)  out=8'b00100101;
else	if (w==27)  out=8'b00100101;
else	if (w==28)  out=8'b00100101;
else	if (w==29)  out=8'b00100101; 

else	if (w==30)  out=8'b00001101;
else	if (w==31)  out=8'b00001101; 
else	if (w==32)  out=8'b00001101; 
else	if (w==33)  out=8'b00001101; 
else	if (w==34)  out=8'b00001101; 
else	if (w==35)  out=8'b00001101; 
else	if (w==36)  out=8'b00001101; 
else	if (w==37)  out=8'b00001101; 
else	if (w==38)  out=8'b00001101; 
else	if (w==39)  out=8'b00001101;
  
else	if (w==40)  out=8'b10011001; 
else	if (w==41)  out=8'b10011001; 
else	if (w==42)  out=8'b10011001;
else	if (w==43)  out=8'b10011001; 
else	if (w==44)  out=8'b10011001; 
else	if (w==45)  out=8'b10011001; 
else	if (w==46)  out=8'b10011001; 
else	if (w==47)  out=8'b10011001; 
else	if (w==48)  out=8'b10011001; 
else	if (w==49)  out=8'b10011001;

else	if (w==50)  out=8'b01001001; 
else	if (w==51)  out=8'b01001001; 
else	if (w==52)  out=8'b01001001; 
else	if (w==53)  out=8'b01001001; 
else	if (w==54)  out=8'b01001001; 
else	if (w==55)  out=8'b01001001; 
else	if (w==56)  out=8'b01001001; 
else	if (w==57)  out=8'b01001001; 
else	if (w==58)  out=8'b01001001; 
else	if (w==59)  out=8'b01001001;   
end
else if (am==4'b1110 && time2)
begin
		if (e==0)  out=8'b00000011;
else	if (e==1)  out=8'b10011111; 
else	if (e==2)  out=8'b00100101; 
else	if (e==3)  out=8'b00001101; 
else	if (e==4)  out=8'b10011001; 
else	if (e==5)  out=8'b01001001; 
else	if (e==6)  out=8'b11000001; 
else	if (e==7)  out=8'b00011011; 
else	if (e==8)  out=8'b00000001; 
else	if (e==9)  out=8'b00001001; 
else	if (e==10)  out=8'b00000011;
else	if (e==11)  out=8'b10011111; 
else	if (e==12)  out=8'b00100101; 
else	if (e==13)  out=8'b00001101; 
else	if (e==14)  out=8'b10011001; 
else	if (e==15)  out=8'b01001001; 
else	if (e==16)  out=8'b11000001; 
else	if (e==17)  out=8'b00011011; 
else	if (e==18)  out=8'b00000001; 
else	if (e==19)  out=8'b00001001; 
else	if (e==20)  out=8'b00000011;
else	if (e==21)  out=8'b10011111; 
else	if (e==22)  out=8'b00100101; 
else	if (e==23)  out=8'b00001101; 
else	if (e==24)  out=8'b10011001; 
end

else if (am==4'b1101 && time2)
begin
		if (e==0)  out=8'b00000011;
else	if (e==1)  out=8'b00000011;
else	if (e==2)  out=8'b00000011;
else	if (e==3)  out=8'b00000011;
else	if (e==4)  out=8'b00000011;
else	if (e==5)  out=8'b00000011;
else	if (e==6)  out=8'b00000011;
else	if (e==7)  out=8'b00000011;
else	if (e==8)  out=8'b00000011;
else	if (e==9)  out=8'b00000011;

else	if (e==10)  out=8'b10011111; 
else	if (e==11)  out=8'b10011111; 
else	if (e==12)  out=8'b10011111; 
else	if (e==13)  out=8'b10011111; 
else	if (e==14)  out=8'b10011111; 
else	if (e==15)  out=8'b10011111; 
else	if (e==16)  out=8'b10011111; 
else	if (e==17)  out=8'b10011111; 
else	if (e==18)  out=8'b10011111; 
else	if (e==19)  out=8'b10011111; 

else	if (e==20)  out=8'b00100101;
else	if (e==21)  out=8'b00100101;
else	if (e==22)  out=8'b00100101;
else	if (e==23)  out=8'b00100101;
else	if (e==24)  out=8'b00100101;
end

else	if (am==4'b1011 && time2)
	begin
		if (a==0)  out=8'b00000011;
else	if (a==1)  out=8'b10011111; 
else	if (a==2)  out=8'b00100101; 
else	if (a==3)  out=8'b00001101; 
else	if (a==4)  out=8'b10011001; 
else	if (a==5)  out=8'b01001001; 
else	if (a==6)  out=8'b11000001; 
else	if (a==7)  out=8'b00011011; 
else	if (a==8)  out=8'b00000001; 
else	if (a==9)  out=8'b00001001; 
else	if (a==10)  out=8'b00000011;
else	if (a==11)  out=8'b10011111; 
else	if (a==12)  out=8'b00100101; 
else	if (a==13)  out=8'b00001101; 
else	if (a==14)  out=8'b10011001; 
else	if (a==15)  out=8'b01001001; 
else	if (a==16)  out=8'b11000001; 
else	if (a==17)  out=8'b00011011; 
else	if (a==18)  out=8'b00000001; 
else	if (a==19)  out=8'b00001001; 
else	if (a==20)  out=8'b00000011;
else	if (a==21)  out=8'b10011111; 
else	if (a==22)  out=8'b00100101; 
else	if (a==23)  out=8'b00001101; 
else	if (a==24)  out=8'b10011001; 
else	if (a==25)  out=8'b01001001; 
else	if (a==26)  out=8'b11000001; 
else	if (a==27)  out=8'b00011011; 
else	if (a==28)  out=8'b00000001; 
else	if (a==29)  out=8'b00001001; 
else	if (a==30)  out=8'b00000011;
else	if (a==31)  out=8'b10011111; 
end

else if  (am==4'b0111 && time2)
begin
		if (a==0)  out=8'b00000011;
else	if (a==1)  out=8'b00000011;
else	if (a==2)  out=8'b00000011;
else	if (a==3)  out=8'b00000011;
else	if (a==4)  out=8'b00000011;
else	if (a==5)  out=8'b00000011;
else	if (a==6)  out=8'b00000011;
else	if (a==7)  out=8'b00000011;
else	if (a==8)  out=8'b00000011;
else	if (a==9)  out=8'b00000011;
else	if (a==10)  out=8'b10011111; 
else	if (a==11)  out=8'b10011111; 
else	if (a==12)  out=8'b10011111; 
else	if (a==13)  out=8'b10011111; 
else	if (a==14)  out=8'b10011111; 
else	if (a==15)  out=8'b10011111; 
else	if (a==16)  out=8'b10011111; 
else	if (a==17)  out=8'b10011111; 
else	if (a==18)  out=8'b10011111; 
else	if (a==19)  out=8'b10011111; 
else	if (a==20)  out=8'b00100101;
else	if (a==21)  out=8'b00100101;
else	if (a==22)  out=8'b00100101;
else	if (a==23)  out=8'b00100101;
else	if (a==24)  out=8'b00100101;
else	if (a==25)  out=8'b00100101;
else	if (a==26)  out=8'b00100101;
else	if (a==27)  out=8'b00100101;
else	if (a==28)  out=8'b00100101;
else	if (a==29)  out=8'b00100101; 
else	if (a==30)  out=8'b00001101;
else	if (a==31)  out=8'b00001101; 
end

else if (am==4'b1110 && time3)
begin
		if (s==0)  out=8'b00000011;
else	if (s==1)  out=8'b10011111; 
else	if (s==2)  out=8'b00100101; 
else	if (s==3)  out=8'b00001101; 
else	if (s==4)  out=8'b10011001; 
else	if (s==5)  out=8'b01001001; 
else	if (s==6)  out=8'b11000001; 
else	if (s==7)  out=8'b00011011; 
else	if (s==8)  out=8'b00000001; 
else	if (s==9)  out=8'b00001001; 
else	if (s==10)  out=8'b00000011;
else	if (s==11)  out=8'b10011111; 
else	if (s==12)  out=8'b00100101; 
end

else if (am==4'b1101 && time3)
begin
		if (s==0)  out=8'b00000011;
else	if (s==1)  out=8'b00000011;
else	if (s==2)  out=8'b00000011;
else	if (s==3)  out=8'b00000011;
else	if (s==4)  out=8'b00000011;
else	if (s==5)  out=8'b00000011;
else	if (s==6)  out=8'b00000011;
else	if (s==7)  out=8'b00000011;
else	if (s==8)  out=8'b00000011;
else	if (s==9)  out=8'b00000011;
else	if (s==10)  out=8'b10011111; 
else	if (s==11)  out=8'b10011111; 
else	if (s==12)  out=8'b10011111; 
end

else	if (am==4'b1011 && time3)
	begin
		if (d==0)  out=8'b00000011;
else	if (d==1)  out=8'b10011111; 
else	if (d==2)  out=8'b00100101; 
else	if (d==3)  out=8'b00001101; 
else	if (d==4)  out=8'b10011001; 
else	if (d==5)  out=8'b01001001; 
else	if (d==6)  out=8'b11000001; 
else	if (d==7)  out=8'b00011011; 
else	if (d==8)  out=8'b00000001; 
else	if (d==9)  out=8'b00001001; 

else	if (d==10)  out=8'b00000011;
else	if (d==11)  out=8'b10011111; 
else	if (d==12)  out=8'b00100101; 
else	if (d==13)  out=8'b00001101; 
else	if (d==14)  out=8'b10011001; 
else	if (d==15)  out=8'b01001001; 
else	if (d==16)  out=8'b11000001; 
else	if (d==17)  out=8'b00011011; 
else	if (d==18)  out=8'b00000001; 
else	if (d==19)  out=8'b00001001; 
else	if (d==20)  out=8'b00000011;
else	if (d==21)  out=8'b10011111; 
else	if (d==22)  out=8'b00100101; 
else	if (d==23)  out=8'b00001101; 
else	if (d==24)  out=8'b10011001; 
else	if (d==25)  out=8'b01001001; 
else	if (d==26)  out=8'b11000001; 
else	if (d==27)  out=8'b00011011; 
else	if (d==28)  out=8'b00000001; 
else	if (d==29)  out=8'b00001001; 

else	if (d==30)  out=8'b00000011;
else	if (d==31)  out=8'b10011111; 
else	if (d==32)  out=8'b00100101; 
else	if (d==33)  out=8'b00001101; 
else	if (d==34)  out=8'b10011001; 
else	if (d==35)  out=8'b01001001; 
else	if (d==36)  out=8'b11000001; 
else	if (d==37)  out=8'b00011011; 
else	if (d==38)  out=8'b00000001; 
else	if (d==39)  out=8'b00001001; 

else	if (d==40)  out=8'b00000011;
else	if (d==41)  out=8'b10011111; 
else	if (d==42)  out=8'b00100101; 
else	if (d==43)  out=8'b00001101; 
else	if (d==44)  out=8'b10011001; 
else	if (d==45)  out=8'b01001001; 
else	if (d==46)  out=8'b11000001; 
else	if (d==47)  out=8'b00011011; 
else	if (d==48)  out=8'b00000001; 
else	if (d==49)  out=8'b00001001; 

else	if (d==50)  out=8'b00000011;
else	if (d==51)  out=8'b10011111; 
else	if (d==52)  out=8'b00100101; 
else	if (d==53)  out=8'b00001101; 
else	if (d==54)  out=8'b10011001; 
else	if (d==55)  out=8'b01001001; 
else	if (d==56)  out=8'b11000001; 
else	if (d==57)  out=8'b00011011; 
else	if (d==58)  out=8'b00000001; 
else	if (d==59)  out=8'b00001001; 
else	if (d==60)  out=8'b00000011;
end
else if  (am==4'b0111  && time3)
begin
		if (d==0)  out=8'b00000011;
else	if (d==1)  out=8'b00000011;
else	if (d==2)  out=8'b00000011;
else	if (d==3)  out=8'b00000011;
else	if (d==4)  out=8'b00000011;
else	if (d==5)  out=8'b00000011;
else	if (d==6)  out=8'b00000011;
else	if (d==7)  out=8'b00000011;
else	if (d==8)  out=8'b00000011;
else	if (d==9)  out=8'b00000011;

else	if (d==10)  out=8'b10011111; 
else	if (d==11)  out=8'b10011111; 
else	if (d==12)  out=8'b10011111; 
else	if (d==13)  out=8'b10011111; 
else	if (d==14)  out=8'b10011111; 
else	if (d==15)  out=8'b10011111; 
else	if (d==16)  out=8'b10011111; 
else	if (d==17)  out=8'b10011111; 
else	if (d==18)  out=8'b10011111; 
else	if (d==19)  out=8'b10011111; 

else	if (d==20)  out=8'b00100101;
else	if (d==21)  out=8'b00100101;
else	if (d==22)  out=8'b00100101;
else	if (d==23)  out=8'b00100101;
else	if (d==24)  out=8'b00100101;
else	if (d==25)  out=8'b00100101;
else	if (d==26)  out=8'b00100101;
else	if (d==27)  out=8'b00100101;
else	if (d==28)  out=8'b00100101;
else	if (d==29)  out=8'b00100101; 

else	if (d==30)  out=8'b00001101;
else	if (d==31)  out=8'b00001101; 
else	if (d==32)  out=8'b00001101; 
else	if (d==33)  out=8'b00001101; 
else	if (d==34)  out=8'b00001101; 
else	if (d==35)  out=8'b00001101; 
else	if (d==36)  out=8'b00001101; 
else	if (d==37)  out=8'b00001101; 
else	if (d==38)  out=8'b00001101; 
else	if (d==39)  out=8'b00001101;
 
else	if (d==40)  out=8'b10011001; 
else	if (d==41)  out=8'b10011001; 
else	if (d==42)  out=8'b10011001;
else	if (d==43)  out=8'b10011001; 
else	if (d==44)  out=8'b10011001; 
else	if (d==45)  out=8'b10011001; 
else	if (d==46)  out=8'b10011001; 
else	if (d==47)  out=8'b10011001; 
else	if (d==48)  out=8'b10011001; 
else	if (d==49)  out=8'b10011001;

else	if (d==50)  out=8'b01001001; 
else	if (d==51)  out=8'b01001001; 
else	if (d==52)  out=8'b01001001; 
else	if (d==53)  out=8'b01001001; 
else	if (d==54)  out=8'b01001001; 
else	if (d==55)  out=8'b01001001; 
else	if (d==56)  out=8'b01001001; 
else	if (d==57)  out=8'b01001001; 
else	if (d==58)  out=8'b01001001; 
else	if (d==59)  out=8'b01001001;   
end
end
endmodule
