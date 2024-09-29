// Code your testbench here
// or browse Examples
module ripplecounter_tb();
  reg clk,clear;
  wire [3:0]q;
  rippleCounter dut(q,clk,clear);
  //always #10 clk=~clk;
  //always #5 clear=~clear;
  initial
    begin
      clk=1;clear=0;
    end
  initial $monitor($time,"clk=%b,clear=%b,q=%b", clk,clear,q);
  initial #50 $finish;
endmodule
      