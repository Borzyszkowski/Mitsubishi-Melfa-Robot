Åe[Control mode (0)]
P_FsStf0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)	'Stiffness coefficient [N/mm] ? No setting required
P_FsDmp0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0) 	'Damping coefficient
P_FsMod0 = (+0.00,+0.00,+1.00,+0.00,+0.00,+0.00)(0,0)  	'Force sense control mode (Z-axis force control)
M_FsCod0 = 0						'Force sense control coordinate system (tool)
Åe[Control characteristics (0)]
P_FsGn0 = (+0.00,+0.00,+30.00,+0.00,+0.00,+0.00)(0,0)  	'Force control gain [É m/N]
P_FsFLm0 = (+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(0,0)  	'Force detection setting value [N] ? No setting required
P_FsFCd0 = (+0.00,+0.00,+10.00,+0.00,+0.00,+0.00)(0,0) 	'Force command
P_FsSpd0 = (+0.00,+0.00,+5.00,+0.00,+0.00,+0.00)(0,0)	'Sets speed control mode speed.
P_FsSwF0 = (+0.00,+0.00,+2.50,+0.00,+0.00,+0.00)(0,0) 	'Mode switching judgment value (switch threshold FZt=2.5N)
'*** <Force control (force-speed hybrid)> ***
Servo On
Mov PStart						'Move to start point.
Dly 1
Fsc On,0,0,1 						'Force sense control enabled (drop start with force control)
Dly 10
Fsc Off
End
