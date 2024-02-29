transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/tedmonds/Documents/GitHub/PROJ300/Project\ Files/PROJ300_Edmonds {C:/Users/tedmonds/Documents/GitHub/PROJ300/Project Files/PROJ300_Edmonds/PWM_SERVO_CONTROL.sv}
vlog -sv -work work +incdir+C:/Users/tedmonds/Documents/GitHub/PROJ300/Project\ Files/PROJ300_Edmonds {C:/Users/tedmonds/Documents/GitHub/PROJ300/Project Files/PROJ300_Edmonds/ANGLE_OUTPUT_UNIT.sv}

