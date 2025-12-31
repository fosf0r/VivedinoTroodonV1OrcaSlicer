; homeall.g
; called to home all axes
; u/fosf0r 2022/04/02

M106 S0 ; fans off to prevent electrical noise
G29 S2  ; clear height map, this MUST happen right before M581 and/or G28

; reset LED
M98 P"ledwhite.g"

; raise Z for safety
G91 ; relative positioning
G1 H2 Z5 F1500             ; lift Z relative to current position
G90 ; absolute positioning

; Y
M98 P"homey.g"
; X
M98 P"homex.g"
; Z
M98 P"homez.g"

M375 P"heightmap.csv"        ; load the heightmap
M98 P"ledflashgreen.g"
