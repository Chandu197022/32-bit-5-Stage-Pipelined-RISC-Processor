module mem_wb(
    input clk,
    input reset,

    input [31:0] mem_data_in,
    input [31:0] alu_result_in,

    output reg [31:0] mem_data_out,
    output reg [31:0] alu_result_out
);

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        mem_data_out   <= 0;
        alu_result_out <= 0;
    end
    else
    begin
        mem_data_out   <= mem_data_in;
        alu_result_out <= alu_result_in;
    end
end

endmodule