`timescale 1ns / 1ps

module carry_lookahead_adder_tb();

reg  [31:0] A = 0;
reg  [31:0] B = 0;
wire [31:0] S;

carry_lookahead_adder inst_0 
    (
    .A(A),
    .B(B),
    .C_in(1'b0),
    .S(S)
);
    
always begin

    $display("A %d B %d Dif %d", A, B, A + B - S);

    A = $random;
    B = {$random} % ( {32{1'b1}} - A );
    #100;
end


endmodule