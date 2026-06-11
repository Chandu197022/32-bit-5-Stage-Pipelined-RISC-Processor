module id_ex(
    input clk,
    input reset,

    input [31:0] pc_in,
    input [31:0] rd1_in,
    input [31:0] rd2_in,
    input [31:0] imm_in,

    output reg [31:0] pc_out,
    output reg [31:0] rd1_out,
    output reg [31:0] rd2_out,
    output reg [31:0] imm_out
);

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        pc_out  <= 0;
        rd1_out <= 0;
        rd2_out <= 0;
        imm_out <= 0;
    end
    else
    begin
        pc_out  <= pc_in;
        rd1_out <= rd1_in;
        rd2_out <= rd2_in;
        imm_out <= imm_in;
    end
end

endmodule