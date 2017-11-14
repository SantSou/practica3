/******************************************************************
* Description
*	This is the top-level of a MIPS processor that can execute the next set of instructions:
*		add
*		addi
*		sub
*		ori
*		or
*		bne
*		beq
*		and
*		nor
*		lui
* This processor is written Verilog-HDL. Also, it is synthesizable into hardware.
* Parameter MEMORY_DEPTH configures the program memory to allocate the program to
* be execute. If the size of the program changes, thus, MEMORY_DEPTH must change.
* This processor was made for computer organization class at ITESO.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	12/06/2016
******************************************************************/

module MIPS_Processor
#(	parameter MEMORY_DEPTH = 256)
(
	// Inputs
	input clk,
	input reset,
	input [7:0] PortIn,
	// Output
	output [31:0] ALUResultOut,
	output [31:0] PortOut
);
//******************************************************************/
//******************************************************************/
assign  PortOut = 0;

//******************************************************************/
//******************************************************************/
// Data types to connect modules
wire BranchNE_wire;
wire BranchEQ_wire;
wire RegDst_wire;
wire NotZeroANDBrachNE;
wire ZeroANDBrachEQ;
wire ORForBranch;
wire ALUSrc_wire;
wire RegWrite_wire;
wire Zero_wire;
wire Lui_selec;
wire branch_output;
wire branch;

wire jump_wire;
wire jr_wire;
wire jal_wire;
wire jump_or_jr_wire;
wire branch_or_jr_wire;

wire MemRead_wire;
wire MemtoReg_wire;
wire MemWrite_wire;

wire [2:0] ALUOp_wire;
wire [3:0] ALUOperation_wire;
wire [4:0] WriteRegister_wire;

wire [4:0] AddressRegister_wire;
wire [31:0] Write2Register_wire;

wire [31:0] RAM_OUT_wire;
wire [31:0] RAM_or_LUI_wire;

wire [31:0] MUX_PC_wire;
wire [31:0] PC_wire;
wire [31:0] Instruction_wire;
wire [31:0] ReadData1_wire;
wire [31:0] ReadData2_wire;
wire [31:0] InmmediateExtend_wire;
wire [31:0] ReadData2OrInmmediate_wire;
wire [31:0] ALUResult_wire;
wire [31:0] PC_4_wire;
wire [31:0] InmmediateExtendAnded_wire;
wire [31:0] PCtoBranch_wire;
wire [31:0] LuiWire;		//extended inmediat input
wire [31:0] ALU_or_LUI_wire;	//output from luiMux
wire [31:0] BranchPC_wire;
wire [31:0] PC_result_wire;

//IFID
wire [31:0] IFID_PC_4_wire;
wire [31:0] IFID_Instruction_wire;

//IDEX
wire [31:0] IDEX_Instruction_wire;
wire [31:0] IDEX_PC_4_wire;
wire [31:0] IDEX_ReadData1;
wire [31:0] IDEX_ReadData2;
wire [31:0] IDEX_InmmediateExtend_wire;
wire [9:0] 	IDEX_Rd_Rt;
wire [2:0]	IDEX_ALUOp_wire;

wire IDEX_RegDst_wire;
wire IDEX_ALUSrc_wire;
wire IDEX_MemRead_wire;
wire IDEX_MemtoReg_wire;
wire IDEX_MemWrite_wire;
wire IDEX_RegWrite_wire;

//EXMEM
wire [31:0] EXMEM_Instruction_wire;
wire [31:0] EXMEM_PC_4_wire;
wire [31:0] EXMEM_BranchPC_wire;
wire [31:0] EXMEM_ALU_or_LUI_wire;
wire [31:0] EXMEM_ReadData2;
wire [31:0] EXMEM_ReadData1;
wire [4:0] 	EXMEM_WriteRegister_wire;
wire EXMEM_MemRead_wire;
wire EXMEM_MemtoReg_wire;
wire EXMEM_MemWrite_wire;
wire EXMEM_RegWrite_wire;

//MEMWB
wire [31:0] MEMWB_ALU_or_LUI_wire;
wire [31:0] MEMWB_RAM_OUT_wire;
wire [4:0] 	MEMWB_WriteRegister_wire;
wire MEMWB_MemtoReg_wire;
wire MEMWB_RegWrite_wire;
//*********************************
integer ALUStatus;

//******************************************************************/
Control
ControlUnit
(
	.OP(IFID_Instruction_wire[31:26]),
	.RegDst(RegDst_wire),//
	.BranchNE(BranchNE_wire),
	.BranchEQ(BranchEQ_wire),
	.ALUOp(ALUOp_wire),//
	.ALUSrc(ALUSrc_wire),//
	.lui(Lui_selec),
	.jump(jump_wire),
	.jal(jal_wire),
	.MemRead(MemRead_wire),//
	.MemtoReg(MemtoReg_wire),//
	.MemWrite(MemWrite_wire),//
	.RegWrite(RegWrite_wire)//
);

PC_Register
ProgramCounter(
	.clk(clk),
	.reset(reset),
	.NewPC(PC_result_wire),
	.PCValue(PC_wire)
);

ProgramMemory
#(
	.MEMORY_DEPTH(MEMORY_DEPTH),
	.DATA_WIDTH(32)
)
ROMProgramMemory
(
	.Address(PC_wire),
	.Instruction(Instruction_wire)
);

Adder32bits
PC_Puls_4
(
	.Data0(PC_wire),
	.Data1(4),
	.Result(PC_4_wire)
);

//******************************************************************/
//******************************************************************/jumps & branches
Adder32bits
Address_plus_PC
(
	.Data0(PC_4_wire),
	.Data1({{14{Instruction_wire[15]}},Instruction_wire[15:0],2'b00}),
	.Result(BranchPC_wire)
);

Brancher
branch_control
(
	.Rt(ReadData1_wire),//Rs pipemod
	.Rs(ReadData2_wire),//Rt pipemod
	.BEQ(BranchEQ_wire),
	.BNE(BranchNE_wire),
	.branch(branch_output)
);

Multiplexer4to1
#(
	.NBits(32)
)
PC_mux(
	.Selector({jump_or_jr_wire,branch_or_jr_wire}),
	.MUX_Data0(PC_4_wire),
	.MUX_Data1(EXMEM_BranchPC_wire), //pipemod
	.MUX_Data2({EXMEM_PC_4_wire[31:28],EXMEM_Instruction_wire[25:0],2'b00}), //jumpaddr
	.MUX_Data3(EXMEM_ReadData1_wire),//Rs	pipemod
	.MUX_Output(PC_result_wire)
);
//******************************************************************/
//******************************************++++++PIPELINE
PIPE_Register
#(
	.N(64)
)
IFID
(
	.clk(clk),
	.reset(reset),
	.enable(1'b1),
	.DataInput({PC_4_wire,Instruction_wire}),
	
	.DataOutput({IFID_PC_4_wire,IFID_Instruction_wire})
);
//******************************************++++++PIPELINE

//******************************************++++++PIPELINE
PIPE_Register
#(
	.N(169)
)
IDEX
(
	.clk(clk),
	.reset(reset),
	.enable(1'b1),
	.DataInput({IFID_Instruction_wire,	//32
					IFID_PC_4_wire,			//32
					ReadData1_wire,			//32
					ReadData2_wire,			//32
					InmmediateExtend_wire,	//32
					RegDst_wire,				//1
					ALUOp_wire,					//3
					ALUSrc_wire,				//1
					MemRead_wire,				//1
					MemtoReg_wire,				//1
					MemWrite_wire,				//1
					RegWrite_wire}),			//1
													//---169 bits
	
	.DataOutput({IDEX_Instruction_wire,			//32
					IDEX_PC_4_wire,					//32
					IDEX_ReadData1,					//32
					IDEX_ReadData2,					//32
					IDEX_InmmediateExtend_wire,	//32
					IDEX_RegDst_wire,					//1
					IDEX_ALUOp_wire,					//3
					IDEX_ALUSrc_wire,					//1
					IDEX_MemRead_wire,				//1
					IDEX_MemtoReg_wire,				//1
					IDEX_MemWrite_wire,				//1
					IDEX_RegWrite_wire})				//1
															//---169 bits
);
//******************************************++++++PIPELINE

//******************************************++++++PIPELINE
PIPE_Register
#(
	.N(201)
)
EXMEM
(
	.clk(clk),
	.reset(reset),
	.enable(1'b1),
	.DataInput({IDEX_Instruction_wire,		//32
					IDEX_PC_4_wire,				//32
					BranchPC_wire,					//32
					ALU_or_LUI_wire,				//32
					IDEX_ReadData1,				//32
					IDEX_ReadData2,				//32
					WriteRegister_wire,			//5
					IDEX_MemRead_wire,			//1
					IDEX_MemtoReg_wire,			//1
					IDEX_MemWrite_wire,			//1
					IDEX_RegWrite_wire}),		//1
														//---201 bits
														
	.DataOutput({EXMEM_Instruction_wire,	//32
					EXMEM_PC_4_wire,				//32
					EXMEM_BranchPC_wire,			//32
					EXMEM_ALU_or_LUI_wire,		//32
					EXMEM_ReadData1,				//32
					EXMEM_ReadData2,				//32
					EXMEM_WriteRegister_wire,	//5
					EXMEM_MemRead_wire,			//1
					EXMEM_MemtoReg_wire,			//1
					EXMEM_MemWrite_wire,			//1
					EXMEM_RegWrite_wire})		//1
														//---201 bits
);
//******************************************++++++PIPELINE

//******************************************++++++PIPELINE
PIPE_Register
#(
	.N(66)
)
MEMWB
(
	.clk(clk),
	.reset(reset),
	.enable(1'b1),
	.DataInput({RAM_OUT_wire,					//32
					EXMEM_ALU_or_LUI_wire,		//32
					//EXMEM_WriteRegister_wire,	//5
					EXMEM_MemtoReg_wire,			//1
					EXMEM_RegWrite_wire}),		//1
														//---71 bits
					
	.DataOutput({MEMWB_RAM_OUT_wire,			//32
					MEMWB_ALU_or_LUI_wire,		//32
					//MEMWB_WriteRegister_wire,	//5
					MEMWB_MemtoReg_wire,			//1
					MEMWB_RegWrite_wire})		//1
);														//---71 bits
//******************************************++++++PIPELINE

//******************************************************************/
Multiplexer2to1
#(
	.NBits(32)
)
JALMux_data(
	.Selector(jal_wire),
	.MUX_Data0(RAM_or_LUI_wire),
	.MUX_Data1(IFID_PC_4_wire),
	.MUX_Output(Write2Register_wire)
);
//*****************************MUX to write PC+4 to Register
Multiplexer2to1
#(
	.NBits(5)
)
JALMux(
	.Selector(jal_wire),
	.MUX_Data0(WriteRegister_wire),
	.MUX_Data1(5'b11111),
	.MUX_Output(AddressRegister_wire)
);
//*****************************MUX to choose register 31
//******************************************************************/

Multiplexer2to1
#(
	.NBits(5)
)
MUX_ForRTypeAndIType
(
	.Selector(IDEX_RegDst_wire),
	.MUX_Data0(IDEX_Instruction_wire[20:16]),
	.MUX_Data1(IDEX_Instruction_wire[15:11]),
	.MUX_Output(WriteRegister_wire)
);

RegisterFile
Register_File
(
	.clk(clk),
	.reset(reset),
	.RegWrite(MEMWB_RegWrite_wire),
	.WriteRegister(AddressRegister_wire),
	.ReadRegister1(IFID_Instruction_wire[25:21]),//Rs
	.ReadRegister2(IFID_Instruction_wire[20:16]),//RT
	.WriteData(Write2Register_wire),
	.ReadData1(ReadData1_wire),//RS
	.ReadData2(ReadData2_wire)//RT
);

SignExtend
SignExtendForConstants
(   
	.DataInput(IFID_Instruction_wire[15:0]),
   .SignExtendOutput(InmmediateExtend_wire)
);


Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForReadDataAndInmediate
(
	.Selector(IDEX_ALUSrc_wire),
	.MUX_Data0(IDEX_ReadData2), //pipemod
	.MUX_Data1(IDEX_InmmediateExtend_wire),//pipemod
	.MUX_Output(ReadData2OrInmmediate_wire)
);


ALUControl
ArithmeticLogicUnitControl
(
	.ALUOp(IDEX_ALUOp_wire),
	.ALUFunction(IDEX_Instruction_wire[5:0]),
	.ALUOperation(ALUOperation_wire),
	.jr(jr_wire)
);

ALU
ArithmeticLogicUnit 
(
	.ALUOperation(ALUOperation_wire),
	.A(IDEX_ReadData1_wire),//pipemod
	.B(ReadData2OrInmmediate_wire),
	.Zero(Zero_wire),
	.shamt(IDEX_Instruction_wire[10:6]),
	.ALUResult(ALUResult_wire)
);
//********************************************LUI CONTROL
Multiplexer2to1
#(
	.NBits(32)
)
luiMux(
	.Selector(Lui_selec),
	.MUX_Data0(ALUResult_wire),
	.MUX_Data1(LuiWire),
	.MUX_Output(ALU_or_LUI_wire)
);

luiModule lui(
	.DataInput(IFID_Instruction_wire[15:0]),
   .ExtendedOutput(LuiWire)
);

//********************************************RAM CONTROL

DataMemory 

#(	
	.DATA_WIDTH(32),
	.MEMORY_DEPTH(MEMORY_DEPTH)
)
RAM(
	.WriteData(EXMEM_ReadData2), //pipemod
	.Address({24'b0,EXMEM_ALU_or_LUI_wire[10:2]}), //pipemod
	.MemWrite(EXMEM_MemWrite_wire),
	.MemRead(EXMEM_MemRead_wire), 
	.clk(clk),
	.ReadData(RAM_OUT_wire)
);
//********************RAM module

Multiplexer2to1
#(
	.NBits(32)
)
RAM_Mux(
	.Selector(MEMWB_MemtoReg_wire),
	.MUX_Data0(MEMWB_ALU_or_LUI_wire),
	.MUX_Data1(MEMWB_RAM_OUT_wire),
	.MUX_Output(RAM_or_LUI_wire)
);
//*******************RAM MUX
//***************************************************************
assign ALUResultOut = ALUResult_wire;

//assign for mux selector to PC
assign branch_or_jr_wire = branch_output | jr_wire;
assign jump_or_jr_wire = jump_wire | jr_wire;

endmodule
