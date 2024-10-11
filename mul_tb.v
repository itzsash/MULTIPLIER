module mul_tb;

    parameter N = 4; // Size of the multiplier
    reg [N-1:0] A;  // First input (multiplicand)
    reg [N-1:0] B;  // Second input (multiplier)
    reg clk;        // Clock signal
    reg rst;        // Reset signal
    wire [2*N-1:0] P; // Product output

    // Instantiate the multiplier
    mul #(N) uut (
        .A(A),
        .B(B),
        .clk(clk),
        .rst(rst),
        .P(P)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units period
    end

    // Test sequence with multiple cases
    initial begin
        // Reset the system
        rst = 1;
        #10;
        rst = 0;

        // Test case 1: 3 * 2
        A = 4'b0011; // 3
        B = 4'b0010; // 2
        #10;
        // Cycle 1: Input registered
        $display("Cycle 1: A_reg = %b (%d), B_reg = %b (%d)", uut.A_reg, uut.A_reg, uut.B_reg, uut.B_reg);
        
        #10; // Cycle 2: Product computed
        $display("Cycle 2: product = %b (%d)", uut.product, uut.product);
        
        #10; // Cycle 3: Output registered
        $display("Cycle 3: P = %b (%d)", P, P);

        // Test case 2: 5 * 4
        A = 4'b0101; // 5
        B = 4'b0100; // 4
        #10;
        // Cycle 1: Input registered
        $display("Cycle 1: A_reg = %b (%d), B_reg = %b (%d)", uut.A_reg, uut.A_reg, uut.B_reg, uut.B_reg);
        
        #10; // Cycle 2: Product computed
        $display("Cycle 2: product = %b (%d)", uut.product, uut.product);
        
        #10; // Cycle 3: Output registered
        $display("Cycle 3: P = %b (%d)", P, P);

        // Test case 3: 7 * 3
        A = 4'b0111; // 7
        B = 4'b0011; // 3
        #10;
        // Cycle 1: Input registered
        $display("Cycle 1: A_reg = %b (%d), B_reg = %b (%d)", uut.A_reg, uut.A_reg, uut.B_reg, uut.B_reg);
        
        #10; // Cycle 2: Product computed
        $display("Cycle 2: product = %b (%d)", uut.product, uut.product);
        
        #10; // Cycle 3: Output registered
        $display("Cycle 3: P = %b (%d)", P, P);

        // Test case 4: 8 * 9
        A = 4'b1000; // 8
        B = 4'b1001; // 9
        #10;
        // Cycle 1: Input registered
        $display("Cycle 1: A_reg = %b (%d), B_reg = %b (%d)", uut.A_reg, uut.A_reg, uut.B_reg, uut.B_reg);
        
        #10; // Cycle 2: Product computed
        $display("Cycle 2: product = %b (%d)", uut.product, uut.product);
        
        #10; // Cycle 3: Output registered
        $display("Cycle 3: P = %b (%d)", P, P);

        // Test case 5: 15 * 15 (Max 4-bit inputs)
        A = 4'b1111; // 15
        B = 4'b1111; // 15
        #10;
        // Cycle 1: Input registered
        $display("Cycle 1: A_reg = %b (%d), B_reg = %b (%d)", uut.A_reg, uut.A_reg, uut.B_reg, uut.B_reg);
        
        #10; // Cycle 2: Product computed
        $display("Cycle 2: product = %b (%d)", uut.product, uut.product);
        
        #10; // Cycle 3: Output registered
        $display("Cycle 3: P = %b (%d)", P, P);
        
        // Finish simulation
        $finish;
    end

    // Monitor the output
    initial begin
        $monitor("At time %0t: A = %b (%d), B = %b (%d), P = %b (%d)", $time, A, A, B, B, P, P);
    end

endmodule
