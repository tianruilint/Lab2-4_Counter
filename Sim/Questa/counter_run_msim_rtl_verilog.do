transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FPGA/Lab2/Counter/RTL {D:/FPGA/Lab2/Counter/RTL/counter.v}

vlog -vlog01compat -work work +incdir+D:/FPGA/Lab2/Counter/Quartus_prj/../Sim {D:/FPGA/Lab2/Counter/Quartus_prj/../Sim/tb_counter.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_counter

add wave *
view structure
view signals
run 10 us
