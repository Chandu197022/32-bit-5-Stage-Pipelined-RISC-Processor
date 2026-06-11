module instruction_memory(
    input [31:0] addr,
    output [31:0] instruction
);

reg [31:0] memory [0:255];

initial begin

    // ADD x6,x1,x2
    memory[0] = 32'h00208333;

    // SUB x7,x6,x3
    memory[1] = 32'h403303B3;

    // ADD x8,x7,x4
    memory[2] = 32'h00438433;

    // ADD x9,x8,x5
    memory[3] = 32'h005404B3;

end

assign instruction = memory[addr[9:2]];

endmodule