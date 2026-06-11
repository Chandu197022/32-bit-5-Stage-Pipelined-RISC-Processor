module branch_unit_tb();

reg [31:0] a;
reg [31:0] b;

wire branch_taken;

branch_unit uut(
    .a(a),
    .b(b),
    .branch_taken(branch_taken)
);

initial begin

    a = 10;
    b = 10;
    #10;

    a = 10;
    b = 20;
    #10;

    $finish;

end

initial begin
    $dumpfile("branch_unit.vcd");
    $dumpvars(0,branch_unit_tb);
end

endmodule