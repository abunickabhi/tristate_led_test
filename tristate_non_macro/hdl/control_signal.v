///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: IITB
//
// File: and_gate.v
// Targeted device: <Family::ProASIC3E> <Die::A3PE1500> <Package::208 PQFP>
// Author: Abhijeet
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

module control_signal (rst,clk,miso,miso_probe
);

input miso;
input clk;
input rst;

output reg miso_probe;  
// inout io_data; //port declaration of bidirectional data line
 
// assign miso = Tx_En ? Tx_Data : 1'bZ;
// assign miso_probe = miso;

always @*
miso_probe <= miso;

endmodule

