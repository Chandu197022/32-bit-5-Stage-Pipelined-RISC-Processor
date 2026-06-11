module control_unit_tb();

reg [6:0] opcode;

wire regwrite;
wire alusrc;
wire memread;
wire memwrite;
wire memtoreg;

control_unit uut(
    .opcode(opcode),
    .regwrite(regwrite),
    .alusrc(alusrc),
    .memread(memread),
    .memwrite(memwrite),
    .memtoreg(memtoreg)
);

initial begin

    opcode = 7'b0110011;
    #10;

    opcode = 7'b0000011;
    #10;

    opcode = 7'b0100011;
    #10;

    $finish;

end

initial begin
    $dumpfile("control_unit.vcd");
    $dumpvars(0,control_unit_tb);
end

endmodule