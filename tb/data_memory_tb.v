module data_memory_tb();

reg clk;
reg memread;
reg memwrite;

reg [31:0] addr;
reg [31:0] write_data;

wire [31:0] read_data;

data_memory uut(
    .clk(clk),
    .memread(memread),
    .memwrite(memwrite),
    .addr(addr),
    .write_data(write_data),
    .read_data(read_data)
);

always #5 clk = ~clk;

initial begin

    clk = 0;

    // Write 100
    memwrite = 1;
    memread = 0;

    addr = 0;
    write_data = 100;

    #10;

    // Read back
    memwrite = 0;
    memread = 1;

    #10;

    $finish;

end

initial begin
    $dumpfile("data_memory.vcd");
    $dumpvars(0,data_memory_tb);
end

endmodule