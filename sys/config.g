; General preferences
G90                                     ; send absolute coordinates...
M83                                     ; ...but relative extruder moves
M550 P"V-Core3"                         ; set printer name
M669 K1                                 ; CoreXY
G21                                     ; Set Units to Millimeters

; Network
M552 S1                                 ; enable network
M586 P0 S1                              ; enable HTTP
M586 P1 S0                              ; disable FTP
M586 P2 S0                              ; disable Telnet

; Drives
M569 P0.0 S1                            ; physical drive 0.0 goes forwards
M569 P0.1 S1                            ; physical drive 0.1 goes forwards
M569 P0.2 S1                            ; physical drive 0.2 goes forwards
M569 P0.3 S0                            ; physical drive 0.3 goes forwards
M569 P0.4 S0                            ; physical drive 0.4 goes forwards
M569 P0.5 S1                            ; physical drive 0.5 goes forwards
M584 X0.3 Y0.4 Z0.0:0.1:0.2 E0.5        ; set drive mapping
M350 X16 Y16 Z16 E16 I1                 ; configure microstepping with interpolation

M92 X80.00 Y80.00 Z800.00               ; set steps per mm
M906 X1600 Y1600 Z1600 I30              ; set motor currents (mA) and motor idle factor in per cent -- safe for Duet 3 mini 5+
M84 S30                                 ; Set idle timeout

M566 X400.00 Y400.00 Z6.00 E120.00 P1          ; set maximum instantaneous speed changes (mm/min)
M203 X10800.00 Y10800.00 Z1000.00 E3600.00     ; set maximum speeds (mm/min)
M201 X3000.00 Y3000.00 Z100.00 E3600.00        ; set accelerations (mm/s^2)

; Axis Limits
M208 X0 Y0 Z0 S1                               ; set axis minima
M208 X200 Y200 Z200 S0                         ; set axis maxima

; Endstops
M574 X1 S1 P"!io0.in"                      ; configure active high endstops
M574 Y1 S1 P"!io1.in"                          ; configure active high endstops
;M915 X Y S-60 F1 R0 ; stall detection
M671 X-4.5:150:304.5 Y-4.52:305:-4.52 S5       ; define positions of Z leadscrews or bed levelling screws
M557 X20:280 Y20:280 P5                        ; define 5x5 mesh grid


; EVA 2 / BMG / E3D V6

M92 E830          ; set extruder steps per mm, 0.9 angle/step (LDO Pancake)
M906 E800         ; set extruder motor current (mA) and idle factor in per cent

M308 S1 P"temp1" Y"thermistor" T100000 B4725 C7.060000e-8 A"Hotend"  
;; Run Heater PID Tune!! 
;; M307 H1 A751.5 C196.6 D4.7 S1.00 V23.9 B0

; Z-Probe
;; Inductive Probe
 M558 P5 C"io3.in" H5 F400 T5000       ; set Z probe type to unmodulated and the dive height + speeds
 G31 P500 X-30 Y-15 Z0.20               ; set Z probe trigger value, offset and trigger height, more Z means closer to the bed

; Select default tool
T0

; Pressure Advance
; M572 D0 S0.10