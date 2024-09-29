// Code your testbench here
// or browse Examples
module circuit3_tb();
  reg [15:0]in;
  reg [3:0]select;
  wire out;
  circuit3 dut(out,in,select);
  initial
    begin
      in=16'b0101010101010101; select=4'b0000;
      #10 select=4'b0111;
      #10 select=4'b1000;
      #10 select=4'b1111;
    end
  initial $monitor($time," in=%b, select=%b; out=%b",in,select,out);
  initial #50 $finish;
endmodule
      
      