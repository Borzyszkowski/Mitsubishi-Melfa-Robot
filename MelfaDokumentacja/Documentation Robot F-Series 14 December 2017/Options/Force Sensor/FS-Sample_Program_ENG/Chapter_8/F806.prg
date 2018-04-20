Åe[Control mode (0)]
P_FsStf0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Stiffness coefficient [N/mm]
P_FsDmp0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Damping coefficient
P_FsMod0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)  	'Force control mode (All axis position control)
M_FsCod0 = 0						'Force sense control coordinate system (tool)
Åe[Control characteristics (0)]
P_FsGn0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)  	'Force control gain [É m/N]
P_FsFLm0 = (+50.00,+50.00,+50.00,+0.50,+0.50,+0.50)(0,0)  	'Force detection setting value [N] 
P_FsFCd0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Force command
P_FsSpd0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Sets speed control mode speed.
P_FsSwF0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Sets force/speed judgment value.
'*** <Interrupt> ***
Def Act 1, M_FsLmtS=1 GoTo *XERR, F
Spd 10
Fsc On, 0, 0, 1					 	'Force sense enable (offset cancel designation)
Act 1=1							' Act 1 is enabled.
Mvs P1							Åe
Fsc Off							'Force sense disable 
End
*XERR
Act 1=0							' Act 1 is disabled.
Error 9100						ÅeError occurrence
End
