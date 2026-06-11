module flush_unit_tb();

reg branch_taken;

wire flush_if_id;
wire flush_id_ex;

flush_unit uut(
    .branch_taken(branch_taken),
    .flush_if_id(flush_if_id),
    .flush_id_ex(flush_id_ex)
);

initial begin

    branch_taken = 0;
    #10;

    branch_taken = 1;
    #10;

    $finish;

end

initial begin
    $dumpfile("flush_unit.vcd");
    $dumpvars(0,flush_unit_tb);
end

endmodule