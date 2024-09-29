// Code your design here
module circuit1(out,A,B,mode);
  output [3:0]out;
  input [3:0]A,B;
  input mode;
  reg [3:0]out1,out2;
  
  complement9 g1(out1,B);
  mux2x1 g2(out2,out1,B,mode);
  BCDadder g3(out,out2,A,mode);
endmodule

module complement9(out,in);
  input [3:0]in;
  output [3:0]out;
  wire complement1,complement2;
  assign complement1=~in;
  assign complement2=complement1 + 4'b0001;
  assign out=complement2 + 4'b1001;
endmodule


module mux2x1(out,in1,in2,select);
  output [3:0]out;
  input [3:0]in1,in2;
  input select;
  assign out = (select)? in1 : in2 ;
endmodule


module BCDadder(out,in1,in2,cin);
  output [3:0]out;
  input [3:0]in1,in2;
  input cin;
  wire [4:0]dummy_out;
  assign dummy_out=in1 + in2 + cin;
  assign out=(dummy_out<=5'b01001)?(dummy_out):(dummy_out+5'b00110);
endmodule