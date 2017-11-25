

module Foward_Unit
(
	input [4:0] IDEX_Rs,
	input [4:0] IDEX_Rt,
	input [4:0] EXMEM_WR,
	input [4:0] MEMWB_WR,
	input EXMEM_RegWrite,
	input MEMWB_RegWrite,
	output reg [1:0] FowardA,
	output reg [1:0] FowardB
);

	always@(*) 
	begin
			FowardA = 2'b00;
			FowardB = 2'b00;
	
			if (EXMEM_RegWrite && (EXMEM_WR !=0) && (EXMEM_WR == IDEX_Rs))
					FowardA = 2'b10;
					
					
			if (EXMEM_RegWrite && (EXMEM_WR !=0) && (EXMEM_WR == IDEX_Rt))
					FowardB = 2'b10;

					
			if (MEMWB_RegWrite && (MEMWB_WR !=0) && (EXMEM_WR != IDEX_Rs) && (MEMWB_WR == IDEX_Rs))
					FowardA = 2'b01;
					
					
			if (MEMWB_RegWrite && (MEMWB_WR !=0) && (EXMEM_WR != IDEX_Rt) && (MEMWB_WR == IDEX_Rt))
					FowardB = 2'b01;
				
	
		
	end

endmodule//