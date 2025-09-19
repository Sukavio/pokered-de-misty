OldRodMons:
	; level, species
      db 10, MAGIKARP
      db 7, GOLDEEN
      db 7, POLIWAG
      db 7, PSYDUCK
      db 7, HORSEA
OldRodMonsEnd:

DEF OLDROD_COUNT = (OldRodMonsEnd - OldRodMons) / 2
