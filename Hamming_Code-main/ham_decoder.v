// Code your design here
`timescale 1ns/1ps
module ham_decoder(data,enc_ham_data,pos_error,error);
  input [6:0]enc_ham_data;
  output [3:0] data;
  output [2:0]pos_error;
  output error;
  wire c1,c2,c3;
    
  assign data[0]=enc_ham_data[2];
  assign data[1]=enc_ham_data[4];
  assign data[2]=enc_ham_data[5];
  assign data[3]=enc_ham_data[6];
    
  assign c1=enc_ham_data[0] ^ enc_ham_data[2] ^
    enc_ham_data[4] ^ enc_ham_data[6];
  assign c2=enc_ham_data[1] ^ enc_ham_data[2] ^
    enc_ham_data[5] ^ enc_ham_data[6];
  assign c3=enc_ham_data[3] ^ enc_ham_data[4] ^ 
    enc_ham_data[5] ^ enc_ham_data[6];
  
  assign pos_error={c3,c2,c1};//position of error, 
  								//0=> no error
  assign error = c3 |c2 | c1;//or (any '1'=>error=1)
  
 endmodule
  
  
