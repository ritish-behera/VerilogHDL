//16x8 Memory Module
module memory(
  input clk,
  input [3:0] addr,
  input [7:0] data_in,
  input we, //write enable
  output reg [7:0] data_out
);
  
  reg [7:0] mem [15:0]; //16x8 memory array
  always @(posedge clk)
    begin
      if (we)
        mem[addr]<=data_in; //write operation
      data_out<=mem[addr]; //read operation
    end
endmodule

  