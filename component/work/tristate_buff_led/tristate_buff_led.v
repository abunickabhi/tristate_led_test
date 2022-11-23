//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Nov 23 13:09:01 2022
// Version: v11.9 SP6 11.9.6.7
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// tristate_buff_led
module tristate_buff_led(
    // Inputs
    clk,
    miso1_in,
    miso2_in,
    mock_miso1,
    mock_miso2,
    rst,
    ss1,
    ss2,
    // Outputs
    miso1,
    miso2,
    miso_probe
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  clk;
input  miso1_in;
input  miso2_in;
input  mock_miso1;
input  mock_miso2;
input  rst;
input  ss1;
input  ss2;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output miso1;
output miso2;
output miso_probe;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   clk /* synthesis syn_keep=1 */;
wire   miso1_net_0;
wire   miso1_in /* synthesis syn_keep=1 */;
wire   miso2_net_0;
wire   miso2_in /* synthesis syn_keep=1 */;
wire   miso_probe_net_0;
wire   mock_miso1;
wire   mock_miso2;
wire   NAND2_0_Y;
wire   NAND2_1_Y;
wire   OR2_0_Y;
wire   rst /* synthesis syn_keep=1 */;
wire   ss1;
wire   ss2;
wire   miso1_net_1;
wire   miso2_net_1;
wire   miso_probe_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign miso1_net_1      = miso1_net_0;
assign miso1            = miso1_net_1;
assign miso2_net_1      = miso2_net_0;
assign miso2            = miso2_net_1;
assign miso_probe_net_1 = miso_probe_net_0;
assign miso_probe       = miso_probe_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------control_signal
control_signal control_signal_inst_0(
        // Inputs
        .rst        ( rst ),
        .clk        ( clk ),
        .miso       ( OR2_0_Y ),
        // Outputs
        .miso_probe ( miso_probe_net_0 ) 
        );

//--------NAND2
NAND2 NAND2_0(
        // Inputs
        .A ( ss1 ),
        .B ( ss1 ),
        // Outputs
        .Y ( NAND2_0_Y ) 
        );

//--------NAND2
NAND2 NAND2_1(
        // Inputs
        .A ( ss2 ),
        .B ( ss2 ),
        // Outputs
        .Y ( NAND2_1_Y ) 
        );

//--------OR2
OR2 OR2_0(
        // Inputs
        .A ( miso1_in ),
        .B ( miso2_in ),
        // Outputs
        .Y ( OR2_0_Y ) 
        );

//--------TRIBUFF
TRIBUFF TRIBUFF_0(
        // Inputs
        .D   ( mock_miso1 ),
        .E   ( NAND2_0_Y ),
        // Outputs
        .PAD ( miso1_net_0 ) 
        );

//--------TRIBUFF
TRIBUFF TRIBUFF_1(
        // Inputs
        .D   ( mock_miso2 ),
        .E   ( NAND2_1_Y ),
        // Outputs
        .PAD ( miso2_net_0 ) 
        );


endmodule
