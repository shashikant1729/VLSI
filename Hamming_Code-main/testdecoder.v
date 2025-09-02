// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module testdecoder;
  reg [6:0] enc_ham_data;
  wire [2:0]pos_error;
  wire error; 
  wire [3:0]data;
  

ham_decoder DUT (data,enc_ham_data,pos_error,error);
  
  initial begin   
    #2 enc_ham_data=7'b1010101;
                             
    #2 $display("output----data=%b, --pos_error=%d,--error=%b",   data,pos_error,error);
    
    #50 $stop; 
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,testdecoder);
  end
  
endmodule
