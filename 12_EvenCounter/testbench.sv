// Code your testbench here
//or browse Examples

module EvenCounter_tb();
  reg clk,reset;
  wire [2:0]count;
  EvenCounter dut(count,clk,reset);
  
  always #5 clk=~clk;
  initial
    begin
      clk =1'b1; reset =1'b0;
      #80 reset=~reset;
    end
  initial $monitor($time," clk=%b, reset=%b, count=%h",clk,reset,count);
  initial #100 $finish;
endmodule
