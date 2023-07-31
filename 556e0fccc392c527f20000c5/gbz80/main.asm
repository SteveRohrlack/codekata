INCLUDE "hardware.inc"
DEF START EQU $150

SECTION "Header", ROM0[$100]

	di ; disable interrupts
	jp main

	ds START - @, 0 ; allocate space for logo

main:
	ld b, 4           ; signature length = 4
  ld c, 10          ; result count = 10
  ld a, 1           ; write signature to RAM, starting at C100
  ld [$C100], a
  ld [$C101], a
  ld [$C102], a
  ld [$C103], a
  jr .xbon          ; let's go

.end:               ; loop til the end of time
  jr .end

; in:
;   B: signature length
;   C: result count - max 255
;   expects signature starting at RAM C100
; out
;   none
; uses ram
;   C0FF - temporary storage for result count
.xbon:
  ld a, b           ; exit early
  cp a, c
  jr nc, .end 
  ; build xbonacci
  ld a, c           ; make result count relative (ignore signature length) and store in RAM
  sub b
  ld [$C0FF], a
  ld c, 0           ; init c as new loop counter, starting at 0
.calcNext
  ld d, 0           ; track loop to create sum in D - loop <signature length> times
  ld e, 0           ; sum up in E
  ld hl, $C100      ; initialize ram address that contains the first value to sum up (add loop counter c)
  ld a, l
  add a, c
  ld l, a
.sum
  ld a, [hl]        ; read value from RAM
  inc l             ; add 1 to lower ram address byte so the next call to .sum just has to access it
  add e             ; add value from ram to reg E
  ld e, a
  inc d             ; increment loop counter
  ld a, d           ; compare loop counter to signature length from register B
  cp a, b
  jr nz, .sum       ; continue loop if loop counter != signature length
  ld a, e           ; write sum to next ram address
  ld [hl], a
  inc c             ; increment loop counter, compare with result count (from ram)
  ld hl, $C0FF
  ld a, [hl]
  cp a, c
  jr nz, .calcNext  ; continue loop if loop counter (c) is not equal to relative result count
  jr .end           ; this is the .end... my only friend... the .end
