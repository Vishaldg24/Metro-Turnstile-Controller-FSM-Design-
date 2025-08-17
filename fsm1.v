module fsm1(
input clk,
input reset,
input valid_code,
input [3:0] access_code,
output reg open_access_door,
output [1:0] state_out
 );
 parameter [2:0] IDEAL = 2'b00,
 CHECK_CODE = 2'b01, 
 ACCESS_GARNTED = 2'b10;
 reg [1:0] state;
 reg [1:0] next_state;
 reg [3:0] timer;
 always @(*)
 begin
 next_state = IDEAL;
 open_access_door = 0;
 case(state)
 IDEAL : begin if(valid_code) 
                next_state = CHECK_CODE; 
                end
 CHECK_CODE : begin if( (access_code >= 4'd4) && (access_code <= 4'd11))
                next_state = ACCESS_GARNTED;
                end
 ACCESS_GARNTED : begin
                   open_access_door =1;
                   if(timer == 4'hF)
                   next_state = IDEAL;
                   else
                   next_state = ACCESS_GARNTED;
                  end
      default next_state = IDEAL;
 endcase
  end
  
  always @( posedge clk or negedge reset) begin
  if(!reset)
  state <= IDEAL;
  else
  state <= next_state;
  end
  
  assign state_out = state;
   always @(posedge clk or negedge reset) begin
   if(!reset)
   timer <= 0;
   else if (state== ACCESS_GARNTED)
   timer <= timer + 1'b1;
   else 
   timer <= 0;
   end
endmodule
