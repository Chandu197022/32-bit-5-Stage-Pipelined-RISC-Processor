module pc_tb();

reg clk;
reg reset;
reg [31:0] next_pc;
wire [31:0] pc_out;

pc uut(
    .clk(clk),
    .reset(reset),
    .next_pc(next_pc),
    .pc_out(pc_out)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    next_pc = 0;

    #10;
    reset = 0;

    next_pc = 4;
    #10;

    next_pc = 8;
    #10;

    next_pc = 12;
    #10;

    $finish;
end

initial begin
    $dumpfile("pc.vcd");
    $dumpvars(0, pc_tb);
end

endmodule