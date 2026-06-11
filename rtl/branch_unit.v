module branch_unit(
    input [31:0] a,
    input [31:0] b,

    output branch_taken
);

assign branch_taken = (a == b);

endmodule