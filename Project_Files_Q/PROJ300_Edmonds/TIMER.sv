////////////////////////////////////////////////////////////////////////////////////
// Modified version of module from elec241 coursework
///////////////////////////////////////////////////////////////////////////////////
// Should output ready signal every 50ms
//////////////////////////////////////////////////////////////////////////////////
module TIMER #(parameter int unsigned N=2500000) (output logic RDY, input logic clk, T_Start, reset, T_reStart);

    typedef int unsigned state_t;
    state_t state=N-2;
    state_t next_state;

    always@(posedge clk) begin : Timer_state_logic
        next_state = state;
        case (state)
        0:next_state = (T_Start == 1) ? 1 : 0;
        (N-1):   next_state =  0;       //final timer state
        default: next_state = (T_reStart == 1) ? 0 : (state + 1); //Intermediate timer states
        endcase
    end

    always@(posedge clk) begin : Timer_output_logic
        case (state)
        (N-1):   RDY = '1;
        default: RDY = '0;
        endcase
    end

    always_ff @(posedge clk or negedge reset) begin : Timer_update_state
        if(reset == 1'b0)
            state <= 0;
        else
            state <= next_state;
    end
endmodule
