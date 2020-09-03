//----------------------------------------------------------------------------------
//  Fall2020__CS4341-502(206)__HW1
//  Name(Last,First)  : Ziaei, Armin
//  Date              : sep/03/2020
//
//  Modules           : Problem6, Problem12, AND, OR, XOR, NOT, NAND, NOR, XNOR /3bit truth-table
//  Software version  : Icarus Verilog version 11.0 (http://iverilog.icarus.com/)(http://bleyer.org/icarus/)
//----------------------------------------------------------------------------------
module fAND(N,G,S,result);            //Module AND
input N,G,S;
output result;
reg result;
always @ (N,G,S,result) begin
result= (N&G&S);
end
endmodule                             //Module End
//----------------------------------------------------------------------
module fOR(N,G,S,result);             //Module OR
input N,G,S;                        
output result;                        
reg result;                           
always @ (N,G,S,result) begin          
result= (N|G|S);                 
end                                
endmodule                              //Module End
//----------------------------------------------------------------------
module fXOR(N,G,S,result);             //Module XOR
input N,G,S;                        
output result;                        
reg result;                           
always @ (N,G,S,result) begin          
result= (N^G^S);                 
end                                
endmodule                              //Module End
//----------------------------------------------------------------------
module fNOT(N,G,S,result);             //Module NOT
input N,G,S;                        
output result;                        
reg result;                           
always @ (N,G,S,result) begin          
result= (!N)&(!G)&(!S);                 
end                                
endmodule                             //Module End
//----------------------------------------------------------------------
module fNAND(N,G,S,result);           //Module NAND
input N,G,S;                        
output result;                        
reg result;                           
always @ (N,G,S,result) begin          
result= !(N&G&S);                 
end                                
endmodule                             //Module End
//----------------------------------------------------------------------
module fNOR(N,G,S,result);            //Module NOR
input N,G,S;                        
output result;                        
reg result;                           
always @ (N,G,S,result) begin          
result= !(N|G|S);                 
end                                
endmodule                             //Module End
//----------------------------------------------------------------------
module fXNOR(N,G,S,result);           //Module XNOR
input N,G,S;                        
output result;                        
reg result;                           
always @ (N,G,S,result) begin          
result= !(N^G^S);                 
end                                
endmodule                             //Module End
//----------------------------------------------------------------------
module fPSix(N,G,S,result);           //Module f(N,G,S)=(N'G')'(N'S')'(G'S')'
input N,G,S;                        
output result;                        
reg result;                           
always @ (N,G,S,result) begin          
result= !(!N&!G)&!(!N&!S)&!(!G&!S);                 
end                                
endmodule                             //Module End
//----------------------------------------------------------------------
module fPTwelve(N,G,S,result);        //Module f(N,G,S)=(NG+NS+GS)
input N,G,S;                        
output result;                        
reg result;                           
always @ (N,G,S,result) begin          
result= (N&G)|(N&S)|(G&S);                 
end                                
endmodule                             //Module End
//----------------------------------------------------------------------

module testbench();

  //Registers act like local variables
  reg [3:0] i; //A loop control for 16 rows of a truth table. 
  reg  a;//The high bit, value of 8
  reg  b;//Value of 4
  reg  c;//The low bit 
  
  //A wire can hold the return of a function
  wire f1;
  wire f2;
  wire f3;
  wire f4;
  wire f5;
  wire f6;
  wire f7;
  wire f8;
  wire f9;


  fPSix    one  (a,b,c,f1);
  fPTwelve two  (a,b,c,f2);
  fAND     three(a,b,c,f3);
  fOR      four (a,b,c,f4);   
	fXOR     five (a,b,c,f5);
  fNOT     six  (a,b,c,f6);
  fNAND    seven(a,b,c,f7);
  fNOR     eight(a,b,c,f8);
  fXNOR    nine (a,b,c,f9);
   

  //main()	
  initial begin
   	
  $display (" #|N|G|S||1|2|3|4|5|6|7|8|9");
  $display ("==+=+=+=+=++=+=+=+=+=+=+=+=");
  
  //A for loop, with register i being the loop control variable.
	for (i = 0; i < 8; i = i + 1) 
	begin//Open the code blook of the for loop
		a=(i/4)%2;//High bit
		b=(i/2)%2;
		c=(i/1)%2;//Low bit	
		  
		#7;//Need a little delay!
		
		$display ("%2d|%1d|%1d|%1d||%1d|%1d|%1d|%1d|%1d|%1d|%1d|%1d|%1d",i,a,b,c,f1,f2,f3,f4,f5,f6,f7,f8,f9);

	end//End of the for loop code block
  $display ("___________________________");
	#10 //A time dealy of 10 time units. Hashtag Delay
	$finish;//A command, not unlike System.exit(0) in Java.
  end  //End the code block of the main (initial)
endmodule //Close the testbench module