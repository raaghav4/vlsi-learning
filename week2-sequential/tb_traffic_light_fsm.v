// Testbench — Traffic Light Controller FSM
// Verifies: auto-timer, all 4 states, full cycle

module tb_traffic_light_fsm;
  reg clk, rst;
  wire [1:0] light;

  traffic_light_fsm dut(
    .clk(clk),
    .rst(rst),
    .light(light)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_traffic_light_fsm);
  end

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    rst=1; #15;
    rst=0;
    #500;
    $finish;
  end

  initial begin
    $monitor("Time=%0t state=%b light=%b count=%0d",
              $time, dut.state, light, dut.count);
  end

endmodule
