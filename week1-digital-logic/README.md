# Week 1 — Digital Logic & Verilog Basics

## Topics Covered
- Boolean Algebra & Logic Gates
- K-Map Simplification
- Combinational Circuits (MUX, Decoder, Encoder)
- Arithmetic Circuits (Half Adder, Full Adder, RCA)
- Verilog HDL — All 3 modelling styles
- Testbench writing & Waveform analysis

## Project — 4-bit Ripple Carry Adder
Designed and simulated a 4-bit RCA by instantiating
4 full adder modules in structural style.

### Files
| File | Description |
|------|-------------|
| rca_4bit.v | Design — full adder + RCA top module |
| tb_rca_4bit.v | Testbench — 4 test cases + white box testing |

### Test Results
| A | B | Cin | Sum | Cout |
|---|---|-----|-----|------|
| 0011 | 0100 | 0 | 0111 | 0 |
| 0110 | 1011 | 0 | 0001 | 1 |
| 1111 | 0001 | 0 | 0000 | 1 |
| 0111 | 0111 | 1 | 1111 | 0 |

### Tools
- Verilog HDL
- EDA Playground (Icarus Verilog 12.0)
- EPWave waveform viewer
