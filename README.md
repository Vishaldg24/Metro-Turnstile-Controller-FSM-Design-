# Metro-Turnstile-Controller-FSM-Design-
I designed a Metro Turnstile controller using Verilog HDL based on a finite state machine (FSM). The system operates in two main states: Locked and Unlocked, transitioning based on coin insertion and passenger pass signals. The design was verified through waveform simulation in Xilinx Vivado to ensure correct access control behavior.

this is the simulation of this project 
<img width="1525" height="265" alt="image" src="https://github.com/user-attachments/assets/794fa74a-a854-439e-9435-c4cf168b453f" />

Metro Turnstile FSM – Simulation Results

The Metro Turnstile system is implemented as a Finite State Machine (FSM) using Verilog and simulated in Vivado. The FSM models the behavior of an automated turnstile that unlocks when a valid token/card is inserted and locks again after passage.

Signal Descriptions

clk → System clock for synchronization.

reset → Initializes the FSM into the locked state.

token_in / card_valid → Input indicating a valid token or smart card insertion.

passenger → Input signal showing an attempt to pass through the gate.

lock / unlock → Output signals that control the turnstile mechanism.

state_out → Encoded FSM state.

FSM States

LOCKED (00) → Default state, waiting for a valid token.

UNLOCKED (01) → Gate unlocked, passenger allowed to pass.

PASSAGE (10) → Passenger moves through; system prepares to lock.

RETURN_TO_LOCKED (11) → FSM resets to locked state after passage.

Operation Flow

Locked State

Initially, the turnstile is locked. No entry is possible without a valid token/card.

Unlock on Valid Token

When token_in = 1, FSM transitions to the Unlocked state.

The gate is unlocked (unlock = 1).

Passenger Passage

Once the passenger enters, FSM moves to the Passage state.

Relock

After the passenger passes, FSM transitions back to Locked, ensuring secure operation.

Key Features

Prevents unauthorized entry.

Ensures only one passage per valid token/card.

Models real-world metro station gate behavior

