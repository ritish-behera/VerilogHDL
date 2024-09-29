// Code your testbench here
// or browse Examples
module fsm_moore_tb();
  reg x,rst,clk;
  wire z;
  fsm_moore dut(x,rst,clk,z);
  initial 
    begin
      x=1'b0; clk=1'b0; rst=1'b1;
    end
  always #24 rst=~rst;
  always #5 clk=~clk;
  always #7 x=~x;
  initial $monitor($time," x=%b, clk=%b , rst=%b, z=%b",x,clk,rst,z);
  initial #50 $finish;
endmodule