; unload:
; u/fosf0r 2023/05/21

M98 P"Ledwhite.g"  ; reset LED
M106 S0            ; fans off

T0                 ; Switch nozzle from Standby temp to Active temp

M98 P"ledorange.g" ; heating up
M116 P0            ; Wait for nozzle to reach Active temp before doing the extrusion...
G1 E-1.0 F1800 	   ; retract 1mm
G4 S2              ; wait a few seconds
m98 pledflashgreen.g ; blip
m98 pledflashgreen.g ; blip
m98 pledflashgreen.g ; blip
G4 S1              ; wait a second
M98 P"Ledwhite.g"  ; reset LED
G1 E-20 F300 	     ; Retract 20mm at 5mm/s
G1 E-80 F1800 	   ; Retract 100mm at 30mm/s (all the way out)

; cool off:
M140 H0 S-9999999  ; turn bed off
M568 A0 	    	   ; nozzle off
M106 S255		       ; turn fan on
