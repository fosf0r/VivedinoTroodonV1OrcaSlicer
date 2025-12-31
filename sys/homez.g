; homez.g
; called to home the Z axis

M98 P"setoffset.g"
G91                 					        ; relative positioning
G1 Z5 F1500 H2      					        ; lift Z relative to current position
G90                 				          ; absolute positioning
G1 X200 Y200 F{global.maxXYspeed}	    ; go center
G30 		        					            ; home Z
