; homex.g
; called to home the X axis
;
G91               ; relative positioning
G1 H1 X410 F8000  ; move quickly to X axis endstop and stop there (first pass)
G1 X-3 F1000      ; go back a few mm
G1 H1 X410 F1000  ; move slowly to X axis endstop once more (second pass)
G1 X-10 F2000     ; go back a few mm
G90               ; absolute positioning
