// Code your design here
module fsm_moore(input x,rst,clk, output z);
  parameter [1:0] a=0,b=1,c=2,d=3;
  reg [1:0]current;
  always@(posedge clk)
    if (rst) current=a;
  else case(current)
    a : current = x ? c : b ;
    b : current = x ? d : c ;
    c : current = x ? d : b ;
    d : current = x ? a : c ;
    default : current = a ;
  endcase
  assign z = (current==d) ? 1'b1 : 1'b0 ;
endmodule