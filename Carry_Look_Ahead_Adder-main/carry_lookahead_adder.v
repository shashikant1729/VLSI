module carry_lookahead_adder(
    input [3:0] A,         // 4-bit input A
    input [3:0] B,         // 4-bit input B
    input Cin,             // Carry-in input
    output [3:0] Sum,      // 4-bit sum output
    output Cout            // Carry-out output
);

    // Internal signals for carry generation
    wire [3:0] P;          // Propagate signals
    wire [3:0] G;          // Generate signals
    wire [3:0] C;          // Carry signals

    // Generate and propagate signals
    assign P = A ^ B;      // Propagate signal (P[i] = A[i] ^ B[i])
    assign G = A & B;      // Generate signal (G[i] = A[i] & B[i])

    // Carry look-ahead logic
    assign C[0] = Cin;     // Initial carry-in
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign Cout = G[3] | (P[3] & C[3]);

    // Sum calculation
    assign Sum = P ^ C;

endmodule
