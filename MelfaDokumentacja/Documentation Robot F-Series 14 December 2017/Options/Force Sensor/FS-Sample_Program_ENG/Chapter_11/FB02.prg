'Control mode (0) setting
P_FsStf0=(+0.01,+0.01,+0.00,+0.00,+0.00,+0.00)(0,0)	'Stiffness coefficient (Specifies X/Y-axis component as 0.01 [N/mm].)
P_FsDmp0=(+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Damping coefficient (no specification)
P_FsMod0=(+2.00,+2.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Force sense control type (Specifies stiffness control in X/Y-axis direction.)
M_FsCod0=0					'Force sense coordinate system (Specifies tool coordinate system.)
'
'Control characteristics (0) setting
P_FsGn0=(+80.00,+80.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Gain (Specifies X/Y-axis direction as X,Y 80 [10-3 mm/N].)
P_FsFLm0=(+20.00,+20.00,+10.00,+5.00,+5.00,+5.00)(0,0)	'Force detection setting value (Specifies Z-axis direction as 10 [N].)
P_FsFCd0=(+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Force control (no specification)
'
Def Act 1,P_FsLmtX.Z=1 GoTo *ESCP,S		' Defines so that interrupt processing performed if the force detection setting value is exceeded in Z-direction.
Mov P1					'Moves to insertion start position.
'
FsLog On		'Starts collecting force sense log.
Fsc On,0,0,1	'Enables force sense control with control mode=0, control characteristics=0, and offset cancel enabled.
Spd 5
Act 1=1
Mvs P2	'Performs the insertion movement in the Z-axis direction and performs interrupt processing if the force detection setting value is exceeded.
Fsc Off		'Disables force sense control.
FsLog Off,1	'Ends force sense log collection and creates log file No.1.
Act 1=0
End
'
'Interrupt processing
*ESCP
Fsc Off		'Disables force sense control.
Spd 50
Mvs P1		'Retreats to insertion start position.
FsLog Off,1	'Ends force sense log collection and creates log file No.1.
FsOutLog 1	'Transfers log file No.7 to the computer by FTP.
Error 9100	Elicits error L9100.
End
