
module Brancher
#
(
	parameter NBits=32
)
(
	input [NBits-1:0] Rt,
	input [NBits-1:0] Rs,
	input BEQ,
	input BNE,
	//input mux_selector,
	output reg branch
);

always @ (BEQ or BNE or Rt or Rs)

	if(Rs==Rt && BEQ)
		branch=1'b1;
	else if(Rs!=Rt && BNE)
		branch=1'b1;
	else
		branch = 1'b0;

endmodule //