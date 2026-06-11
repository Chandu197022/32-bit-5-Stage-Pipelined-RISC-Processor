module mem_wb_tb();

reg clk;
reg reset;

reg [31:0] mem_data_in;
reg [31:0] alu_result_in;

wire [31:0] mem_data_out;
wire [31:0] alu_result_out;

mem_wb uut(
    .clk(clk),
    .reset(reset),
    .mem_data_in(mem_data_in),
    .alu_result_in(alu_result_in),
    .mem_data_out(mem_data_out),
    .alu_result_out(alu_result_out)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    mem_data_in = 100;
    alu_result_in = 30;
    #10;

    mem_data_in = 200;
    alu_result_in = 50;
    #10;

    $finish;
end

initial begin
    $dumpfile("mem_wb.vcd");
    $dumpvars(0, mem_wb_tb);
end

endmodule