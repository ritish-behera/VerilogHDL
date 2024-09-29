// Code your design here
module comparator(input [3:0] A, B,
                  output equal,less_than, greater_than);
  
    assign equal = (A == B);
    assign less_than = (A < B);
    assign greater_than = (A > B);
  
endmodule
