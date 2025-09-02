// Testbench for 16:1 Multiplexer

module mux16_1_tb;

    // Inputs
    reg [15:0] data_in;  // 16-bit wide data input
    reg [3:0] sel;       // 4-bit wide select input
    reg clk;             // Clock signal

    // Output
    wire mux_out;        // Output of the multiplexer

    // Instantiate the 16:1 multiplexer
    mux16_1_st MUX1 (
        .in(data_in),
        .s(sel),
        .y(mux_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        data_in = 16'b0000_0000_0000_0000;
        sel = 4'b0000;

        // Apply test vectors
        #10 data_in = 16'b0000_0000_0000_0001; sel = 4'b0000; // Test case 1
        #10 data_in = 16'b0000_0000_0000_0010; sel = 4'b0001; // Test case 2
        #10 data_in = 16'b0000_0000_0000_0100; sel = 4'b0010; // Test case 3
        #10 data_in = 16'b0000_0000_0000_1000; sel = 4'b0011; // Test case 4
        #10 data_in = 16'b0000_0000_0001_0000; sel = 4'b0100; // Test case 5
        #10 data_in = 16'b0000_0000_0010_0000; sel = 4'b0101; // Test case 6
        #10 data_in = 16'b0000_0000_0100_0000; sel = 4'b0110; // Test case 7
        #10 data_in = 16'b0000_0000_1000_0000; sel = 4'b0111; // Test case 8
        #10 data_in = 16'b0000_0001_0000_0000; sel = 4'b1000; // Test case 9
        #10 data_in = 16'b0000_0010_0000_0000; sel = 4'b1001; // Test case 10
        #10 data_in = 16'b0000_0100_0000_0000; sel = 4'b1010; // Test case 11
        #10 data_in = 16'b0000_1000_0000_0000; sel = 4'b1011; // Test case 12
        #10 data_in = 16'b0001_0000_0000_0000; sel = 4'b1100; // Test case 13
        #10 data_in = 16'b0010_0000_0000_0000; sel = 4'b1101; // Test case 14
        #10 data_in = 16'b0100_0000_0000_0000; sel = 4'b1110; // Test case 15
        #10 data_in = 16'b1000_0000_0000_0000; sel = 4'b1111; // Test case 16

        // Finish simulation
        #10 $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time: %0t | data_in: %b | sel: %b | mux_out: %b", $time, data_in, sel, mux_out);
    end

endmodule

