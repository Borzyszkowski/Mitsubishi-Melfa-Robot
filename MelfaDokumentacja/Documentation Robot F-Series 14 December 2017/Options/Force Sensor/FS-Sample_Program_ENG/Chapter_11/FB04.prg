M_FsCod0 (0) setting				' Specifies the tool coordinate system.
P_FsMod0 = (0, 1, 1, 0, 0, 0)(0, 0)		'Specifies a force control in the Y/Z-axis direction.

'Control characteristics group (0) setting
P_FsFCd0 = (0, 0, 5, 0, 0, 0)(0, 0)		'Specifies a force control of 5 N in the Z-axis direction.
P_FsSpd0 = (0, 0, 10, 0, 0, 0)(0, 0)		'Specifies a speed of 10 mm/s in the Z-axis direction.
P_FsSwF0 = (0, 0, 0.5, 0, 0, 0)(0, 0)		'Specifies a switching judgment value of 0.5 N in the Z-axis direction.
P_FsGn0 = (0, 0, 10, 0, 0, 0)(0, 0)		Sets a force control gain of 10*10-3 mm/N in the Z-axis direction.
	:				'No movement is made in the Y-axis direction and so 0 is specified.
	:
'Control characteristics group (-1) setting
P_FsFCd1 = (0, 3, 5, 0, 0, 0, 0, 0)(0, 0)	'Specifies a force control of 3 N in the Y-axis direction, and the Z-axis direction is left at 5 N.
P_FsSpd1 = (0, 20, 0, 0, 0, 0, 0, 0)(0, 0)	'Specifies a speed of 20 mm/s in the Y-axis direction.
				'Force control is maintained in the Z-axis direction and so 0 mm/s is specified.
P_FsSwF1 = (0, 2, 0, 0, 0, 0, 0, 0)(0, 0)	'Specifies a switching judgment value of 2 N in the Y-axis direction.
P_FsGn1 = (0, 10, 10, 0, 0, 0)(0, 0)	'Sets a force control gain of 10*10-3 mm/N in the Y-axis direction.
	:			' (Moves the robot in the Y-axis direction.)
	:
Def MoTrg 1, (P_Fbc.Z < 100) And (P_FsCurD.Z > 4.8)	'Defines Mo trigger No.1.
SetMoTrg 1					'Enables Mo trigger No.1. 
Fsc On, 0, 0, 1					'Enables force control for control characteristics 0.
Wait M_MoTrg(1) = 1	'Moves in the Z-direction until the trigger when contact is made with the target object turns ON.
Dly 3						'Waits for settling after contact.
FsCTrg 1, 100, -1					'Mo trigger No.1 is ON and so the control characteristics changed to -1.
	:				'Movement starts in the Y-axis direction while pushing with 5 N in the Z-axis direction.
	:
