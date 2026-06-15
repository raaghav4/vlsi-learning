module tb_rca_4bit;
  reg [3:0]a,b;
  reg cin;
  wire [3:0] sum;
  wire cout;
  rca_4bit dut(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );
  initial begin
    a=4'b0011;b=4'b0100;cin=0;#10;
    a=4'b0110;b=4'b1011;cin=0;#10;
    a=4'b1111;b=4'b0001;cin=0;#10;
    a=4'b0111;b=4'b0111;cin=1;#10;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb_rca_4bit);
  end
  initial begin
    $monitor("Time=0%t a=%b b=%b cin=%b sum=%b cout=%b c0=%b c1=%b c2=%b",$time,a,b,cin,sum,cout,dut.c0,dut.c1,dut.c2);
  end
endmodule
