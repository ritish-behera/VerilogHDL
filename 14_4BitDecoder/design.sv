// Code your design here
module decoder(input [3:0] A, output [7:0] Y);
    reg [7:0] Y;

    always @*
    begin
        case(A)
            4'b0001: Y = 8'b00000001;
            4'b0010: Y = 8'b00000010;
            4'b0011: Y = 8'b00000100;
            4'b0100: Y = 8'b00001000;
            4'b0101: Y = 8'b00010000;
            4'b0110: Y = 8'b00100000;
            4'b0111: Y = 8'b01000000;
            4'b1000: Y = 8'b10000000;
            default: Y = 8'b00000000;
        endcase
    end

endmodule

