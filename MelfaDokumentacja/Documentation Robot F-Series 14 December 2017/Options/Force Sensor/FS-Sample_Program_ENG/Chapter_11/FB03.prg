'Control mode (0) setting
P_FsStf0=(+0.00,+0.00,+1.00,+0.00,+0.00,+0.00)(0,0)	'Stiffness coefficient (Specifies Z-axis component as 1 [N/mm].)
P_FsDmp0=(+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Damping coefficient (no specification)
P_FsMod0=(+0.00,+0.00,+2.00,+0.00,+0.00,+0.00)(0,0)	'Force sense control type (Specifies stiffness control in Z-axis direction.)
M_FsCod0=1					'Force sense coordinate system (Specifies XYZ coordinate system.)
'
'Control characteristics (0) setting
P_FsGn0=(+0.00,+0.00,+40.00,+0.00,+0.00,+0.00)(0,0)	'Gain (Specifies Z-axis direction as 40 [10-3 mm/N].)
P_FsFLm0=(+20.00,+20.00,+5.00,+5.00,+5.00,+5.00)(0,0)	'Force detection setting value (Specifies Z-axis direction as 5 [N].)
P_FsFCd0=(+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Force control (no specification)
'
Def Act 1,P_FsLmtR.Z=1 GoTo *PCEN,S	'Defines so that interrupt processing is performed if the Z-axis direction becomes smaller than force detection setting value.
P2=P1
P2.X=P2.X+100		'Searches for width of 100 mm in X-direction.
Fsc On,0,0,1		'Enables force sense control with control mode=0, control characteristics=0, and offset cancel enabled.
Mvs P1	'Moves to search start position (Moves approximately -10 mm in the Z-axis direction from the search plane to a low position, and then pushes in the Z-direction.)
'
Spd 5
Act 1=1
For M1=1 To 10	'Searches in 5 mm intervals in the Y-direction. Force is lost in the Z-axis direction if the robot axis drops into a hole, and therefore an interrupt is entered.
  Mvs P1
  Mvs P2
  P1.Y=P1.Y+5
  P2.Y=P1.Y
  Mvs P2
  Mvs P1
  P1.Y=P1.Y+5
  P2.Y=P1.Y
Next M1
Act 1=0
Fsc Off
End
'
'Interrupt processing
*PCEN
Dim PX(2),PY(2)
P0=P_Curr		'The position at which the robot axis falls into the hole and stops is used as a reference.
PX(1)=P0
PX(2)=P0
PY(1)=P0
PY(2)=P0
PX(1).X=P0.X+10		'The position Å}10 mm in the XY-direction from the reference position is calculated.
PX(2).X=P0.X-10
PY(1).Y=P0.Y+10
PY(2).Y=P0.Y-10
'
Fsc Off
P_FsFLm0=(+2.00,+2.00,+5.00,+5.00,+5.00,+5.00)(0,0)	'Changes the X,Y-axis direction force detection setting value to 2 [N].
Fsc On,0,0,1
MFLG=0
'
For M1=1 To 2
Mvs PX(M1) WthIf P_FsLmtR.X=1,Skip	'Moves Å}10 mm in the X-axis direction and skips if the force detection setting is exceeded.
If M_SkipCq=1 Then
PX(M1)=P_FsLmtP		'If skipped, the position at which the force detection setting value is exceeded is retained.
MFLG=MFLG+1
EndIf
Mvs P0
Fsc Off			'Force sense control is temporarily enabled to reset P_FsLmtP.
Fsc On,0,0,1
Next M1
'
For M1=1 To 2
Mvs PY(M1) WthIf P_FsLmtR.Y=1,Skip	' Moves Å}10 mm in the Y-axis direction and skips if the force detection setting is exceeded.
If M_SkipCq=1 Then
PY(M1)=P_FsLmtP		'If skipped, the position at which the force detection setting value is exceeded is retained.
MFLG=MFLG+1
EndIf
Mvs P0
Fsc Off			' Force sense control is temporarily enabled to reset P_FsLmtP.
Fsc On,0,0,1
Next M1
'
If MFLG=4 Then		'4 points are found.
  PTMP=(PX(1)+PX(2))/2
  P0.X=PTMP.X		'The X-axis direction center position is set for P0.
  PTMP=(PY(1)+PY(2))/2
  P0.Y=PTMP.Y		' The Y-axis direction center position is set for P0.
Else			'4 points are not found.
  Error 9100		'Elicits error L9100.
EndIf
End
