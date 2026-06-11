module immediate_generator_tb();

reg [31:0] instruction;

wire [31:0] imm_out;

immediate_generator uut(
    .instruction(instruction),
    .imm_out(imm_out)
);

initial begin

    // ADDI x3,x1,10

    instruction = 32'h00A08193;

    #20;

    $finish;

end

initial begin
    $dumpfile("imm_gen.vcd");
    $dumpvars(0,immediate_generator_tb);
end

endmodule