Åe[Control mode (0)]
P_FsStf0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Stiffness coefficient [N/mm]
P_FsDmp0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Damping coefficient
P_FsMod0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)  	'Force control mode (all axis position control)
M_FsCod0 = 0						'Force sense control coordinate system (tool)
Åe[Control characteristics (0)]
P_FsGn0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)  	'Force control gain [É m/N]
P_FsFLm0 = (+200.00,+200.00,+10.00,+7.0,+7.0,+7.0)(0,0)	'Force detection setting value [N] 
P_FsFCd0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Force command
P_FsSpd0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Sets speed control mode speed.
P_FsSwF0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Sets force/speed judgment value.
'*** <Spring constant calculation> ***
Mvs PStart						'Robot moves above start position.
Spd 10							
Fsc On,0,0,1	'Force control is enabled. 
Fine 100							'Robot waits until positioning movement is complete.
Mvs PEnd
MFD=P_FsCurD.Z-P_FsLmtD.Z				ÅeForce displacement calculation (N)
MPD=Abs(P_Fbc.Z-P_FsLmtP.Z)				ÅeSpring displacement calculation (mm)
MSR=MFD/MPD						ÅeSpring constant is calculated (N/mm).
Fsc Off							' Force sense control is disabled.
End
