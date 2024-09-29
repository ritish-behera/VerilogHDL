//Linear Testbench
module memory_tb();
  reg clk;
  reg [3:0] addr;
  reg [7:0] data_in;
  reg we;
  wire [7:0] data_out;
  
  memory dut (
    .clk(clk),
    .addr(addr),
    .data_in(data_in),
    .we(we),
    .data_out(data_out)
  );
  
  initial
    begin
      clk=1'b0;
      forever #5 clk = ~clk; //10ns clock period
    end
  
  initial	//Initialize memory with known values
    begin 
      $display("Initializing memory...");
      we = 1'b1; //Write Mode
      for (int i =0; i < 16; i++)
        begin
          addr = i;
          data_in = i * 8; //Example data value
          @(posedge clk);
        end
      
      
	//Read and verify memory contents
	$display("Verifying memory contents...");
    we = 1'b0;	//Read mode
      for (int i=0; i < 16; i++)
        begin
          addr = i;
          @(posedge clk);
          if (data_out !== i*8)
            $display("Error: Expected %0h at address %0h, got %0h", i* 8, i, data_out);
          else
            $display("Data at address %0h: %0h", i, data_out);
        end
      
      $display("Testbench completed successfully");
      $finish;
    end
endmodule