// Module definition for a 2-to-1 multiplexer

module mux (
  input  wire sel,  // Selection signal: chooses between input 'a' and 'b'
  input  wire a,    // First data input
  input  wire b,    // Second data input
  output reg  out   // Output of the multiplexer
);

// Always block that is sensitive to any change in inputs (combinational logic)
always @(*) begin
  if (sel)
    out = a;    // Line A: If sel is 1, assign input 'a' to output
  else
    out = b;    // Line B: If sel is 0, assign input 'b' to output
end

endmodule
