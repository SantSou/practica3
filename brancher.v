
module Brancher
#
(
	parameter NBits=32
)
(
	input [2:0] ALUOp,
	input [5:0] ALUFunction,
	input [NBits-1:0] Rt,
	input [NBits-1:0] Rs,
	input BEQ,
	input BNE,
	//input mux_selector,
	output reg branch,
	output reg jr
);

localparam R_Type_JR     = 9'b111_001000;
wire [8:0] Selector;
assign Selector = {ALUOp, ALUFunction};

always @ (BEQ or BNE or Rt or Rs or Selector)
begin

	if(Rs==Rt && BEQ)
		branch=1'b1;
	else if(Rs!=Rt && BNE)
		branch=1'b1;
	else
		branch = 1'b0;
		
	//
	if(Selector==R_Type_JR)
	 	jr = 1'b1;
	else
		jr = 1'b0;
end

endmodule //