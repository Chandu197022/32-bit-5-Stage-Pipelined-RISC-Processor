module hazard_detection_tb();

reg [4:0] id_ex_rd;
reg [4:0] if_id_rs1;
reg [4:0] if_id_rs2;
reg id_ex_memread;

wire stall;

hazard_detection uut(
    .id_ex_rd(id_ex_rd),
    .if_id_rs1(if_id_rs1),
    .if_id_rs2(if_id_rs2),
    .id_ex_memread(id_ex_memread),
    .stall(stall)
);

initial begin

    id_ex_rd = 5'd1;
    if_id_rs1 = 5'd1;
    if_id_rs2 = 5'd2;
    id_ex_memread = 1;

    #10;

    id_ex_rd = 5'd3;
    if_id_rs1 = 5'd1;
    if_id_rs2 = 5'd2;
    id_ex_memread = 1;

    #10;

    $finish;

end

initial begin
    $dumpfile("hazard_detection.vcd");
    $dumpvars(0,hazard_detection_tb);
end

endmodule