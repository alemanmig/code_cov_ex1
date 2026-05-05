// Testbench module for the 2:1 multiplexer (mux)

module tb_mux;

  // Declare testbench signals
  reg sel, a, b;     // Input signals to the DUT (Device Under Test)
  wire out;          // Output signal from the DUT

  // Instantiate the DUT (mux) and connect testbench signals
  mux dut (
    .sel(sel),  // Connect testbench 'sel' to mux input 'sel'
    .a(a),      // Connect testbench 'a' to mux input 'a'
    .b(b),      // Connect testbench 'b' to mux input 'b'
    .out(out)   // Connect mux output 'out' to testbench 'out'
  );

  // Initial block to define the stimulus for the simulation
  initial begin
    // Test only one value of sel to demonstrate partial line coverage
    sel = 1; a = 1; b = 0; #10;  // sel=1, so mux outputs 'a' (1) — Line A covered
    sel = 1; a = 0; b = 1; #10;  // sel=1, mux outputs 'a' (0) — Line A again

    sel = 0; a = 0; b = 1; #10;  // sel=0, mux should output 'b' (1) — Actually covers Line B
    sel = 0; a = 0; b = 0; #10;  // sel=0, mux outputs 'b' (0) — Line B again

    // End simulation
    $finish;
  end

endmodule
