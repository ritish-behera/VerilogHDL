// Code your testbench here
// or browse Examples
module circuit6_tb();
  reg clk,clear;
  reg [3:0]I;
  wire [3:0]A;
  
  circuit6 dut(A,I,clk,clear);
  
  initial clk=1'b0;
  always #5 clk=~clk;
  initial
    begin
      I=4'b0000; clear=1'b1;
      #20 I=4'b1111; clear=1'b1;
      #20I=4'b1111; clear=1'b0;
    end
  initial $monitor($time," I=%b, clk=%b, clear=%b, A=%b",I,clk,clear,A);
  initial #65 $finish;
endmodule