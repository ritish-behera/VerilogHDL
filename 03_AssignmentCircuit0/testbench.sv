// Code your testbench here
// or browse Examples
module circuit1_tb();
  reg [3:0]A,B;
  reg mode;
  wire [3:0]out;
  circuit1 dut(out,A,B,mode);
  initial
    begin
      A=4'h5; B=4'h4; mode=1'b1;
      #10 A=4'h5; B=4'h4; mode=1'b0;
    end
  initial $monitor ($time,"A=%h, B=%h, mode=%b, out=%h",A,B,mode,out);
  initial #20 $finish;
endmodule
      