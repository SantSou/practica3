onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_Processor_TB/clk
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/ROMProgramMemory/Instruction
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/ProgramCounter/NewPC
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/ProgramCounter/PCValue
add wave -noupdate -divider ALU
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/ALUResultOut
add wave -noupdate -divider PC_MUX
add wave -noupdate /MIPS_Processor_TB/DUV/branch_output
add wave -noupdate /MIPS_Processor_TB/DUV/jr_wire
add wave -noupdate -radix binary -childformat {{{/MIPS_Processor_TB/DUV/PC_mux/Selector[1]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/PC_mux/Selector[0]} -radix hexadecimal}} -subitemconfig {{/MIPS_Processor_TB/DUV/PC_mux/Selector[1]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/PC_mux/Selector[0]} {-height 15 -radix hexadecimal}} /MIPS_Processor_TB/DUV/PC_mux/Selector
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/PC_mux/MUX_Data0
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/PC_mux/MUX_Data1
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/PC_mux/MUX_Data2
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/PC_mux/MUX_Output
add wave -noupdate -divider REGISTERS
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister2/Data_2
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister2/Data_3
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister2/Data_4
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister2/Data_5
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister2/Data_6
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister2/Data_7
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_8
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_9
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_10
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_11
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_12
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister2/Data_16
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister2/Data_17
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister2/Data_18
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister2/Data_19
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister2/Data_20
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister2/Data_21
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister2/Data_22
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister2/Data_23
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister2/Data_24
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister2/Data_25
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister2/Data_29
add wave -noupdate -divider AR
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_31
add wave -noupdate -divider RegFile
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/ReadData1
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/ReadData2
add wave -noupdate /MIPS_Processor_TB/DUV/Register_File/ReadRegister1
add wave -noupdate /MIPS_Processor_TB/DUV/Register_File/ReadRegister2
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/branch_control/Rt
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/branch_control/Rs
add wave -noupdate /MIPS_Processor_TB/DUV/branch_control/BEQ
add wave -noupdate /MIPS_Processor_TB/DUV/branch_control/BNE
add wave -noupdate /MIPS_Processor_TB/DUV/branch_control/branch
add wave -noupdate /MIPS_Processor_TB/DUV/branch_control/equals
add wave -noupdate -divider RAM_data_mux
add wave -noupdate /MIPS_Processor_TB/DUV/RAM_Mux/Selector
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/RAM_Mux/MUX_Data0
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/RAM_Mux/MUX_Data1
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/RAM_Mux/MUX_Output
add wave -noupdate -divider RAM
add wave -noupdate /MIPS_Processor_TB/DUV/RAM/MemWrite
add wave -noupdate /MIPS_Processor_TB/DUV/RAM/MemRead
add wave -noupdate -radix hexadecimal -childformat {{{/MIPS_Processor_TB/DUV/RAM/WriteData[31]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[30]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[29]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[28]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[27]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[26]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[25]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[24]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[23]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[22]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[21]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[20]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[19]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[18]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[17]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[16]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[15]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[14]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[13]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[12]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[11]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[10]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[9]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[8]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[7]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[6]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[5]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[4]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[3]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[2]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[1]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/RAM/WriteData[0]} -radix hexadecimal}} -subitemconfig {{/MIPS_Processor_TB/DUV/RAM/WriteData[31]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[30]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[29]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[28]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[27]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[26]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[25]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[24]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[23]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[22]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[21]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[20]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[19]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[18]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[17]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[16]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[15]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[14]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[13]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[12]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[11]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[10]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[9]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[8]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[7]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[6]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[5]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[4]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[3]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[2]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[1]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/RAM/WriteData[0]} {-height 15 -radix hexadecimal}} /MIPS_Processor_TB/DUV/RAM/WriteData
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/RAM/Address
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/RAM/ReadData
add wave -noupdate -divider tower3
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[23]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[22]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[21]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[20]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[19]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[18]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[17]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[16]}
add wave -noupdate -divider tower2
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[15]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[14]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[13]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[12]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[11]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[10]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[9]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[8]}
add wave -noupdate -divider tower1
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[7]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[6]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[5]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[4]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[3]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[2]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[1]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[0]}
add wave -noupdate -divider SP
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[255]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[254]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[253]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[252]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[251]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[250]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[249]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[248]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[247]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[246]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[245]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[244]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[243]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[242]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[241]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[240]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[239]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[238]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[237]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[236]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[235]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[234]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[233]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[232]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[231]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[230]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[229]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[228]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[227]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[226]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[225]}
add wave -noupdate -radix hexadecimal {/MIPS_Processor_TB/DUV/RAM/ram[224]}
add wave -noupdate -divider LUI
add wave -noupdate /MIPS_Processor_TB/DUV/Lui_selec
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/LuiWire
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/IDEX_LuiWire
add wave -noupdate /MIPS_Processor_TB/DUV/IDEX_Lui_selec
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/ALU_or_LUI_wire
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/EXMEM_ALU_or_LUI_wire
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/MEMWB_ALU_or_LUI_wire
add wave -noupdate -divider LUI_MUX
add wave -noupdate /MIPS_Processor_TB/DUV/luiMux/Selector
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/luiMux/MUX_Data0
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/luiMux/MUX_Data1
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/luiMux/MUX_Output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6267 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 140
configure wave -valuecolwidth 54
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {6249 ps} {6396 ps}
