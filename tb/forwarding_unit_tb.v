module forwarding_unit_tb();

reg [4:0] ex_rs1;
reg [4:0] ex_rs2;

reg [4:0] mem_rd;
reg [4:0] wb_rd;

reg mem_regwrite;
reg wb_regwrite;

wire [1:0] forward_a;
wire [1:0] forward_b;

forwarding_unit uut(
    .ex_rs1(ex_rs1),
    .ex_rs2(ex_rs2),
    .mem_rd(mem_rd),
    .wb_rd(wb_rd),
    .mem_regwrite(mem_regwrite),
    .wb_regwrite(wb_regwrite),
    .forward_a(forward_a),
    .forward_b(forward_b)
);

initial begin

    // EX forwarding
    ex_rs1 = 5'd1;
    ex_rs2 = 5'd2;

    mem_rd = 5'd1;
    wb_rd  = 5'd0;

    mem_regwrite = 1;
    wb_regwrite  = 0;

    #10;

    // WB forwarding
    ex_rs1 = 5'd3;
    ex_rs2 = 5'd4;

    mem_rd = 5'd0;
    wb_rd  = 5'd4;

    mem_regwrite = 0;
    wb_regwrite  = 1;

    #10;

    $finish;

end

initial begin
    $dumpfile("forwarding_unit.vcd");
    $dumpvars(0,forwarding_unit_tb);
end

endmodule