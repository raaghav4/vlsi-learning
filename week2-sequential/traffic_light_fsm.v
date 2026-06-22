// Traffic Light Controller FSM
// Type: Moore FSM — 3-block style
// States: RED, GREEN, YELLOW, WALK
// Auto-timer: internal counter drives state transitions
// Tools: EDA Playground, Icarus Verilog 12.0

module traffic_light_fsm(
  input  wire clk, rst,
  output reg [1:0] light
);
  // State encoding
  parameter RED    = 2'b00;
  parameter GREEN  = 2'b01;
  parameter YELLOW = 2'b10;
  parameter WALK   = 2'b11;

  // Timer duration (clock cycles per state)
  parameter RED_TIME    = 4'd8;
  parameter GREEN_TIME  = 4'd6;
  parameter YELLOW_TIME = 4'd3;
  parameter WALK_TIME   = 4'd4;

  reg [1:0] state, next_state;
  reg [3:0] count;
  reg timer;

  // Internal auto-timer
  always @(posedge clk) begin
    if(rst) begin
      timer <= 0;
      count <= 0;
    end else begin
      if(timer) begin
        timer <= 0;
        count <= 0;
      end else begin
        case(state)
          RED:    if(count == RED_TIME-1) begin
                    timer<=1; count<=0;
                  end else count<=count+1;
          GREEN:  if(count == GREEN_TIME-1) begin
                    timer<=1; count<=0;
                  end else count<=count+1;
          YELLOW: if(count == YELLOW_TIME-1) begin
                    timer<=1; count<=0;
                  end else count<=count+1;
          WALK:   if(count == WALK_TIME-1) begin
                    timer<=1; count<=0;
                  end else count<=count+1;
        endcase
      end
    end
  end

  // Block 1 — State Register (Sequential)
  always @(posedge clk) begin
    if(rst) state <= RED;
    else    state <= next_state;
  end

  // Block 2 — Next State Logic (Combinational)
  always @(*) begin
    case(state)
      RED:     next_state = (timer) ? GREEN  : RED;
      GREEN:   next_state = (timer) ? YELLOW : GREEN;
      YELLOW:  next_state = (timer) ? WALK   : YELLOW;
      WALK:    next_state = (timer) ? RED    : WALK;
      default: next_state = RED;
    endcase
  end

  // Block 3 — Output Logic (Combinational — Moore)
  always @(*) begin
    case(state)
      RED:     light = 2'b00;  // RED
      GREEN:   light = 2'b01;  // GREEN
      YELLOW:  light = 2'b10;  // YELLOW
      WALK:    light = 2'b11;  // WALK
      default: light = 2'b00;
    endcase
  end

endmodule
