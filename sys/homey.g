; homey.g
; called to home the Y axis
G91               ; relative positioning
G1 H1 Y408 F8000  ; move quickly to Y axis endstop and stop there (first pass)
G1 Y-3 F1000      ; go back a few mm
G1 H1 Y408 F1000  ; move slowly to Y axis endstop once more (second pass)
G1 Y-10 F2000     ; go back a few mm
G90               ; absolute positioning
