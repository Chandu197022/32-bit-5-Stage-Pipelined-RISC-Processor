module alu_tb();

reg [31:0] a;
reg [31:0] b;
reg [2:0] alu_control;

wire [31:0] result;

alu uut(
    .a(a),
    .b(b),
    .alu_control(alu_control),
    .result(result)
);

initial begin

    a = 20;
    b = 10;

    alu_control = 3'b000;
    #10;

    alu_control = 3'b001;
    #10;

    alu_control = 3'b010;
    #10;

    alu_control = 3'b011;
    #10;

    alu_control = 3'b100;
    #10;

    alu_control = 3'b101;
    #10;

    $finish;
end

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);
end

endmodule