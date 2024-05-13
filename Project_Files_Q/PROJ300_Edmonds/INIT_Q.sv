module INIT_Q (
	output logic [31:0] new_Q[37][4],
	input logic clk,
	input logic rst);
	

	logic [31:0] rand_Q [148] = '{
32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000,
32'b00000000000000000001011100010111, 32'b00000000000000000000100011001000, 32'b00000000000000000000111101110000, 32'b00000000000000000001000001001111,
32'b00000000000000000001100100110001, 32'b00000000000000000000011101011111, 32'b00000000000000000001011000111111, 32'b00000000000000000000100101111001,
32'b00000000000000000001010001000110, 32'b00000000000000000000111110010001, 32'b00000000000000000000101010010011, 32'b00000000000000000000010110101000,
32'b00000000000000000000111111110011, 32'b00000000000000000001000101001110, 32'b00000000000000000000110011010011, 32'b00000000000000000000011101110011,
32'b00000000000000000001011111110000, 32'b00000000000000000000110000101001, 32'b00000000000000000000001111010000, 32'b00000000000000000001011100101011,
32'b00000000000000000000111111101100, 32'b00000000000000000000011101001100, 32'b00000000000000000000011010100001, 32'b00000000000000000000010000110011,
32'b00000000000000000000001011110010, 32'b00000000000000000001100001100110, 32'b00000000000000000001000111011000, 32'b00000000000000000000100000100100,
32'b00000000000000000000010101011010, 32'b00000000000000000000010001110100, 32'b00000000000000000000101000110000, 32'b00000000000000000000001111001010,
32'b00000000000000000001011001101101, 32'b00000000000000000000010011111110, 32'b00000000000000000001011101000101, 32'b00000000000000000000110011000000,
32'b00000000000000000000110110111001, 32'b00000000000000000000010111010110, 32'b00000000000000000000010101000110, 32'b00000000000000000000001011011110,
32'b00000000000000000001011000000100, 32'b00000000000000000000011001100110, 32'b00000000000000000001100101011000, 32'b00000000000000000001011100111000,
32'b00000000000000000000011101011111, 32'b00000000000000000001000011011111, 32'b00000000000000000000111100000000, 32'b00000000000000000000011100010111,
32'b00000000000000000000111101001000, 32'b00000000000000000000111111000101, 32'b00000000000000000001001011010111, 32'b00000000000000000000010010110110,
32'b00000000000000000001000100010011, 32'b00000000000000000000001111000011, 32'b00000000000000000001100110011010, 32'b00000000000000000000100110100111,
32'b00000000000000000000001101001101, 32'b00000000000000000001100000000011, 32'b00000000000000000000100100110001, 32'b00000000000000000000110100001110,
32'b00000000000000000001000010111000, 32'b00000000000000000001001101011011, 32'b00000000000000000000110000011100, 32'b00000000000000000000010011101010,
32'b00000000000000000000101011101000, 32'b00000000000000000001001110001111, 32'b00000000000000000000110101000011, 32'b00000000000000000001100101111111,
32'b00000000000000000000001110110110, 32'b00000000000000000000010000000101, 32'b00000000000000000001010000101100, 32'b00000000000000000000101000110111,
32'b00000000000000000000110111011001, 32'b00000000000000000001011001100000, 32'b00000000000000000001010101100111, 32'b00000000000000000000100101101100,
32'b00000000000000000000011011111101, 32'b00000000000000000001100000010111, 32'b00000000000000000000010011011101, 32'b00000000000000000000001111111110,
32'b00000000000000000000010101100111, 32'b00000000000000000001100100111110, 32'b00000000000000000000011010101000, 32'b00000000000000000000100101101100,
32'b00000000000000000000011101001100, 32'b00000000000000000001011001011001, 32'b00000000000000000000101011011011, 32'b00000000000000000000001110100011,
32'b00000000000000000000010111110000, 32'b00000000000000000001010010101001, 32'b00000000000000000000001111011110, 32'b00000000000000000000111000110101,
32'b00000000000000000000011011101001, 32'b00000000000000000000111001100011, 32'b00000000000000000000111010011000, 32'b00000000000000000001010000011001,
32'b00000000000000000000001110001000, 32'b00000000000000000000011010101000, 32'b00000000000000000000101001001011, 32'b00000000000000000001000100011010,
32'b00000000000000000001000100110100, 32'b00000000000000000000101111000000, 32'b00000000000000000000011010011011, 32'b00000000000000000000010010100010,
32'b00000000000000000000100100010000, 32'b00000000000000000000010110101000, 32'b00000000000000000000011101011111, 32'b00000000000000000000010001101110,
32'b00000000000000000000111011111010, 32'b00000000000000000000001101000111, 32'b00000000000000000001011101101101, 32'b00000000000000000001010001111011,
32'b00000000000000000001001010010110, 32'b00000000000000000001100000110001, 32'b00000000000000000001001000100000, 32'b00000000000000000001011101101101,
32'b00000000000000000000111000001110, 32'b00000000000000000000100101111111, 32'b00000000000000000000110101011101, 32'b00000000000000000000111011011001,
32'b00000000000000000000111011100110, 32'b00000000000000000000100101011111, 32'b00000000000000000001011110010100, 32'b00000000000000000000010100010010,
32'b00000000000000000000110011010011, 32'b00000000000000000000101000111101, 32'b00000000000000000000010011110111, 32'b00000000000000000001010110010101,
32'b00000000000000000000010101101101, 32'b00000000000000000000110101010000, 32'b00000000000000000001001110111101, 32'b00000000000000000000101001011000,
32'b00000000000000000000110111011001, 32'b00000000000000000001000101111100, 32'b00000000000000000001001110001000, 32'b00000000000000000000100101011000,
32'b00000000000000000001011000111001, 32'b00000000000000000000001100100110, 32'b00000000000000000000111110000011, 32'b00000000000000000001001111000011,
32'b00000000000000000001011010110101, 32'b00000000000000000001010111110111, 32'b00000000000000000000011011001111, 32'b00000000000000000000001011001010};
	
	//the following HDL was generated by ChatGPT3.5 and then modified
	always @(posedge clk or negedge rst) 
	begin
    // Initialize the new_Q array using the provided values
		integer i, j;
		for (i = 0; i < 37; i = i + 1) begin
			for (j = 0; j < 4; j = j + 1) begin
            // Calculate the index for new_Q based on i and j
				new_Q[i][j] = rand_Q[i*4 + j];
			end
		end
	end

endmodule