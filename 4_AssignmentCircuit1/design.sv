module circuit6(A,I,clk,clear);
  output reg [3:0]A;
  input [3:0]I;
  input clk,clear;
  
  d_ff g1(A[0],I[0],clk,clear);
  d_ff g2(A[1],I[1],clk,clear);
  d_ff g3(A[2],I[2],clk,clear);
  d_ff g4(A[3],I[3],clk,clear);
  
endmodule


module d_ff(q,d,clk,reset);
  output reg q;
  input d,clk,reset;
  
  always @(posedge clk or posedge reset) begin
    if (!reset)
      q <= 1'b0;
    else
      q <= d;
  end
endmodule
  