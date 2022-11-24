//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Nov 24 10:43:41 2022
// Version: v11.9 SP6 11.9.6.7
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// tristate_buff_led
module tristate_buff_led(
    // Inputs
    clk,
    miso1_in,
    mock_miso1,
    rst,
    ss1,
    // Outputs
    miso1,
    miso_probe
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  clk;
input  miso1_in;
input  mock_miso1;
input  rst;
input  ss1;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output miso1;
output miso_probe;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   clk;
wire   INV_0_Y;
wire   miso1_net_0;
wire   miso1_in;
wire   miso_probe_net_0;
wire   mock_miso1;
wire   rst;
wire   ss1;
wire   miso1_net_1;
wire   miso_probe_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign miso1_net_1      = miso1_net_0;
assign miso1            = miso1_net_1;
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
        .miso       ( miso1_in ),
        // Outputs
        .miso_probe ( miso_probe_net_0 ) 
        );

//--------INV
INV INV_0(
        // Inputs
        .A ( ss1 ),
        // Outputs
        .Y ( INV_0_Y ) 
        );

//--------TRIBUFF_LVCMOS33
TRIBUFF_LVCMOS33 TRIBUFF_LVCMOS33_0(
        // Inputs
        .D   ( mock_miso1 ),
        .E   ( INV_0_Y ),
        // Outputs
        .PAD ( miso1_net_0 ) 
        );


endmodule
