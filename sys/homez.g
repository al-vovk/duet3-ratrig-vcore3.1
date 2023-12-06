

G91                     ; Relative positioning
G1 H2 Z5 F6000          ; Lift Z relative to current position

G90                     ; Absolute positioning
G1 X100 Y100 F1000     ; Go to the center of the bed (300x300)
G30                     ; Home Z by probing the bed

; Uncomment the following lines to lift Z after probing
G91                     ; Relative positioning
G1 Z5 F100              ; Lift Z relative to current position
G90                     ; Absolute positioning