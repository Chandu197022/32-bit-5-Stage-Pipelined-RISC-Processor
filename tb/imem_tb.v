module imem_tb();

reg [31:0] addr;
wire [31:0] instruction;

instruction_memory uut(
    .addr(addr),
    .instruction(instruction)
);

initial begin

    addr = 0;
    #10;

    addr = 4;
    #10;

    addr = 8;
    #10;

    $finish;

end

initial begin
    $dumpfile("imem.vcd");
    $dumpvars(0,imem_tb);
end

endmodule