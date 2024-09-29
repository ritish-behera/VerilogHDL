module srlatch_tb();
  reg ps,s,r;
  wire ns;
  srlatch dut(ns,ps,s,r);
  initial
    begin 
      ps=0;s=0;r=0;
      #5 ps=0;s=1;r=0;
      #5 ps=0;s=0;r=1;
      #5 ps=0;s=1;r=1;
      #5 ps=1;s=0;r=0;
      #5 ps=1;s=1;r=0;
      #5 ps=1;s=0;r=1;
      #5 ps=1;s=1;r=1;
    end
  initial $monitor($time,"ps=%b,s=%b,r=%b,ns=%b",ps,s,r,ns);
  initial #50 $finish;
endmodule