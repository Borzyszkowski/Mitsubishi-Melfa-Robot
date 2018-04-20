Åe[Control mode (0)]
P_FsStf0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Stiffness coefficient [N/mm]
P_FsDmp0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Damping coefficient
P_FsMod0 = (+0.00,+0.00,+1.00,+0.00,+0.00,+0.00)(0,0)  	'Force sense control mode (Z-axis force control)
M_FsCod0 = 0						'Force sense control coordinate system (tool)
Åe[Control characteristics (0)]
P_FsGn0 = (+0.00,+0.00,+4.00,+0.00,+0.00,+0.00)(0,0)  	'Force control gain [É m/N]
P_FsFLm0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)  	'Force detection setting value [N] 
P_FsFCd0 = (+0.00,+0.00,+5.00,+0.00,+0.00,+0.00)(0,0) 	'Force command
P_FsSpd0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Sets speed control mode speed.
P_FsSwF0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Sets force/speed judgment value.
Åe[Control characteristics (-1)]
P_FsGn1 = (+0.00,+0.00,+4.00,+0.00,+0.00,+0.00)(0,0)  	'Force control gain [É m/N]
P_FsFLm1 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)  	'Force detection setting value [N] 
P_FsFCd1 = (+0.00,+0.00,+12.00,+0.00,+0.00,+0.00)(0,0) 	'Force command
P_FsSpd1 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Sets speed control mode speed.
P_FsSwF1 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Sets force/speed judgment value.
'*** <Force control (control characteristics change)> ***
Spd 10
Servo On
Mvs P1,-3						ÅeMoves to position 3 mm over contact position.
Dly 1
Fsc On, 0, 0, 1 				'Force sense control enable
Dly 3
FsGChg 50,500, -1	'Set so that control characteristics changes to -1 at 50% position. (Change time: 500 ms)
Mvs P2
Fsc Off					'Force sense disable 
End
