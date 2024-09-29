module srlatch(ns,ps,s,r);
  input ps,s,r;
  output reg ns;
  always@ (*)
    begin
  		if (s==1'b1 && r==1'b1)
    		assign ns=1'bx;
  		else
          assign ns=s | ((~r) & ps);
    end
endmodule