///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: IITB
//
// File: and_gate.v
// Targeted device: <Family::ProASIC3E> <Die::A3PE1500> <Package::208 PQFP>
// Author: Abhijeet
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

module control_signal (rst,clk,miso,miso_probe
//ss1,ss2
);

input miso;
input clk;
input rst;

output reg miso_probe;  
// input ss1;
// input ss2;


always @*
miso_probe <= miso;

endmodule

