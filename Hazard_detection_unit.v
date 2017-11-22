module Hazard_detection_unit
(
	input [4:0] IFID_Rs,
	input [4:0] IFID_Rt,
	input [4:0] IDEX_Rt,
	input IDEX_MemRead,
	output reg IFID_write,
	output reg PC_write,
	output reg Control_nop
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
	end

endmodule//