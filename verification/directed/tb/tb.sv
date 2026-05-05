// Testbench module for the 2:1 multiplexer (mux)

module tb;

  timeunit      1ns;
  timeprecision 100ps;

  import config_pkg::*;

  // Clock signal
  logic clk_i = 0;
  int unsigned MainClkPeriod = 10;  // 100 MHz -> 10 ns period
  always #(MainClkPeriod / 2) clk_i = ~clk_i;

  // Interface
  vif_if vif (clk_i);

  // Test
  test top_test (vif);

  // Instantiation
  mux dut (
    .sel(vif.sel),  // Connect testbench 'sel' to mux input 'sel'
    .a(vif.a),      // Connect testbench 'a' to mux input 'a'
    .b(vif.b),      // Connect testbench 'b' to mux input 'b'
    .out(vif.out)   // Connect mux output 'out' to testbench 'out'
  );

  // SVA
  bind dut sva dut_sva (
    .sel(vif.sel),
    .a(vif.a),
    .b(vif.b),|
    .out(vif.out)
  );

initial begin
    $timeformat(-9, 1, "ns", 10);
  end

endmodule : tb
