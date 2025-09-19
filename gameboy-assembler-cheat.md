# 📒 Game Boy ASM Cheat-Sheet (LR35902)

## 🔹 Register
**8-Bit Register**
- `A` – Akkumulator (alle Rechnungen laufen über A)
- `B, C, D, E, H, L` – allgemeine Register

**16-Bit Paare**
- `AF` = A + Flags (F-Register enthält Z,N,H,C)
- `BC`, `DE`, `HL` – Registerpaare
- `SP` – Stack Pointer
- `PC` – Program Counter

---

## 🔹 Flags (im F-Register)

| Flag | Bedeutung | Abfragbar bei Sprüngen? |
|------|-----------|--------------------------|
| **Z** | Zero – Ergebnis war 0 | ja (`z` / `nz`) |
| **N** | Subtract – letzte Operation war Subtraktion | nein |
| **H** | Half-Carry – Übertrag im unteren Nibble (Bit 3→4) | nein |
| **C** | Carry – Über-/Unterlauf oder Shift-Bit | ja (`c` / `nc`) |

Nur **Z** und **C** kannst du in Bedingungen (`jr/jp`) nutzen.

---

## 🔹 Datenbewegung
- `ld X,Y` – lade Y in X
- `ldi (hl),a` – schreibe A nach (HL), dann HL++
- `ldd (hl),a` – schreibe A nach (HL), dann HL--
- `push rr` / `pop rr` – Werte auf den Stack legen / holen

---

## 🔹 Rechnen / Logik
- `add a,r` – A = A + r (setzt C bei Überlauf >255)
- `adc a,r` – A = A + r + Carry (Mehrbyte-Additionen)
- `sub r` – A = A – r (setzt C bei Unterlauf <0)
- `sbc a,r` – A = A – r – Carry
- `and r` – A = A & r
- `or r` – A = A | r
- `xor r` – A = A ^ r
- `cp r` – vergleicht A mit r, Ergebnis bleibt in A, aber Flags werden gesetzt
- `inc r` / `dec r` – +1 / –1

---

## 🔹 Shifts & Rotates (Bitmagie)

### Rotates
- **`rlca`** – Rotate Left Circular
    - MSB → Carry und ins LSB
    - Beispiel: `1001_0110` → `0010_1101`, Carry=1

- **`rla`** – Rotate Left *through* Carry
    - MSB → Carry, Carry → LSB
    - Beispiel: A=`1001_0110`, Carry=1 → `0010_1101`, Carry=1

- **`rrca`** – Rotate Right Circular
    - LSB → Carry und ins MSB
    - Beispiel: `1001_0110` → `0100_1011`, Carry=0

- **`rra`** – Rotate Right *through* Carry
    - LSB → Carry, Carry → MSB
    - Beispiel: A=`1001_0110`, Carry=1 → `1100_1011`

### Shifts
- **`sla r`** – Shift Left Arithmetic
    - Bits nach links, LSB=0, MSB→Carry
    - „Multipliziert mit 2“

- **`sra r`** – Shift Right Arithmetic
    - Bits nach rechts, MSB bleibt gleich, LSB→Carry
    - „Division durch 2 (signed)“

- **`srl r`** – Shift Right Logical
    - Bits nach rechts, MSB=0, LSB→Carry
    - „Division durch 2 (unsigned)“

- **`swap r`** – obere/untere 4 Bit tauschen
    - Beispiel: `1001_0110` → `0110_1001`

---

## 🔹 Sprünge & Calls
- `jp addr` – Sprung absolut
- `jp z,addr` / `jp nz,addr` – wenn Zero-Flag gesetzt / nicht gesetzt
- `jp c,addr` / `jp nc,addr` – wenn Carry gesetzt / nicht gesetzt
- `jr label` – relativer Sprung (–128…+127 Byte)
- `call addr` – Funktionsaufruf
- `ret` – Rückkehr aus Call
- `reti` – Rückkehr + Interrupts aktivieren

---

## 🔹 Sonstiges
- `nop` – keine Operation
- `halt` – CPU warten bis Interrupt
- `stop` – Tiefschlaf
- `di` / `ei` – Interrupts aus / ein
- `cpl` – A invertieren
- `scf` – Carry setzen
- `ccf` – Carry invertieren
- `daa` – Decimal Adjust (für BCD)  