module hex_to_seg(a_to_g,an,dp,en,rst,clk,speed,mode);
  
  input clk; // synchronous clock
  input rst; // active high synchronous reset signal
  input en; // enable signal
  input speed; // if speed = 0(low speed counting), if speed = 1(high speed counting)
  input mode; // for up counter mode = 0, for down counter mode = 1
  output  reg[6:0] a_to_g;
  output [7:0] an;
  output dp;
  reg [3:0] count;
  wire led;
  
  user_clock c0(clk,led,speed);
  
  assign an = 8'b00000000;
  assign dp = 1'b1;
  
  // up counting logic
  always @(posedge led) begin
    if (rst) begin
      if (mode) count <= 4'b1111;
      else count <= 4'b0000;
    end
    
    else begin
      if (en) begin
        if(mode) count <= count - 1;
        else count <= count + 1;
      end
    end
  end
   
  // 7 segment display truth table
  always@(*) begin
   case (count)
       0: a_to_g = 7'b0000001;
       1: a_to_g = 7'b1001111;
       2: a_to_g = 7'b0010010;
       3: a_to_g = 7'b0000110;
       4: a_to_g = 7'b1001100;
       5: a_to_g = 7'b0100100;
       6: a_to_g = 7'b0100000;
       7: a_to_g = 7'b0001111;
       8: a_to_g = 7'b0000000;
       9: a_to_g = 7'b0000100;
     'hA: a_to_g = 7'b0001000;
     'hB: a_to_g = 7'b1100000;
     'hC: a_to_g = 7'b0110001;
     'hD: a_to_g = 7'b1000010;
     'hE: a_to_g = 7'b0110000;
     'hF: a_to_g = 7'b0111000;
     default: a_to_g = 7'b0000001; // '0'
   endcase
  end
  
endmodule

// module for fpga clock
module user_clock(clk,led,speed);
  
  input speed;
  input clk;
  output led;
  
  reg clk_out = 0;
  reg [25:0] count = 0;
  
  always @(posedge clk)
 begin
    count <= count + 1;
    if (speed) begin
      if (count == 20000000) begin
      count <= 0;
      clk_out <= ~clk_out;
      end
    end
    else begin
      if (count == 67000000) begin
      count <= 0;
      clk_out <= ~clk_out;
      end
    end
  end
  
  assign led = clk_out;
endmodule
