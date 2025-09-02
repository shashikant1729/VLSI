module carry_lookahead_adder_tb;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;

    // Outputs
    wire [3:0] Sum;
    wire Cout;

    // Instantiate the Carry Look-Ahead Adder
    carry_lookahead_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Testbench procedure
    initial begin
        // Initialize inputs
        A = 4'b0000;
        B = 4'b0000;
        Cin = 0;

        // Display header
        $display("A       B       Cin   |   Sum    Cout");
        $display("--------------------------------------");

        // Test case 1
        A = 4'b0001; B = 4'b0010; Cin = 0;
        #10;  // Wait for 10 time units
        $display("%b  %b  %b  |  %b  %b", A, B, Cin, Sum, Cout);

        // Test case 2
        A = 4'b1100; B = 4'b1010; Cin = 1;
        #10;
        $display("%b  %b  %b  |  %b  %b", A, B, Cin, Sum, Cout);

        // Test case 3
        A = 4'b1111; B = 4'b1111; Cin = 0;
        #10;
        $display("%b  %b  %b  |  %b  %b", A, B, Cin, Sum, Cout);

        // Test case 4
        A = 4'b0101; B = 4'b0011; Cin = 1;
        #10;
        $display("%b  %b  %b  |  %b  %b", A, B, Cin, Sum, Cout);

        // Test case 5
        A = 4'b1010; B = 4'b0101; Cin = 0;
        #10;
        $display("%b  %b  %b  |  %b  %b", A, B, Cin, Sum, Cout);

        // Finish simulation
        $finish;
    end

endmodule
