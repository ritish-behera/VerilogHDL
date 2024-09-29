module hex_to_seg(a_to_f,an,en,clk,speed,rst);
  
  input clk; // synchronous clock
  input rst;
  input en; // enable signal
  input speed; // if speed = 0(low speed counting), if speed = 1(high speed counting)
  output  reg[5:0] a_to_f;
  output [5:0] an;
  reg [3:0] count= 4'b0000;
  wire led;
  
  user_clock c0(clk,led,speed);
  
  assign an = 5'b000000;
  
  // up counting logic
  always @(posedge led) begin
    if(rst)
    count<=4'b0000;
    else begin
    if(en) begin
    if(count==4'b0110)
    count<=4'b0000;
    else
    count<=count+1;
    end
end    
end
  
   
  // 7 segment display truth table
  always@(*) begin
   case (count)
       0: a_to_f = 6'b000001;
       1: a_to_f = 6'b000010;
       2: a_to_f = 6'b000100;
       3: a_to_f = 6'b001000;
       4: a_to_f = 6'b010000;
       5: a_to_f = 6'b100000;
     default: a_to_f = 6'b100000; // '0'
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