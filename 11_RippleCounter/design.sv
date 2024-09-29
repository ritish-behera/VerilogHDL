// Code your design here
module rippleCounter(q,clk,clear);
  input clk,clear;
  output reg [3:0]q;
  reg t;
  t_ff dut1(q[0],t,clk,clear);
  t_ff dut2(q[1],t,q[0],clear);
  t_ff dut3(q[2],t,q[1],clear);
  t_ff dut4(q[3],t,q[2],clear);
  
  always @(posedge clk or negedge clear)
    begin
        if (~clear)
            t <= 4'b0000;
        else
            t <= 1'b1;
    end
endmodule

//code for T flipflop
module t_ff(q,t,clk,clear);
  input t,clk,clear;
  output reg q;
  always @(posedge clk or negedge clear)
    begin
      if (~clear)
        q<=1'b0;
      else if (t)
        q<=~q;
    end
endmodule