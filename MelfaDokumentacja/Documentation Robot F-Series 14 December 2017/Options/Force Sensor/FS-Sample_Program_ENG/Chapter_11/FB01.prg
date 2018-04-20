'Control mode (0) setting
P_FsStf0=(+0.00,+0.01,+0.00,+0.00,+0.00,+0.00)(0,0)	'Stiffness coefficient (Specifies Y-axis component as 0.01 [N/mm])
P_FsDmp0=(+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Damping coefficient (no specification)
P_FsMod0=(+0.00,+1.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Force sense control type (Specifies force control in Y-axis direction.)
M_FsCod0=1					'Force sense coordinate system (Specifies XYZ coordinate system.)
'	
'Control characteristics (0) setting 
P_FsGn0=(+0.00,+1.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Gain (Specifies Y-direction as 1.0 [10-3 mm/N].)
P_FsFLm0=(+20.00,+0.50,+20.00,+5.00,+5.00,+5.00)(0,0)	'Force detection setting value (Specifies Y-axis direction as 0.5 [N].)
P_FsFCd0=(+0.00,+2.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Force control (Specifies Y-axis direction as 2.0 [N].)
'
Def Act 1,M_FsLmtS=1 GoTo *XMOV,S	'Defines so that interrupt processing performed if force detection setting value exceeded.
FsLog On				'Starts collecting force sense log.
Fsc On,0,0,1			'Enables force sense control with control mode=0, control characteristics=0, and offset cancel enabled.
P1=P_Curr
P1.Y=P1.Y+200
Spd 5
Act 1=1
Mvs P1		'Performs interrupt processing if contact with the target object is made during movement.
Fsc Off		'Disables force sense control.
FsLog Off,7	'Ends force sense log collection and creates log file No.7.
Act 1=0
End
'
'Interrupt processing
*XMOV
P2=P_FsCurPr
P2.X=P2.X+100	'Sets position +100 mm in X-axis direction from current position as target position.
FsGChg 5,100,2	'Changes the gain to the control characteristics 2 (parameter) setting value over 100 ms from the interpolation progress rate 5% position.
Mvs P2		'Moves in the X-axis direction while applying 2.0 [N] of force in the Y-axis direction.
Fsc Off		'Disables force sense control.
FsLog Off,7	' Ends force sense log collection and creates log file No.7.
FsOutLog 7	'Transfers log file No.7 to the computer by FTP.
End
