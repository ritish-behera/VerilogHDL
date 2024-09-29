module PriorityEncoder(input wire [3:0]A, output reg [2:0]p);
  
  always@(*)
    casez(A)
      4'b1zzz : p=3'b100;
      4'b01zz : p=3'b011;
      4'b001z : p=3'b010;
      4'b0001 : p=3'b001;
      4'b0000 : p=3'b000;
    endcase
  
endmodule