Åe[Control mode (0)]
P_FsStf0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Stiffness coefficient [N/mm]
P_FsDmp0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Damping coefficient
P_FsMod0 = (+2.00,+2.00,+2.00,+0.00,+0.00,+0.00)(0,0)  	'Force control mode (X,Y,Z-axis force control)
M_FsCod0 = 0						'Force sense control coordinate system (tool)
Åe[Control characteristics (0)]
P_FsGn0 = (+5.00,+5.00,+5.00,+0.00,+0.00,+0.00)(0,0)  	'Force control gain [É m/N]
P_FsFLm0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)  	'Force detection setting value [N] 
P_FsFCd0 = (+0.00,+0.00,+5.00,+0.00,+0.00,+0.00)(0,0) 	'Force command (X,Y-axes: 0.0 N, Z-axis: 5.0 N)
P_FsSpd0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Sets speed control mode speed.
P_FsSwF0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Sets force/speed judgment value.
'*** <Log data acquisition> ***
Mov PStart
Dly 1
FsLog On						'Force sense log data acquisition start
Fsc On, 0, 0, 1					 	'Force sense control enable (offset cancel designation)
*LBL1: If P_FsCurD.Z < 4.5 Then Goto *LBL1					'
Fsc Off							'Force sense control enable
FsLog Off ,999						'Log file creation (File name: 999.fsl)
End	
