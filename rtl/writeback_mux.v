module writeback_mux(
    input memtoreg,
    input [31:0] alu_result,
    input [31:0] mem_data,
    output [31:0] wb_data
);

assign wb_data =
        (memtoreg) ? mem_data :
                     alu_result;

endmodule