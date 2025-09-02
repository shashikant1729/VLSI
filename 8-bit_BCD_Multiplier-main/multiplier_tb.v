module multiplier_tb;
parameter n_bits=5;
//Inputs
reg[n_bits-1:0] a_in;
reg [n_bits-1:0] b_in;
reg clk;
reg start;
reg reset;

//Outputs
wire [(n_bits*2)-1:0] out;
wire finish;
wire [(((n_bits*2)/3)+1)*4-1:0] bcd;

//Instantiate the unit under test (UUT)
multiplier uut(.out(out),.a_in(a_in),.b_in(b_in),.clk(clk),
.start(start),.reset(reset),.finish(finish),.bcd(bcd));
defparam uut.N=n_bits;
initial 
begin
forever
#50 clk=~clk;
end
initial begin
a_in=0;
b_in=0;
clk=0;
start=0;
reset=0;

//Wait 100ns for global reset to finish
#100;
a_in='d26;
b_in='d30;
start=0;
#200;
start=1;
#1000;
a_in='d13;
b_in='d13;
start=0;
#200;
start=1;
end
initial
begin
#3000;
$finish;
end
endmodule










