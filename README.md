## To import my kit:
1) Install OrcaSlicer [https://github.com/OrcaSlicer/OrcaSlicer/releases/latest]
2) If not prompted to choose a printer, go to the Prepare tab and add a new printer, and checkmark the "**Troodon 2.0 RRF 0.4 nozzle**" printer - my kit **requires**/inherits it.
3) Then, import my kit file `TroodonV1OrcaImportKit.orca_printer`: **File**, **Import**, **Import configs**.
4) After importing, select my "**Troodon 400 v1**" printer, click the edit pencil to begin editing, go to the "**Machine G-code**" tab, and in the "Machine start G-code" field, paste in the data from the separate file `StartGcode.gcode`.  Do the same for "Machine end G-code" using `EndGcode.gcode`.
### Pressure advance warning
If you have a high flow hotend, such as a **Mosquito Magnum** (which is what I had), or a **Volcano**-like hotend, or a "**Takoto**", you ***WILL*** have to run a **Pressure Advance calibration** test for EVERY SINGLE filament you want to use, as the **K** value can range anywhere from 0.20 to 0.90. My average K value across 50 filaments is like 0.40. Printing with K left at 0.0 with one of those type of hotends will result in horrifying prints. 

(So, disable any firmware-based pressure advance setting in the firmware if not already done, and allow the slicer to send it instead, because a single static value will definitely not work in the long run. All of my settings are centered around the Mosquito Magnum, so you might have to adjust certain things.)

### Here's what my start gcode does / what you should expect when starting a print:
- If the filament isn't yet in the hotend, great - manually push the filament down the tube it into the Orbiter until it stops and feels snug, like it catches. If done correctly, when the purge routine below begins, it will grab the filament and feed itself the rest of the way into the head which is approximately 100mm (on my hotend), then it will purge out roughly 100mm. (If your filament was already all the way loaded into the hotend when starting this print, then it would end up purging a true 200mm.)
- Then it goes to my designated "PurgeZone" area (G1 X410 Y20 Z80), while the nozzle and bed heat up.
- When both are heated up sufficiently, it flashes the LEDs red 3 times to signal that the purging is about to begin. Then it purges 200mm. (Again, I have a high flow hotend, so you may want to adjust the "E" part of "G1 E200 F275" if it's too much purging. At least it won't be "not enough".)
- I use a brass brush (because I have a hardened steel nozzle) to catch the purging, and then I brush against the nozzle to make sure the nozzle is clean, before it can yank the head away to start the print.
- When the purging is complete it will flash the LEDs green 3 times to let you know the print is about to actually begin and the head is about to travel away from you (so get your arm/hand/brush out of the way before it finishes flashing green).

### Here's what my end gcode does:
- It moves up by Z+65 after the print is complete
- It plays my flashing/disco LEDs macro 3 times
- then it unloads 100mm which is enough to get it to the top of the Orbiter and allows me to just spin the filament to unroll it. About that: I cut a bowden tube-sized hole in the dead center of the ceiling plexi, and my tube feeds straight down through it. My filament is sitting on the roof in a Sunlu dryer box, so I just "wheel" the filament in the dryer box and it winds it back up easily (it may take slight force at first to get the Orbiter to let go of it). Adjust the 100mm if it isn't enough or is too much. Definitely don't leave filament loaded in the head after a print on a Troodon v1. (This unloading is the reason my start gcode purges 200m, because half of that distance is just getting the filament fed back in.)
- Goes to back right corner X400 Y400, and shuts off all the fans.

### Other things of note:

- Also included are fake "filaments" for pressure advance calibration purposes, and a process preset to go with it called "Calibration - PA Tower 0.00-0.15-0.003". Those numbers are what you have to put into Orca's pressure advance calibration dialog (when in "PA Tower" mode), for it to work with a high flow nozzle. If this test rips apart halfway up or becomes inconclusive too fast, then you (probably don't have a high flow setup and) have to shrink my range by setting the 3 numbers in the pressure advance calibration dialog to 0.00, 0.10, 0.002 (which works with Bambu and other more "normal" printers).

- I didn't setup extruder_clearance_radius worth a damn, so I suggest against doing any "by object" prints with my kit (instead choose "by layer"), unless you can figure out how to measure the clearance and fix that stuff. I'm pretty sure my kit might knock down neighboring finished prints when printing in "by object" mode because I didn't spend any time trying to set that up.

