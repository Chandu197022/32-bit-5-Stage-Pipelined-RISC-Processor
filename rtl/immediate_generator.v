module immediate_generator(
    input [31:0] instruction,
    output reg [31:0] imm_out
);

always @(*)
begin

    case(instruction[6:0])

        // I-Type
        7'b0010011,
        7'b0000011:
        begin
            imm_out =
            {{20{instruction[31]}},
             instruction[31:20]};
        end

        // S-Type
        7'b0100011:
        begin
            imm_out =
            {{20{instruction[31]}},
             instruction[31:25],
             instruction[11:7]};
        end

        default:
            imm_out = 32'd0;

    endcase

end

endmodule