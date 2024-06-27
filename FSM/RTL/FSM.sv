// Copyright (c) 2024 Sungkyunkwan University
//
// Authors:
// - Sanghyun Park <psh2018314072@gmail.com>


module FSM
(
    input   wire                    clk,
    input   wire                    rst_n,

    input   wire                    start_i,
    output  wire                    done_o
);
    assign done_o           = 1'b0;
endmodule