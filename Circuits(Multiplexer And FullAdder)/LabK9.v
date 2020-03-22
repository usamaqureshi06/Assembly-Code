module labK;
reg a,b,c,flag;
reg [1:0]expect;
wire Cout,z,andOfTwo1,andOfTwo2,xorOfTwo1,xorOfTwo2,orOfTwo,one,two,three;
integer i,j,k;

and my_and(andOfTwo1,a,b);
xor my_xor(xorOfTwo1,a,b);
and my_and2(andOfTwo2,one,c);
or my_or(Cout,three,two);
xor my_xor2(z,c,one);

assign one=xorOfTwo1;
assign two=andOfTwo1;
assign three=andOfTwo2;

initial
begin
	
	//a=1;b=0;c=0;
	/*
	flag= $value$plusargs("a=%b",a);
	if(flag===0)
		//$display("Flag: flag=%b",flag);
		$display("Wrong number of input");
	
		flag= $value$plusargs("b=%b",b);
	if(flag===0)
		//$display("Flag: flag=%b",flag);
		$display("Wrong number of input");
	
	flag= $value$plusargs("c=%b",c);
	if(flag===0)
		//$display("Flag: flag=%b",flag);
		$display("Wrong number of input");
			
	#1 $display("a=%b b=%b c=%b z=%b Cout=%b",a,b,c,z,Cout);
	*/
	for(i=0;i<2;i=i+1)
	begin
		for(j=0;j<2;j=j+1)
		begin
			for(k=0;k<2;k=k+1)
			begin
				a=i;b=j;c=k;
				expect= a + b + c;
				#1;
				if(expect[0]===z && expect[1]===Cout)
					$display("PASS: a=%b b=%b c=%b z=%b Cout=%b",a,b,c,z,Cout);
				else
					$display("FAIL: a=%b b=%b c=%b z=%b Cout=%b",a,b,c,z,Cout);
			end
		end
	end
	

	$finish;
end
endmodule