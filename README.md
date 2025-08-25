# Metro-Turnstile-Controller-FSM-Design-
I designed a Metro Turnstile controller using Verilog HDL based on a finite state machine (FSM). The system operates in two main states: Locked and Unlocked, transitioning based on coin insertion and passenger pass signals. The design was verified through waveform simulation in Xilinx Vivado to ensure correct access control behavior.

this is the simulation of this project 
<img width="1525" height="265" alt="image" src="https://github.com/user-attachments/assets/794fa74a-a854-439e-9435-c4cf168b453f" />

Traffic Light Controller Simulation

The waveform below shows the traffic light FSM (Finite State Machine) operation with three signals: Red, Yellow, and Green.

Explanation of Waveform
=> Clock (clk)
Provides the timing reference for state transitions.

The FSM changes states on the positive edge of the clock.

=> Reset (reset)

Initially active (1), keeping the system in a known OFF state.

When released (0), the FSM starts normal operation.

=> Enable (enb)

Enables the FSM.

When high, the traffic light controller cycles through its states.

=> Traffic Light Outputs

Red (red): Active between 100 ns – 600 ns.

Yellow (yellow): Active between 600 ns – 700 ns.

Green (green): Active after 700 ns.

FSM States (state_out[3:0])

Encoded states show transitions:

1 → OFF

2 → RED

4 → YELLOW

8 → GREEN

=> State Progression

At 0–100 ns: FSM is in OFF state.

At 100–600 ns: FSM enters RED state.

At 600–700 ns: FSM switches to YELLOW.

At 700 ns onwards: FSM moves to GREEN.


