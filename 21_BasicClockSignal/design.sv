// Code your design here
module always_clock();
  reg clock;
  initial
    clock =1'b0;
  always 
    #10 clock = ~clock;
  initial 
    #500 $finish;
endmodule
