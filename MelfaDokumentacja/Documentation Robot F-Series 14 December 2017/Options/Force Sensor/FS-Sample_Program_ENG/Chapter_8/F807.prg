Åe[Control mode (0)]
P_FsStf0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Stiffness coefficient [N/mm]
P_FsDmp0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Damping coefficient
P_FsMod0 = (+2.00,+2.00,+1.00,+0.00,+0.00,+0.00)(0,0)  	'Force control mode (X,Y: stiffness control, Z: force control)
M_FsCod0 = 0						'Force sense control coordinate system (tool)
Åe[Control characteristics (0)]
P_FsGn0 = (+2.00,+2.00,+2.00,+0.00,+0.00,+0.00)(0,0)  	'Force control gain [É m/N]
P_FsFLm0 = (+0.00,+0.00,+0.00,+0.0,+0.0,+0.0)(0,0)	  	'Force detection setting value [N] 
P_FsFCd0 = (+0.00,+0.00,+20.00,+0.00,+0.00,+0.00)(0,0) 	'Force command
P_FsSpd0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Sets speed control mode speed.
P_FsSwF0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Sets force/speed judgment value.
'*** <Interrupt> ***
Def MoTrg 1, ((P_Fbc.Z <= 5) AND (P_FsCurD.Z > 18))	'Work complete conditions defined for Mo trigger 1.
Def Act 1,M_MoTrg(1)=1 GoTo *XOK,F			'Mo trigger 1 defined as interrupt condition.
Mvs PStart						'Robot moves over insertion position.
SetMoTrg 1						'Mo trigger 1 is enabled.
Fsc On,0,0,1					'Force sense control is enabled. (Insertion started with force control.)
Act 1=1							'Interrupt processing 1 is enabled.
M_Timer(1)=0						'Timer clear
*LBL1: If M_Timer (1) < 5000 Then GoTo *LBL1		'Waits for timeout time of 5 seconds.
Fsc Off							'Force sense control is disabled.
Error 9100	'Error occurs if insertion work not complete within 5 seconds.
End
*XOK'							Insertion work complete interrupt processing
Act 1=0
SetMoTrg 0						'Mo trigger is enabled.
Fsc Off							'Force sense control is disabled.
HOpen 1
P2=P_Fbc						'Feedback position acquisition
P2.Z=P2.Z+100	'Target position determined as position +100 mm in Z-direction from current position.
Mvs P2
End
