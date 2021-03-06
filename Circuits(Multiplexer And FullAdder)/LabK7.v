module labK;
reg a,b,expect,c,flag,check;
wire tmp,z,notInput,andOfTwo1,andOfTwo2,lowerInput,one,two;
integer i,j;

not my_not(notInput,c);
and my_and(andOfTwo1,a,lowerInput);
and my_and(andOfTwo2,b,c);
or my_or(tmp,one,two);
assign lowerInput=notInput;
assign one=andOfTwo1;
assign two=andOfTwo2;
initial
begin
	
	//a=1;b=0;c=0;
	
	flag= $value$plusargs("a=%b",a);
	if(flag===0)
		//$display("Flag: flag=%b",flag);
		$display("Wrong number of input");
	else
		flag= $value$plusargs("b=%b",b);
		flag= $value$plusargs("c=%b",c);

	expect= (a & ~c)|(b & c);
	#1;
	if(expect === tmp)
		$display("PASS: tmp=%b",tmp);
	else
		$display("FAIL: tmp=%b",tmp);
	
	$finish;
end
endmodule