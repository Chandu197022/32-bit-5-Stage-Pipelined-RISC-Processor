module forwarding_unit(
    input [4:0] ex_rs1,
    input [4:0] ex_rs2,

    input [4:0] mem_rd,
    input [4:0] wb_rd,

    input mem_regwrite,
    input wb_regwrite,

    output reg [1:0] forward_a,
    output reg [1:0] forward_b
);

always @(*)
begin

    forward_a = 2'b00;
    forward_b = 2'b00;

    // EX hazard
    if(mem_regwrite &&
       (mem_rd != 0) &&
       (mem_rd == ex_rs1))
        forward_a = 2'b10;

    if(mem_regwrite &&
       (mem_rd != 0) &&
       (mem_rd == ex_rs2))
        forward_b = 2'b10;

    // MEM hazard
    if(wb_regwrite &&
       (wb_rd != 0) &&
       (wb_rd == ex_rs1))
        forward_a = 2'b01;

    if(wb_regwrite &&
       (wb_rd != 0) &&
       (wb_rd == ex_rs2))
        forward_b = 2'b01;

end

endmodule