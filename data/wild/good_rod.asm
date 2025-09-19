GoodRodMons:
	; level, species
      db 25, GYARADOS
      db 25, GOLDEEN
      db 25, POLIWAG
      db 25, KRABBY
      db 25, HORSEA
      db 25, SQUIRTLE
      db 25, STARYU
GoodRodMonsEnd:

DEF GOODROD_COUNT = (GoodRodMonsEnd - GoodRodMons) / 2
