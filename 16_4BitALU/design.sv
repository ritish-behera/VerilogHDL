module ALU4Bit (input [3:0]a,[3:0]b,[2:0]s, output reg [7:0]y);
  always@(a,b,s)
    begin
      case (s)
        3'b000 : y=a+b;
        3'b001 : y=a-b;
        3'b010 : y=a&b;
        3'b011 : y=a|b;
        3'b100 : y=4'b1111^a;
        3'b101 : y=(4'b1111^a)+1'b1;
        3'b110 : y=a^b;
        3'b111 : y=a*b;
      endcase
    end
  
endmodule
        