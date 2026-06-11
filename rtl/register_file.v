module register_file(
    input clk,
    input we,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input [31:0] wd,
    output [31:0] rd1,
    output [31:0] rd2
);

reg [31:0] regfile [0:31];

initial begin

    regfile[0] = 0;

    regfile[1] = 10;
    regfile[2] = 20;
    regfile[3] = 30;
    regfile[4] = 40;
    regfile[5] = 50;

end

assign rd1 = regfile[rs1];
assign rd2 = regfile[rs2];

always @(posedge clk)
begin
    if(we && rd != 0)
        regfile[rd] <= wd;
end

endmodule