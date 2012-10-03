onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Testbench state}
add wave -noupdate -format Literal -radix ascii /TEST_TB/STM/tb_state
add wave -noupdate -format Literal -radix ascii /TEST_TB/STM/tb_state_detail
add wave -noupdate -divider {PCI Bus signals}
add wave -noupdate -format Logic /TEST_TB/RST_N
add wave -noupdate -format Logic /TEST_TB/CLK
add wave -noupdate -format Logic /TEST_TB/PAR
add wave -noupdate -format Literal -radix hexadecimal /TEST_TB/AD
add wave -noupdate -format Literal /TEST_TB/CBE
add wave -noupdate -format Logic /TEST_TB/FRAME_N
add wave -noupdate -format Logic /TEST_TB/IRDY_N
add wave -noupdate -format Logic /TEST_TB/TRDY_N
add wave -noupdate -format Logic /TEST_TB/STOP_N
add wave -noupdate -format Logic /TEST_TB/DEVSEL_N
add wave -noupdate -format Logic /TEST_TB/IDSEL
add wave -noupdate -format Logic /TEST_TB/REQ_N
add wave -noupdate -format Logic /TEST_TB/GNT_N
add wave -noupdate -format Logic /TEST_TB/PERR_N
add wave -noupdate -format Logic /TEST_TB/SERR_N
add wave -noupdate -format Logic /TEST_TB/INTA_N
add wave -noupdate -format Logic /TEST_TB/PMEA_N
add wave -noupdate -divider {Core reset and reference signals}
add wave -noupdate -format Logic /TEST_TB/FPGA_RST
add wave -noupdate -format Logic /TEST_TB/FPGA_RTR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
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
update
WaveRestoreZoom {18408 ps} {26837 ps}
