Åe[Control mode (0)]
P_FsStf0 = (+0.00,+0.10,+0.00,+0.00,+0.00,+0.00)(0,0)	'Stiffness coefficient [N/mm]
P_FsDmp0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Damping coefficient
P_FsMod0 = (+1.00,+1.00,+0.00,+0.00,+0.00,+0.00)(0,0)  	'Force sense control mode (X, Y-axis force control)
M_FsCod0 = 1						'Force sense control coordinate system (XYZ)
Åe[Control characteristics (0)]
P_FsGn0 = (+2.00,+2.00,+0.00,+0.00,+0.00,+0.00)(0,0)  	'Force control gain [É m/N]
P_FsFLm0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)  	'Force detection setting value [N] 
P_FsFCd0 = (-5.00,+5.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Force command
P_FsSpd0 = (+0.00,+10.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Sets speed control mode speed.
P_FsSwF0 = (+0.00,+3.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Sets force/speed judgment value.
Åe[Control characteristics (-1)]
P_FsGn1 = (+2.00,+2.00,+0.00,+0.00,+0.00,+0.00)(0,0)  	'Force control gain [É m/N]
P_FsFLm1 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)  	'Force detection setting value [N] 
P_FsFCd1 = (+5.00,+5.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Force command
P_FsSpd1 = (+10.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Sets speed control mode speed.
P_FsSwF1 = (+3.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Sets force/speed judgment value.
'*** <Force control-force direction change> ***
Def MoTrg 1, P_FsCurD.Y>4.5			ÅeMo trigger 1 definition: Force sensor data Fy>4.5N
Mvs PStart						ÅeMoves to start position.
Dly 1							ÅeWait until robot completely stopped.
Fsc On, 0, 0, 1					 	'Force sense enable
FsCTrg 1, 100,-1,30,0,1					ÅeSpecify control characteristics change with Mo trigger 1.
*LBL1: If P_FsCurD.X < 4.5 Then GoTo *LBL1
Fsc Off							'Force sense disable 
End
