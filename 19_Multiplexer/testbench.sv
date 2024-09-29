module multiplier_tb();
  reg [3:0]x,y;
  wire [7:0]p;
  multiplier4bit dut(p,x,y);
  initial
    begin
      x=4'h1;y=4'h1;
      #5 x=4'h2;y=4'h2;
      #5 x=4'h3;y=4'h3;
    end
  initial $monitor($time,"x=%h,y=%h,p=%h",x,y,p);
  initial #30 $finish;
endmodule