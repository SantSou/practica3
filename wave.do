onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_Processor_TB/clk
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/ROMProgramMemory/Instruction
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/ProgramCounter/NewPC
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/ProgramCounter/PCValue
add wave -noupdate -divider ALU
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/ALUResultOut
add wave -noupdate -divider PC_MUX
add wave -noupdate /MIPS_Processor_TB/DUV/PC_mux/Selector
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/PC_mux/MUX_Data0
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/PC_mux/MUX_Data1
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/PC_mux/MUX_Data2
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/PC_mux/MUX_Output
add wave -noupdate -divider REGISTERS
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_8
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_9
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_10
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_11
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_12
add wave -noupdate -divider AR
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_31
add wave -noupdate -divider RegFile
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/ReadData1
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/ReadData2
add wave -noupdate -divider RAM
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/RAM/WriteData
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/RAM/Address
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/RAM/ReadData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {47 ps}
