module labK;
reg [31:0]x; 
reg [31:0]one; 
reg [31:0]two;
reg [31:0]three; 
 
initial
begin

$display("$time=%5d,x=%b",$time,x);
x=32'hfff0000;
$display("$time=%5d,x=%b",$time,x);
x=x+2;
$display("$time=%5d,x=%b",$time,x);


one = &x;
two = x[1:0];
three = {one,two};

$display("%b",one,"%b",two,"%b",three);
$finish;

end

endmodule
