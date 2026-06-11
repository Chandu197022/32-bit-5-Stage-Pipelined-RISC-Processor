module processor_top(
    input clk,
    input reset
);

wire [31:0] pc_out;
wire [31:0] next_pc;

wire [31:0] instruction;

wire [31:0] rd1;
wire [31:0] rd2;

wire [31:0] alu_result;

// instruction fields
wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;

assign rs1 = instruction[19:15];
assign rs2 = instruction[24:20];
assign rd  = instruction[11:7];

// PC
pc PC(
    .clk(clk),
    .reset(reset),
    .next_pc(next_pc),
    .pc_out(pc_out)
);

assign next_pc = pc_out + 4;

// IMEM
instruction_memory IMEM(
    .addr(pc_out),
    .instruction(instruction)
);

// Register File
register_file RF(
    .clk(clk),
    .we(1'b1),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .wd(alu_result),
    .rd1(rd1),
    .rd2(rd2)
);

// ALU
alu ALU(
    .a(rd1),
    .b(rd2),
    .alu_control(3'b000),
    .result(alu_result)
);

endmodule