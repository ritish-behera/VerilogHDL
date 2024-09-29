// Code your design here
module VendingMachine(
  input reg start,cancel,selectSoda,confirm,clk,
  input [2:0] coins,
  output [2:0]outFirst,
  output outSecond);
  
  parameter[2:0] idle=0, countCoins=1, sodaSelect=2, dispense=3, giveChange=4;
  reg [2:0] currentState;
  
  always@ (posedge clk)
    if (!start) currentState= idle ; 
  else begin 
    case (currentState)
      idle 	   : currentState = (cancel) ? idle :((coins) ? countCoins : giveChange) ;
      countCoins : currentState = (cancel) ? idle :((coins >= 3'b010) ? sodaSelect : giveChange) ;
      sodaSelect : currentState = (cancel) ? idle :((selectSoda) ? dispense : sodaSelect) ;
      dispense   : currentState = (cancel) ? idle :((confirm) ? giveChange : dispense) ;
      default    : currentState = idle ;
    endcase
  end
  assign outFirst = (start) ? (cancel == 1'b1 | selectSoda ==1'b0 | coins < 3'b010) ? coins : (coins - 3'b010): 3'bxxx ;
  assign outSecond = ((confirm ==1'b1 && currentState == dispense) ? 1'b1 : 1'b0) ;
endmodule
          