// Code your testbench here
// or browse Examples
module VendingMachine_tb();
  reg start,cancel,selectSoda,confirm,clk;
  reg [2:0] coins;
  wire [2:0] outFirst;
  wire outSecond;
  
  VendingMachine dut(start,cancel,selectSoda,confirm,clk,coins,outFirst,outSecond);
  always #5 clk=~clk;
  initial
    begin
      start=1'b1;
      cancel=1'b0;
      coins=3'b010;
      selectSoda=1'b1;
      confirm=1'b1;
      clk=1'b1;
    end
  initial 
    begin
      $monitor("SodaSelected=%b, coins=%d, Returned=%d, Dispensed=%b",selectSoda,coins,outFirst,outSecond);
      #40
      $display("Thank you for using the vending machine!");
      $finish;
    end
endmodule