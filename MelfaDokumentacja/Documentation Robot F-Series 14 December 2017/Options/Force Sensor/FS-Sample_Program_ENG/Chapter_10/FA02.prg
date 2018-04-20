Åe[Control mode (0)]
P_FsStf1 = (+0.00,+0.00,+3.00,+0.00,+0.00,+0.50)(0,0)	'Stiffness coefficient [N/mm]Å@ 
P_FsDmp0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Damping coefficient
P_FsMod0 = (+2.00,+2.00,+2.00,+0.00,+0.00,+2.00)(0,0)  	'Force control mode (X,Y,Z,C: stiffness control)
M_FsCod0 = 0						'Force sense control coordinate system (tool)
Åe[Control characteristics (0)]
P_FsGn0 = (+2.50,+2.50,+2.50,+0.00,+0.00,+2.50)(0,0)  	'Force control gain [É m/N]
P_FsFLm0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.05)(0,0)  	'Force detection setting value [N] (Mz=0.05Nm)
P_FsFCd0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Force control
P_FsSpd0=(+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Sets speed control mode speed.
P_FsSwF0=(+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Sets force/speed judgment value.
Åe[Control characteristics (-1)]
P_FsGn1 = (+2.50,+2.50,+0.00,+0.00,+0.00,+3.00)(0,0)  	'Force control gain [É m/N] (Z axis=0.0[É m/N]
P_FsFLm1 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)  	'Force detection setting value [N] 
P_FsFCd1 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Force control
P_FsSpd1=(+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Sets speed control mode speed. 
P_FsSwF1=(+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Sets force/speed judgment value.
'*** <Assemby work> ***
Mvs PStart						' Robot moves over insertion position.
Dly 1
Ovrd 5
Fsc On,0,0,1						'X,Y,Z,C-axes set to stiffness control.
Mvs P1							'Robot moves to pos. pushed approx. 1 mm from assembly start pos.
Mvs P2Å@Wthif P_FsLmtR.C>0, Skip 			'C-axis is rotated and skip occurs when Mz?0.5 N?m.
If M_SkipCq = 0 Then  *LERR 				ÅfProceeds to failure processing if skip processing not performed.
FsGChg 0,10,-1    					Åf"Control characteristics" changed to "-1". (position control)
Mvs ,10							ÅeTool moved 10 mm in +Z-direction.
HOpen 1	
Fsc Off
Mvs PStart
End
*LERR							'Error processing
Error 9100
End		
