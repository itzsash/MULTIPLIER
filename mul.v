module mul #(
    parameter N = 4  // Define the size of the multiplier (N bits)
)(
    input  [N-1:0] A, // First input (multiplicand)
    input  [N-1:0] B, // Second input (multiplier)
    input  clk,       // Clock signal
    input  rst,       // Reset signal
    output reg [2*N-1:0] P // Product output
);

    reg [N-1:0] A_reg, B_reg; // Registers for pipelining
    reg [2*N-1:0] product;     // Intermediate product

    // Stage 1: Register inputs
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            A_reg <= 0;
            B_reg <= 0;
        end else begin
            A_reg <= A;
            B_reg <= B;
        end
    end

    // Stage 2: Perform multiplication
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            product <= 0;
        end else begin
            product <= A_reg * B_reg;
        end
    end

    // Stage 3: Register output
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            P <= 0;
        end else begin
            P <= product;
        end
    end

endmodule
