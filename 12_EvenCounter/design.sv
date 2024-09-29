// Code your design here

module EvenCounter(output reg [2:0]count, input clk, reset);
  initial count=3'b000;
  always @(posedge clk or negedge clk)
  begin
    if (reset) 
    count=3'b000;
  else 
    count=count + 3'b010 ;
  end
endmodule
