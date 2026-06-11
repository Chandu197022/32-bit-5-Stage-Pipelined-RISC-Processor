module id_ex_tb();

reg clk;
reg reset;

reg [31:0] pc_in;
reg [31:0] rd1_in;
reg [31:0] rd2_in;
reg [31:0] imm_in;

wire [31:0] pc_out;
wire [31:0] rd1_out;
wire [31:0] rd2_out;
wire [31:0] imm_out;

id_ex uut(
    .clk(clk),
    .reset(reset),
    .pc_in(pc_in),
    .rd1_in(rd1_in),
    .rd2_in(rd2_in),
    .imm_in(imm_in),
    .pc_out(pc_out),
    .rd1_out(rd1_out),
    .rd2_out(rd2_out),
    .imm_out(imm_out)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    pc_in  = 4;
    rd1_in = 10;
    rd2_in = 20;
    imm_in = 100;

    #10;

    pc_in  = 8;
    rd1_in = 30;
    rd2_in = 40;
    imm_in = 200;

    #10;

    $finish;
end

initial begin
    $dumpfile("id_ex.vcd");
    $dumpvars(0,id_ex_tb);
end

endmodule