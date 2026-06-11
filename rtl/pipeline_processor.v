module pipeline_processor(
    input clk,
    input reset
);

//======================
// IF STAGE
//======================

wire [31:0] pc_out;
wire [31:0] next_pc;
wire [31:0] instruction;

pc PC(
    .clk(clk),
    .reset(reset),
    .next_pc(next_pc),
    .pc_out(pc_out)
);

assign next_pc = pc_out + 4;

instruction_memory IMEM(
    .addr(pc_out),
    .instruction(instruction)
);

//======================
// IF/ID
//======================

wire [31:0] if_id_pc;
wire [31:0] if_id_instruction;

if_id IF_ID(
    .clk(clk),
    .reset(reset),
    .pc_in(pc_out),
    .instruction_in(instruction),
    .pc_out(if_id_pc),
    .instruction_out(if_id_instruction)
);

//======================
// ID STAGE
//======================

wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;

assign rs1 = if_id_instruction[19:15];
assign rs2 = if_id_instruction[24:20];
assign rd  = if_id_instruction[11:7];

wire [31:0] rd1;
wire [31:0] rd2;

register_file RF(
    .clk(clk),
    .we(1'b0),
    .rs1(rs1),
    .rs2(rs2),
    .rd(5'd0),
    .wd(mem_wb_alu_result),
    .rd1(rd1),
    .rd2(rd2)
);

//======================
// ID/EX
//======================
//======================
// Hazard Detection
//======================

wire stall;

hazard_detection HDU(
    .id_ex_rd(rd),
    .if_id_rs1(rs1),
    .if_id_rs2(rs2),
    .id_ex_memread(1'b0),
    .stall(stall)
);
wire [31:0] id_ex_pc;
wire [31:0] id_ex_rd1;
wire [31:0] id_ex_rd2;
wire [31:0] id_ex_imm;

id_ex ID_EX(
    .clk(clk),
    .reset(reset),
    .pc_in(if_id_pc),
    .rd1_in(rd1),
    .rd2_in(rd2),
    .imm_in(32'd0),
    .pc_out(id_ex_pc),
    .rd1_out(id_ex_rd1),
    .rd2_out(id_ex_rd2),
    .imm_out(id_ex_imm)
);

//======================
// EX STAGE
//======================

//======================
// Forwarding Unit
//======================

wire [1:0] forward_a;
wire [1:0] forward_b;

forwarding_unit FU(
    .ex_rs1(rs1),
    .ex_rs2(rs2),

    .mem_rd(rd),
    .wb_rd(rd),

    .mem_regwrite(1'b1),
    .wb_regwrite(1'b1),

    .forward_a(forward_a),
    .forward_b(forward_b)
);

//======================
// Forwarding MUX
//======================

wire [31:0] alu_a;
wire [31:0] alu_b;

assign alu_a =
    (forward_a == 2'b10) ? ex_mem_alu_result :
    (forward_a == 2'b01) ? mem_wb_alu_result :
                           id_ex_rd1;

assign alu_b =
    (forward_b == 2'b10) ? ex_mem_alu_result :
    (forward_b == 2'b01) ? mem_wb_alu_result :
                           id_ex_rd2;

//======================
// EX STAGE
//======================

wire [31:0] alu_result;

alu ALU(
    .a(alu_a),
    .b(alu_b),
    .alu_control(3'b000),
    .result(alu_result)
);

//======================
// EX/MEM
//======================

wire [31:0] ex_mem_alu_result;
wire [31:0] ex_mem_rd2;

ex_mem EX_MEM(
    .clk(clk),
    .reset(reset),
    .alu_result_in(alu_result),
    .rd2_in(id_ex_rd2),
    .alu_result_out(ex_mem_alu_result),
    .rd2_out(ex_mem_rd2)
);

//======================
// MEM STAGE
//======================

wire [31:0] mem_read_data;

data_memory DMEM(
    .clk(clk),
    .memread(1'b0),
    .memwrite(1'b0),
    .addr(ex_mem_alu_result),
    .write_data(ex_mem_rd2),
    .read_data(mem_read_data)
);

//======================
// MEM/WB
//======================
//======================
// Flush Unit
//======================

wire flush_if_id;
wire flush_id_ex;

flush_unit FLUSH(
    .branch_taken(1'b0),
    .flush_if_id(flush_if_id),
    .flush_id_ex(flush_id_ex)
);
wire [31:0] mem_wb_mem_data;
wire [31:0] mem_wb_alu_result;

mem_wb MEM_WB(
    .clk(clk),
    .reset(reset),
    .mem_data_in(mem_read_data),
    .alu_result_in(ex_mem_alu_result),
    .mem_data_out(mem_wb_mem_data),
    .alu_result_out(mem_wb_alu_result)
);

endmodule