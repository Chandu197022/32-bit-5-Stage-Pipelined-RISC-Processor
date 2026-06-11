module ex_mem_tb();

reg clk;
reg reset;

reg [31:0] alu_result_in;
reg [31:0] rd2_in;

wire [31:0] alu_result_out;
wire [31:0] rd2_out;

ex_mem uut(
    .clk(clk),
    .reset(reset),
    .alu_result_in(alu_result_in),
    .rd2_in(rd2_in),
    .alu_result_out(alu_result_out),
    .rd2_out(rd2_out)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    alu_result_in = 30;
    rd2_in = 20;
    #10;

    alu_result_in = 50;
    rd2_in = 40;
    #10;

    $finish;
end

initial begin
    $dumpfile("ex_mem.vcd");
    $dumpvars(0, ex_mem_tb);
end

endmodule