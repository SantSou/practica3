/******************************************************************
******************************************************************/
module Control
(
	input [5:0]OP,
	
	output RegDst,
	output BranchEQ,
	output BranchNE,
	output MemRead,
	output MemtoReg,
	output MemWrite,
	output ALUSrc,
	output RegWrite,
	output [2:0]ALUOp,
	output jump,
	output jal,
	output lui
);
localparam R_Type 	 = 0;
localparam I_Type_ADDI =6'h08;
localparam I_Type_ORI = 6'h0D;
localparam I_Type_LUI = 6'h0F;
localparam I_Type_BEQ = 6'h04;
localparam I_Type_ANDI =6'h0c;
localparam I_Type_BNE = 6'h05;

localparam I_Type_LW = 6'h023;
localparam I_Type_SW = 6'h02b;

localparam J_Type_J	 = 6'h02;
localparam J_Type_JAL = 6'h03;

reg [13:0] ControlValues;

always@(OP) begin
	casex(OP)
		R_Type:       	ControlValues= 14'b000_1_001_00_00_111;
		
		I_Type_ADDI:   ControlValues= 14'b000_0_101_00_00_100;
		I_Type_ORI:    ControlValues= 14'b000_0_101_00_00_101;
		I_Type_LUI:    ControlValues= 14'b001_0_001_00_00_000;
		
		I_Type_BEQ:		ControlValues= 14'b000_0_000_00_01_000;
		I_Type_BNE:		ControlValues= 14'b000_0_000_00_10_000;//aluop=0
		
		I_Type_ANDI:	ControlValues= 14'b000_0_101_00_00_011;
		
		I_Type_LW: 		ControlValues= 14'b000_0_111_10_00_010;
		I_Type_SW:		ControlValues= 14'b000_0_100_01_00_110;
		
		J_Type_J:		ControlValues= 14'b010_0_000_00_00_000;
		J_Type_JAL:		ControlValues= 14'b110_0_001_00_00_000;
		
		default:
			ControlValues= 14'b0;
		endcase
end	
	
assign jal		 =	ControlValues[13];		
assign jump		 =	ControlValues[12];	
assign lui 		 = ControlValues[11];

assign RegDst =   ControlValues[10];

assign ALUSrc =   ControlValues[9];
assign MemtoReg = ControlValues[8];
assign RegWrite = ControlValues[7];

assign MemRead =  ControlValues[6];
assign MemWrite = ControlValues[5];

assign BranchNE = ControlValues[4];
assign BranchEQ = ControlValues[3];

assign ALUOp =    ControlValues[2:0];	

endmodule//