module ex_mem(
    input clk,
    input reset,

    input [31:0] alu_result_in,
    input [31:0] rd2_in,

    output reg [31:0] alu_result_out,
    output reg [31:0] rd2_out
);

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        alu_result_out <= 0;
        rd2_out <= 0;
    end
    else
    begin
        alu_result_out <= alu_result_in;
        rd2_out <= rd2_in;
    end
end

endmodule