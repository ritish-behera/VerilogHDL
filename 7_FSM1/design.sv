// Code your design here
module fsm_mealy(input x,rst,clk, output z);
  parameter [1:0] s1=0, s2=1, s3=2, s4=3 ;
  reg [1:0]current;
  always@(posedge clk)
    if (rst) current=s1;
  else case(current)
    s1 : current = x ? s2 : s1 ;
    s2 : current = x ? s3 : s1 ;
    s3 : current = x ? s4 : s1 ;
    s4 : current = x ? s4 : s1 ;
    default : current = s1 ;
  endcase
  assign z = (current==s4 && x==1'b1) ? 1'b1 : 1'b0 ;
endmodule