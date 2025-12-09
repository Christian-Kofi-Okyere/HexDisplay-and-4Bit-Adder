# Hex Display and 4 Bit Adder

Brief description

This repository contains VHDL source files and Block Diagram Files (BDF). The project implements two small HDL tasks used in the course:

- task1: A seven-segment hex display system (and a testbench) using a 4-bit input -> 7-seg decoder and an Altera LPM counter component for scanning.
- task2: A simple 4-bit adder (two 4-bit unsigned inputs producing a 5-bit sum).

Repository structure

- task1/
  - `hexdisplay.vhd` — 4-bit to 7-segment decoder (maps input nibble to 7 outputs).
  - `hexdisplayTest.vhd` — simple testbench for `hexdisplay`.
  - `lpm_counter0.vhd` — Altera/Quartus-generated LPM_COUNTER megafunction (32-bit up counter) used by the block design.
  - `task1display.bdf` — Quartus Block Diagram file integrating `hexdisplay` and the counter for multiplexed display.

- task2/
  - `task2.vhd` — Adds two 4-bit unsigned numbers and outputs a 5-bit sum.
  - `task2display.bdf` — Block Diagram file for the adder design.

How to simulate

(Using ModelSim / Questa or another VHDL simulator that supports VHDL-93/2008 features present in these files.)

1. Compile the VHDL sources (example, from a terminal where ModelSim is available):

```bash
vcom -2008 task1/hexdisplay.vhd
vcom -2008 task1/hexdisplayTest.vhd
# If using the lpm megafunction, you may need to compile the lpm library or use the vendor simulation libraries
```

2. Run the testbench in the simulator:

```bash
vsim work.hexdisplayTest
run 500 ns
# view waveforms or console outputs as needed
```

For `task2`, create a small testbench or instantiate `task2` in your own test harness and repeat the compile+vsim steps.

How to synthesize / program (Quartus Prime)

1. Open Quartus and create a new project.
2. Add the `.vhd` and `.bdf` files and set the top-level file (for an FPGA target, choose the `*.bdf` top-level block diagram if you built one in the Block Editor).
3. If the project uses the `lpm` megafunction, ensure the Altera/Intel device family is selected and the megafunction libraries are available in Quartus (the wizard-generated file `lpm_counter0.vhd` is already present).
4. Compile, assign pins, and program the target device as usual in Quartus.

Notes and assumptions

- These files were authored in Quartus (Altera / Intel FPGA tools) and include the Altera `lpm` component; simulation of megafunctions may require vendor simulation libraries.
- The BDF files are Quartus Block Diagram Files — do not edit them with a text editor if you intend to continue editing them in the Quartus Block Editor (they can be large and are best handled inside the tool).
