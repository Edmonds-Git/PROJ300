module Q_E_COUNT_INIT(output logic [7:0] new_count,
input logic clk,
input logic rst);

always_comb
	begin
		new_count = 0;
	end

endmodule