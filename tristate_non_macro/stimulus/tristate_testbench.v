///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: IITB
//
// File: tristate_testbench.v
// Targeted device: <Family::ProASIC3E> <Die::A3PE1500> <Package::208 PQFP>
// Author:Abhi
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

`timescale 1ns/100ps

module tristate_testbench;
wire dip1;
wire dip2;
wire miso1_in;
wire miso2_in;
wire miso1;
wire miso2;

parameter SYSCLK_PERIOD = 25;

reg SYSCLK;
reg NSYSRESET;

initial
begin
    SYSCLK = 1'b0;
    NSYSRESET = 1'b1;
end

//////////////////////////////////////////////////////////////////////
// Reset Pulse
//////////////////////////////////////////////////////////////////////
initial
begin
    #(SYSCLK_PERIOD * 10 )
        NSYSRESET = 1'b0;
end


//////////////////////////////////////////////////////////////////////
// Clock Driver
//////////////////////////////////////////////////////////////////////
always @(SYSCLK)
    #(SYSCLK_PERIOD / 2.0) SYSCLK <= !SYSCLK;


tristate_buff_led tristate_buff_led_0 (
    // Inputs
    .dip1({1{1'b0}}),
    .dip2({1{1'b0}}),
    .miso1_in({1{1'b0}}),
    .miso2_in({1{1'b0}}),

    // Outputs
    .miso1( ),
    .miso2( )

    // Inouts

);

endmodule

