// Code your testbench here
// or browse Examples
module fsm_mealy_tb();
  reg x,rst,clk;
  wire z;
  fsm_mealy dut(x,rst,clk,z);
  always #5 clk= ~clk;
  initial 
    begin
      x=1'b1; clk=1'b0; rst=1'b0;
      #10 x=1'b0;  rst=1'b0;
      #10 x=1'b1;  rst=1'b0;
      #10 x=1'b1;  rst=1'b0;
      #10 x=1'b1;  rst=1'b0;
      #10 x=1'b1;  rst=1'b0;
      #10 x=1'b0;  rst=1'b0;
      #10 x=1'b1;  rst=1'b1;
    end
  initial $monitor($time," x=%b, clk=%b , rst=%b, z=%b",x,clk,rst,z);
  initial #100 $finish;
endmodule