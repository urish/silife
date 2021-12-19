// SPDX-FileCopyrightText: © 2021 Uri Shaked <uri@wokwi.com>
// SPDX-License-Identifier: MIT

/* DO NOT EDIT - this is an auto-generated file. */
/* generated by gen_highorder_matrix.py */

module silife_matrix_32x32 (
    input wire reset,
    input wire clk,
    input wire enable,

    /* Matrix interconnect */
    input wire [31:0] i_n,
    input wire [31:0] i_e,
    input wire [31:0] i_s,
    input wire [31:0] i_w,
    input wire i_ne,
    input wire i_se,
    input wire i_sw,
    input wire i_nw,
    output wire [31:0] o_n,
    output wire [31:0] o_w,
    output wire [31:0] o_s,
    output wire [31:0] o_e,

    /* First port: read/write */
    input  wire [4:0] row_select,
    input  wire [31:0] clear_cells,
    input  wire [31:0] set_cells,
    output wire [31:0] cells,

    /* Second port: read only */
    input  wire [4:0] row_select2,
    output wire [31:0] cells2
);

  wire selected_y = row_select[4];
  assign cells = selected_y ? {cells_1_1, cells_1_0} : {cells_0_1, cells_0_0};
  assign cells2 = row_select2[4] ? {cells2_1_1, cells2_1_0} : {cells2_0_1, cells2_0_0};

  assign o_n = {n_0_0, n_0_1};
  assign o_e = {e_0_1, e_0_1};
  assign o_s = {s_1_0, s_1_1};
  assign o_w = {w_0_0, w_1_0};

  wire [1023:0] cell_values = {
    submatrix_1_1.cell_values[255:240],
    submatrix_1_0.cell_values[255:240],
    submatrix_1_1.cell_values[239:224],
    submatrix_1_0.cell_values[239:224],
    submatrix_1_1.cell_values[223:208],
    submatrix_1_0.cell_values[223:208],
    submatrix_1_1.cell_values[207:192],
    submatrix_1_0.cell_values[207:192],
    submatrix_1_1.cell_values[191:176],
    submatrix_1_0.cell_values[191:176],
    submatrix_1_1.cell_values[175:160],
    submatrix_1_0.cell_values[175:160],
    submatrix_1_1.cell_values[159:144],
    submatrix_1_0.cell_values[159:144],
    submatrix_1_1.cell_values[143:128],
    submatrix_1_0.cell_values[143:128],
    submatrix_1_1.cell_values[127:112],
    submatrix_1_0.cell_values[127:112],
    submatrix_1_1.cell_values[111:96],
    submatrix_1_0.cell_values[111:96],
    submatrix_1_1.cell_values[95:80],
    submatrix_1_0.cell_values[95:80],
    submatrix_1_1.cell_values[79:64],
    submatrix_1_0.cell_values[79:64],
    submatrix_1_1.cell_values[63:48],
    submatrix_1_0.cell_values[63:48],
    submatrix_1_1.cell_values[47:32],
    submatrix_1_0.cell_values[47:32],
    submatrix_1_1.cell_values[31:16],
    submatrix_1_0.cell_values[31:16],
    submatrix_1_1.cell_values[15:0],
    submatrix_1_0.cell_values[15:0],
    submatrix_0_1.cell_values[255:240],
    submatrix_0_0.cell_values[255:240],
    submatrix_0_1.cell_values[239:224],
    submatrix_0_0.cell_values[239:224],
    submatrix_0_1.cell_values[223:208],
    submatrix_0_0.cell_values[223:208],
    submatrix_0_1.cell_values[207:192],
    submatrix_0_0.cell_values[207:192],
    submatrix_0_1.cell_values[191:176],
    submatrix_0_0.cell_values[191:176],
    submatrix_0_1.cell_values[175:160],
    submatrix_0_0.cell_values[175:160],
    submatrix_0_1.cell_values[159:144],
    submatrix_0_0.cell_values[159:144],
    submatrix_0_1.cell_values[143:128],
    submatrix_0_0.cell_values[143:128],
    submatrix_0_1.cell_values[127:112],
    submatrix_0_0.cell_values[127:112],
    submatrix_0_1.cell_values[111:96],
    submatrix_0_0.cell_values[111:96],
    submatrix_0_1.cell_values[95:80],
    submatrix_0_0.cell_values[95:80],
    submatrix_0_1.cell_values[79:64],
    submatrix_0_0.cell_values[79:64],
    submatrix_0_1.cell_values[63:48],
    submatrix_0_0.cell_values[63:48],
    submatrix_0_1.cell_values[47:32],
    submatrix_0_0.cell_values[47:32],
    submatrix_0_1.cell_values[31:16],
    submatrix_0_0.cell_values[31:16],
    submatrix_0_1.cell_values[15:0],
    submatrix_0_0.cell_values[15:0]
  };

  wire [15:0] n_0_0;
  wire [15:0] e_0_0;
  wire [15:0] s_0_0;
  wire [15:0] w_0_0;
  wire [15:0] cells_0_0;
  wire [15:0] cells2_0_0;

  silife_matrix_16x16 submatrix_0_0 (
      .reset (reset),
      .clk   (clk),
      .enable(enable),

      .i_nw(i_nw),
      .i_n (i_n[15:0]),
      .i_ne(i_w[1]),
      .i_e (w_0_1),
      .i_se(n_1_1[0]),
      .i_s (n_1_0),
      .i_sw(i_n[1]),
      .i_w (i_w[15:0]),

      .o_n(n_0_0),
      .o_e(e_0_0),
      .o_s(s_0_0),
      .o_w(w_0_0),

      .row_select(row_select[3:0]),
      .clear_cells(selected_y == 1'b0 ? clear_cells[15:0] : 16'b0),
      .set_cells(selected_y == 1'b0 ? set_cells[15:0] : 16'b0),
      .cells(cells_0_0),

      .row_select2(row_select2[3:0]),
      .cells2(cells2_0_0)
  );


  wire [15:0] n_0_1;
  wire [15:0] e_0_1;
  wire [15:0] s_0_1;
  wire [15:0] w_0_1;
  wire [15:0] cells_0_1;
  wire [15:0] cells2_0_1;

  silife_matrix_16x16 submatrix_0_1 (
      .reset (reset),
      .clk   (clk),
      .enable(enable),

      .i_nw(i_n[15]),
      .i_n (i_n[31:16]),
      .i_ne(n_1_0[15]),
      .i_e (i_e[15:0]),
      .i_se(i_e[1]),
      .i_s (n_1_1),
      .i_sw(i_ne),
      .i_w (e_0_0),

      .o_n(n_0_1),
      .o_e(e_0_1),
      .o_s(s_0_1),
      .o_w(w_0_1),

      .row_select(row_select[3:0]),
      .clear_cells(selected_y == 1'b0 ? clear_cells[31:16] : 16'b0),
      .set_cells(selected_y == 1'b0 ? set_cells[31:16] : 16'b0),
      .cells(cells_0_1),

      .row_select2(row_select2[3:0]),
      .cells2(cells2_0_1)
  );


  wire [15:0] n_1_0;
  wire [15:0] e_1_0;
  wire [15:0] s_1_0;
  wire [15:0] w_1_0;
  wire [15:0] cells_1_0;
  wire [15:0] cells2_1_0;

  silife_matrix_16x16 submatrix_1_0 (
      .reset (reset),
      .clk   (clk),
      .enable(enable),

      .i_nw(i_w[15]),
      .i_n (s_0_0),
      .i_ne(i_sw),
      .i_e (w_1_1),
      .i_se(i_s[1]),
      .i_s (i_s[15:0]),
      .i_sw(s_0_1[0]),
      .i_w (i_w[31:16]),

      .o_n(n_1_0),
      .o_e(e_1_0),
      .o_s(s_1_0),
      .o_w(w_1_0),

      .row_select(row_select[3:0]),
      .clear_cells(selected_y == 1'b1 ? clear_cells[15:0] : 16'b0),
      .set_cells(selected_y == 1'b1 ? set_cells[15:0] : 16'b0),
      .cells(cells_1_0),

      .row_select2(row_select2[3:0]),
      .cells2(cells2_1_0)
  );


  wire [15:0] n_1_1;
  wire [15:0] e_1_1;
  wire [15:0] s_1_1;
  wire [15:0] w_1_1;
  wire [15:0] cells_1_1;
  wire [15:0] cells2_1_1;

  silife_matrix_16x16 submatrix_1_1 (
      .reset (reset),
      .clk   (clk),
      .enable(enable),

      .i_nw(s_0_0[15]),
      .i_n (s_0_1),
      .i_ne(i_s[15]),
      .i_e (i_e[31:16]),
      .i_se(i_se),
      .i_s (i_s[31:16]),
      .i_sw(i_e[15]),
      .i_w (e_1_0),

      .o_n(n_1_1),
      .o_e(e_1_1),
      .o_s(s_1_1),
      .o_w(w_1_1),

      .row_select(row_select[3:0]),
      .clear_cells(selected_y == 1'b1 ? clear_cells[31:16] : 16'b0),
      .set_cells(selected_y == 1'b1 ? set_cells[31:16] : 16'b0),
      .cells(cells_1_1),

      .row_select2(row_select2[3:0]),
      .cells2(cells2_1_1)
  );



endmodule
