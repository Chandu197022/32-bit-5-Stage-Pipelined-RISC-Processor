module pipeline_processor_tb();

reg clk;
reg reset;

pipeline_processor uut(
    .clk(clk),
    .reset(reset)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    #300;

    $finish;

end

initial begin
    $dumpfile("pipeline_processor.vcd");
    $dumpvars(0,pipeline_processor_tb);
end

endmodule