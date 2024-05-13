transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/GitHub/PROJ300/Project\ Files/PROJ300_Edmonds {C:/GitHub/PROJ300/Project Files/PROJ300_Edmonds/LED_7seg.v}
vlog -sv -work work +incdir+C:/GitHub/PROJ300/Project\ Files/PROJ300_Edmonds {C:/GitHub/PROJ300/Project Files/PROJ300_Edmonds/Q_TRIAL.sv}
vlog -sv -work work +incdir+C:/GitHub/PROJ300/Project\ Files/PROJ300_Edmonds {C:/GitHub/PROJ300/Project Files/PROJ300_Edmonds/Q_LEARN_V2.sv}
vlog -sv -work work +incdir+C:/GitHub/PROJ300/Project\ Files/PROJ300_Edmonds {C:/GitHub/PROJ300/Project Files/PROJ300_Edmonds/NEW_Q.sv}
vlog -sv -work work +incdir+C:/GitHub/PROJ300/Project\ Files/PROJ300_Edmonds {C:/GitHub/PROJ300/Project Files/PROJ300_Edmonds/MAXQ_REWARD.sv}
vlog -sv -work work +incdir+C:/GitHub/PROJ300/Project\ Files/PROJ300_Edmonds {C:/GitHub/PROJ300/Project Files/PROJ300_Edmonds/INIT_Q.sv}
vlog -sv -work work +incdir+C:/GitHub/PROJ300/Project\ Files/PROJ300_Edmonds {C:/GitHub/PROJ300/Project Files/PROJ300_Edmonds/BLOCKED_STATES.sv}
vlog -sv -work work +incdir+C:/GitHub/PROJ300/Project\ Files/PROJ300_Edmonds {C:/GitHub/PROJ300/Project Files/PROJ300_Edmonds/PWM_SERVO_CONTROL.sv}
vlog -sv -work work +incdir+C:/GitHub/PROJ300/Project\ Files/PROJ300_Edmonds {C:/GitHub/PROJ300/Project Files/PROJ300_Edmonds/ANGLE_OUTPUT_UNIT.sv}
vlog -sv -work work +incdir+C:/GitHub/PROJ300/Project\ Files/PROJ300_Edmonds {C:/GitHub/PROJ300/Project Files/PROJ300_Edmonds/ANGLE_DECODE.sv}
vlog -sv -work work +incdir+C:/GitHub/PROJ300/Project\ Files/PROJ300_Edmonds {C:/GitHub/PROJ300/Project Files/PROJ300_Edmonds/TIMER.sv}
vlog -sv -work work +incdir+C:/GitHub/PROJ300/Project\ Files/PROJ300_Edmonds {C:/GitHub/PROJ300/Project Files/PROJ300_Edmonds/Q_TRIAL_EXPLOIT.sv}
vlog -sv -work work +incdir+C:/GitHub/PROJ300/Project\ Files/PROJ300_Edmonds {C:/GitHub/PROJ300/Project Files/PROJ300_Edmonds/ACTION_EXPLOIT.sv}
vlog -sv -work work +incdir+C:/GitHub/PROJ300/Project\ Files/PROJ300_Edmonds {C:/GitHub/PROJ300/Project Files/PROJ300_Edmonds/Q_Exploit.sv}
vlog -sv -work work +incdir+C:/GitHub/PROJ300/Project\ Files/PROJ300_Edmonds {C:/GitHub/PROJ300/Project Files/PROJ300_Edmonds/TOP_LEVEL.sv}

