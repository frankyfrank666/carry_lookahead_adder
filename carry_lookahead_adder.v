module carry_lookahead_adder
    #(parameter WIDTH = 32)

    (
      input  [WIDTH-1:0] A,
      input  [WIDTH-1:0] B,
      input  C_in,
      output [WIDTH-1:0] S,
      output C_out
      );

      wire [WIDTH-1:0] G;
      wire [WIDTH-1:0] P;
      wire [WIDTH:0]   C;

      assign G = A & B;
      assign P = A | B;

      assign C[0] = C_in;
      assign C[WIDTH:1] = G | (P & C[WIDTH-1:0]);
      assign C_out = C[WIDTH];
	
    assign S = (A ^ B) ^ C[WIDTH-1:0];

endmodule