module Hazard_detection_unit
(
	input branch,
	input jump,
	input jal,
	input jr,
	input [4:0] IFID_Rs,
	input [4:0] IFID_Rt,
	input [4:0] IDEX_Rt,
	input IDEX_MemRead,
	output reg IFID_write,
	output reg PC_write,
	output reg Control_nop,
	output reg flush
);

	always@(*) 
	begin
			if(IDEX_MemRead && (IDEX_Rt == IFID_Rs || IDEX_Rt == IFID_Rt))
				begin
					IFID_write = 0;
					PC_write = 0;
					Control_nop = 1;
				end
			else
				begin
					IFID_write = 1;
					PC_write = 1;
					Control_nop = 0;
				end
				
			if(branch || jump || jal || jr)
				flush = 1;
			else
				flush = 0;
	end

endmodule//