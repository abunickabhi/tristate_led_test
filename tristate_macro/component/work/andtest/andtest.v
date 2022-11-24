//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Jul 22 10:20:02 2022
// Version: v11.9 SP6 11.9.6.7
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// andtest
module andtest(
    // Inputs
    clk,
    reset,
    // Outputs
    a,
    b,
    y
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  clk;
input  reset;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output a;
output b;
output y;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   a_net_0;
wire   b_net_0;
wire   clk;
wire   CLKINT_0_Y;
wire   CLKINT_1_Y;
wire   reset;
wire   y_net_0;
wire   a_net_1;
wire   b_net_1;
wire   y_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign a_net_1 = a_net_0;
assign a       = a_net_1;
assign b_net_1 = b_net_0;
assign b       = b_net_1;
assign y_net_1 = y_net_0;
assign y       = y_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------andgate
andgate andgate_0(
        // Inputs
        .clk   ( CLKINT_0_Y ),
        .reset ( CLKINT_1_Y ),
        // Outputs
        .a     ( a_net_0 ),
        .b     ( b_net_0 ),
        .y     ( y_net_0 ) 
        );

//--------CLKINT
CLKINT CLKINT_0(
        // Inputs
        .A ( clk ),
        // Outputs
        .Y ( CLKINT_0_Y ) 
        );

//--------CLKINT
CLKINT CLKINT_1(
        // Inputs
        .A ( reset ),
        // Outputs
        .Y ( CLKINT_1_Y ) 
        );


endmodule
