module processor_tb();

reg clk;
reg reset;

processor_top uut(
    .clk(clk),
    .reset(reset)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    #100;

    $finish;

end

initial begin
    $dumpfile("processor.vcd");
    $dumpvars(0,processor_tb);
end

endmodule