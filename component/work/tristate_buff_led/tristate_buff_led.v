//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue Nov 22 18:34:15 2022
// Version: v11.9 SP6 11.9.6.7
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// tristate_buff_led
module tristate_buff_led(
    // Inputs
    dip1,
    dip2,
    miso1_in,
    miso2_in,
    // Outputs
    miso1,
    miso2
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  dip1;
input  dip2;
input  miso1_in;
input  miso2_in;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output miso1;
output miso2;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   control_signal_0_ss1;
wire   control_signal_0_ss2;
wire   dip1;
wire   dip2;
wire   miso1_net_0;
wire   miso1_in;
wire   miso2_net_0;
wire   miso2_in;
wire   NAND2_0_Y;
wire   NAND2_1_Y;
wire   OR2_0_Y;
wire   miso1_net_1;
wire   miso2_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign miso1_net_1 = miso1_net_0;
assign miso1       = miso1_net_1;
assign miso2_net_1 = miso2_net_0;
assign miso2       = miso2_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------control_signal
control_signal control_signal_inst_0(
        // Inputs
        .miso ( OR2_0_Y ),
        // Outputs
        .ss1  ( control_signal_0_ss1 ),
        .ss2  ( control_signal_0_ss2 ) 
        );

//--------NAND2
NAND2 NAND2_0(
        // Inputs
        .A ( dip1 ),
        .B ( dip1 ),
        // Outputs
        .Y ( NAND2_0_Y ) 
        );

//--------NAND2
NAND2 NAND2_1(
        // Inputs
        .A ( dip2 ),
        .B ( dip2 ),
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
        .D   ( NAND2_0_Y ),
        .E   ( control_signal_0_ss1 ),
        // Outputs
        .PAD ( miso1_net_0 ) 
        );

//--------TRIBUFF
TRIBUFF TRIBUFF_1(
        // Inputs
        .D   ( NAND2_1_Y ),
        .E   ( control_signal_0_ss2 ),
        // Outputs
        .PAD ( miso2_net_0 ) 
        );


endmodule
