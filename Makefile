# SPDX-FileCopyrightText: © 2021 Uri Shaked <uri@wokwi.com>
# SPDX-License-Identifier: MIT

export COCOTB_REDUCED_LOG_FMT=1
export LIBPYTHON_LOC=$(shell cocotb-config --libpython)

GENERATED_SOURCES= src/grid_32x32.v

all: generate test_silife test_silife_multi

generate: $(GENERATED_SOURCES)

src/grid_32x32.v: src/gen_grid.py
	python $< > $@
	verible-verilog-format --inplace $@

test_cell:
	iverilog -g2005 -I src -o cell_tb.out test/cell_tb.v src/cell.v
	./cell_tb.out
	gtkwave cell_tb.vcd test/cell_tb.gtkw

test_grid: src/grid_32x32.v
	iverilog -g2005 -I src -o grid_tb.out test/grid_tb.v src/grid_32x32.v src/cell.v
	./grid_tb.out
	gtkwave grid_tb.vcd test/grid_tb.gtkw

test_scan:
	iverilog -g2005 -I src -o scan_tb.out test/scan_tb.v src/scan.v
	./scan_tb.out
	gtkwave scan_tb.vcd test/scan_tb.gtkw

test_max7219:
	iverilog -g2005 -I src -o max7219_tb.out test/max7219_tb.v src/max7219.v src/spi_master.v
	./max7219_tb.out
	python test/vcd_to_pulseview.py > max7219_tb_pv.vcd
	python test/vcd_to_cpp.py max7219_tb.vcd > max7219_vcd_values.h
	gtkwave max7219_tb.vcd test/max7219_tb.gtkw

test_silife:
	iverilog -I src -s silife -s dump -o silife_test.out test/dump_silife.v src/silife.v src/buf_reg.v src/cell.v src/grid_32x32.v src/grid_loader.v src/grid_sync.v src/grid_sync_edge.v src/grid_wishbone.v src/max7219.v src/spi_master.v src/trng.v src/grid_trng_loader.v
	MODULE=test.test_silife vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus ./silife_test.out

test_silife_show: test_silife
	gtkwave silife_test.vcd test/silife_test.gtkw

test_silife_multi:
	iverilog -I src -s silife_multi -s dump -o silife_test_multi.out test/dump_silife_multi.v test/silife_multi.v src/silife.v src/buf_reg.v src/cell.v src/grid_32x32.v src/grid_loader.v src/grid_sync.v src/grid_sync_edge.v src/grid_wishbone.v src/max7219.v src/spi_master.v src/trng.v src/grid_trng_loader.v
	MODULE=test.test_silife_multi vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus ./silife_test_multi.out

test_silife_multi_show: test_silife_multi
	gtkwave silife_test_multi.vcd test/silife_test_multi.gtkw

format:
	verible-verilog-format --inplace src/*.v test/*.v
