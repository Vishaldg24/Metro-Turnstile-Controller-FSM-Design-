module tb_fsm1;

    reg clk = 0;
	reg reset;
	reg valid_code;
	reg  [3:0] access_code;
	wire open_access_door;
	wire [1:0] state_out;
    fsm1 f1(
        .clk             (clk             ),
		.reset           (reset          ),
		.valid_code   (valid_code   ),
		.access_code     (access_code     ),
		.open_access_door(open_access_door),
		.state_out       (state_out       )
        );
	
    initial begin 
        forever begin 
		    #1 clk = ~clk;
	    end
    end

    initial begin
	    $monitor($time, " access_code = %4b, state_out = %2b, open_access_door = %b", 
		                access_code, state_out, open_access_door);
		
	    reset = 0; #2.5; reset = 1;   
		valid_code = 0; access_code = 0;
	    @(posedge clk);             
		valid_code = 1; access_code = 0;
	    @(posedge clk);               
		valid_code = 1; access_code = 0;
	    @(posedge clk);               
		valid_code = 1; access_code = 9;
	    @(posedge clk);              
		valid_code = 0; access_code = 9;
	    #40 $stop;
	end   
    
endmodule
