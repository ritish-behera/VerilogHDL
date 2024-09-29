module circuit2(output reg [31:0]D, input [4:0]A, input enable);
  
  reg [3:0]decoder_out;
  
  decoder2x4 g1(decoder_out,A[4:3],enable);
  
  decoder3x8 g2(D[7:0],A[2:0],decoder_out[0]);
  decoder3x8 g3(D[15:8],A[2:0],decoder_out[1]);
  decoder3x8 g4(D[23:16],A[2:0],decoder_out[2]);
  decoder3x8 g5(D[31:24],A[2:0],decoder_out[3]);
  
endmodule


module decoder2x4(
    output reg [3:0] out,
    input [1:0] in,
    input enable
);
always @* 
  begin
    if(enable)
        case (in)
            2'b00 : out =  4'b0001 ;
            2'b01 : out =  4'b0010 ;
            2'b10 : out =  4'b0100 ;
            2'b11 : out =  4'b1000 ;
            default: out = 4'bxxxx;
        endcase
      end
endmodule


module decoder3x8(
    output reg [7:0] out,
    input [2:0] in,
    input enable
);
always @* begin
    case (in)
        3'b000 : out = (enable) ? 8'b00000001 : 8'bxxxxxxxx;
        3'b001 : out = (enable) ? 8'b00000010 : 8'bxxxxxxxx;
        3'b010 : out = (enable) ? 8'b00000100 : 8'bxxxxxxxx;
        3'b011 : out = (enable) ? 8'b00001000 : 8'bxxxxxxxx;
        3'b100 : out = (enable) ? 8'b00010000 : 8'bxxxxxxxx;
        3'b101 : out = (enable) ? 8'b00100000 : 8'bxxxxxxxx;
        3'b110 : out = (enable) ? 8'b01000000 : 8'bxxxxxxxx;
        3'b111 : out = (enable) ? 8'b10000000 : 8'bxxxxxxxx;
        default: out = 8'bxxxxxxxx;
    endcase
end
endmodule



