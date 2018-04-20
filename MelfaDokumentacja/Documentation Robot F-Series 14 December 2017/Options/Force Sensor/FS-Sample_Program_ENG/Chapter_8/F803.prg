Åe[Control mode (0)]
P_FsStf0 = (+0.10,+0.10,+0.00,+0.00,+0.00,+0.00)(0,0)	'Stiffness coefficient [N/mm]
P_FsDmp0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Damping coefficient
P_FsMod0 = (+2.00,+2.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Force control mode (X, Y-axis stiffness control)
M_FsCod0 = 0						'Force sense control coordinate system (tool)
Åe[Control characteristics (0)]
P_FsGn0 = (+20.00,+20.00,+0.00,+0.00,+0.00,+0.00)(0,0)  	'Force control gain [É m/N]
P_FsFLm0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)  	'Force detection setting value [N] 
P_FsFCd0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Force command
P_FsSpd0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Sets speed control mode speed.
P_FsSwF0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Sets force/speed judgment value.
'*** <Stiffness control (X, Y-axes)> ***
Servo On
Mov PStart
Dly 1
Fsc On, 0, 0, 1						'Force sense enable
Hlt
Fsc Off							'Force sense disable 
End
