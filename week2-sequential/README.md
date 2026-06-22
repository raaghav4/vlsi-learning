# Week 2 — Sequential Logic & FSM

## Topics Covered
- Flip-Flops: SR, JK, D, T — theory & Verilog
- Synchronous vs Asynchronous counters
- Up/Down counter, Shift registers (SIPO)
- FSM Theory — Moore vs Mealy
- 3-block FSM coding style
- Traffic Light Controller FSM

## Project — Traffic Light Controller FSM

A 4-state Moore FSM with internal auto-timer.
No external timer input needed — fully autonomous.

### FSM Details
| Feature | Value |
|---------|-------|
| Type | Moore FSM |
| States | 4 (RED, GREEN, YELLOW, WALK) |
| Encoding | Binary (2-bit) |
| Timer | Internal counter |
| Style | 3-block FSM |

### State Diagram
RED(8) → GREEN(6) → YELLOW(3) → WALK(4) → RED
Numbers = clock cycles per state

### State Table
| State | Timer=0 | Timer=1 | Output |
|-------|---------|---------|--------|
| RED | RED | GREEN | 2'b00 |
| GREEN | GREEN | YELLOW | 2'b01 |
| YELLOW | YELLOW | WALK | 2'b10 |
| WALK | WALK | RED | 2'b11 |

### Verified Output
| State | Cycles | Status |
|-------|--------|--------|
| RED | 8 | ✅ |
| GREEN | 6 | ✅ |
| YELLOW | 3 | ✅ |
| WALK | 4 | ✅ |

### Files
| File | Description |
|------|-------------|
| traffic_light_fsm.v | Design — Moore FSM with auto-timer |
| tb_traffic_light_fsm.v | Testbench — 2 full cycles verified |

### Tools
- Verilog HDL
- EDA Playground (Icarus Verilog 12.0)
- EPWave waveform viewer
