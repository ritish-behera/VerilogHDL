module circuit3(out,in,select);
  output reg out;
  input [15:0]in;
  input [3:0]select;
  
  wire mux_out1,mux_out2;
  
  mux8x1 g1(mux_out1,in[7:0],select[2:0]);
  mux8x1 g2(mux_out2,in[15:8],select[2:0]);
  mux2x1 g3(out,{mux_out2,mux_out1},select[3]);
endmodule


module mux2x1(out,in,select);
  output out;
  input [1:0]in;
  input select;
  
  assign out=(select)? in[1] : in[0];
endmodule


module mux8x1(out,in,s);
  output reg out;
  input [7:0]in;
  input [2:0]s;
  
  always@(*)
    begin
      case ({s[2],s[1],s[0]})
        3'b000 : out = in[0];
        3'b001 : out = in[1];
        3'b010 : out = in[2];
        3'b011 : out = in[3];
        3'b100 : out = in[4];
        3'b101 : out = in[5];
        3'b110 : out = in[6];
        3'b111 : out = in[7];
      endcase
    end
endmodule