// Code your testbench here
// or browse Examples
module circuit2_tb();
  reg [4:0]A;
  reg enable;
  wire [31:0]D;
  circuit2 dut(D,A,enable);
  initial 
    begin
      enable = 1;
      A = 5'b00000;
      #10;
    end
  initial
    begin
      A=5'b00000; enable=1'b0;
      #10 A=5'b00000; enable=1'b1;
      #10 A=5'b01000; enable=1'b1;
      #10 A=5'b10000; enable=1'b1;
      #10 A=5'b11000; enable=1'b1;
    end
  initial $monitor($time," A=%b, enable=%b, D=%b",A,enable,D);
  initial #50 $finish;
endmodule
      
      