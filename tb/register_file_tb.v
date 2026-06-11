module register_file_tb();

reg clk;
reg we;
reg [4:0] rs1;
reg [4:0] rs2;
reg [4:0] rd;
reg [31:0] wd;

wire [31:0] rd1;
wire [31:0] rd2;

register_file uut(
    .clk(clk),
    .we(we),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .wd(wd),
    .rd1(rd1),
    .rd2(rd2)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    we = 1;

    rd = 5'd1;
    wd = 32'd100;
    #10;

    rd = 5'd2;
    wd = 32'd200;
    #10;

    we = 0;

    rs1 = 5'd1;
    rs2 = 5'd2;
    #20;

    $finish;
end

initial begin
    $dumpfile("register_file.vcd");
    $dumpvars(0, register_file_tb);
end

endmodule