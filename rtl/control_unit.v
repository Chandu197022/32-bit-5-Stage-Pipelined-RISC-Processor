module control_unit(
    input [6:0] opcode,

    output reg regwrite,
    output reg alusrc,
    output reg memread,
    output reg memwrite,
    output reg memtoreg
);

always @(*)
begin

    regwrite = 0;
    alusrc   = 0;
    memread  = 0;
    memwrite = 0;
    memtoreg = 0;

    case(opcode)

        // R-Type
        7'b0110011:
        begin
            regwrite = 1;
        end

        // Load
        7'b0000011:
        begin
            regwrite = 1;
            alusrc   = 1;
            memread  = 1;
            memtoreg = 1;
        end

        // Store
        7'b0100011:
        begin
            alusrc   = 1;
            memwrite = 1;
        end

    endcase

end

endmodule