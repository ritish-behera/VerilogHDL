// Code your design here
module multiplier4bit(p,x,y);
  input [3:0]x,y;
  output [7:0]p;
  assign p=x*y;
endmodule