; These are some lines from the original "config.g" that you might adjust if you manage to lighten the gantry by replacing its cable chain, and/or if you put a lighter weight hotend+fan kit or whatever.
; After changing maximum speeds and acceleration, also set the global maxXYspeed if you're using my custom Troodon firmware.

M203 X18000 Y18000 Z1500 E3600 ; maximum speeds (feed rates) (mm/min)
M201 X5000 Y5000 Z400 E2000    ; set accelerations (mm/s^2).
M204 P5000 T5000               ; Set "print acceleration" and "travel acceleration"

; this will create the "{global.maxXYspeed}" variable:
if !exists(global.maxXYspeed) || global.maxXYspeed=null
	global maxXYspeed=18000
else 
	set global.maxXYspeed=18000
