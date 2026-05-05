module test (
    vif_if vif
);
  // =================== DPI FUNCTIONS ==================== //
  import "DPI-C" function real ref_model(real initial_value);

  // ================== GLOBAL VARIABLES ================== //

  import config_pkg::*;

  // =================== MAIN SEQUENCE ==================== //

  initial begin
    // Initial values
    $display("Begin Of Simulation.");
    get_config_args();

    // Apply reset
    // reset();

    // Stimulus
    rutina();

    // Drain time
    #(100ns);
    $display("End Of Simulation.");
    $finish;
  end


  // ======================= TASKS ======================== //

  task automatic rutina();
   // Test only one value of sel to demonstrate partial line coverage
    vif.sel = 1; vif.a = 1; vif.b = 0; #10;  // sel=1, so mux outputs 'a' (1) — Line A covered
    vif.sel = 1; vif.a = 0; vif.b = 1; #10;  // sel=1, mux outputs 'a' (0) — Line A again

    vif.sel = 0; vif.a = 0; vif.b = 1; #10;  // sel=0, mux should output 'b' (1) — Actually covers Line B
    vif.sel = 0; vif.a = 0; vif.b = 0; #10;  // sel=0, mux outputs 'b' (0) — Line B again

  endtask : rutina


endmodule : test
