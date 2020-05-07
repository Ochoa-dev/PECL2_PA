(define (problem robotProblema2) (:domain robot)
(:objects 
robot1 - rob
zonaA zonaB zonaC base - zona

)

(:init
    (=(cantidad-bateria robot1) 50)
    (=(limite-carga)110)
    (=(espacio-zona zonaA)6) (=(espacio-zona zonaB)13) (=(espacio-zona zonaC)20)
    (=(distancia-recorrida base zonaA)12)(=(distancia-recorrida base zonaB)15) (=(distancia-recorrida base zonaC)18)
    (=(distancia-recorrida-base zonaA base)12) (=(distancia-recorrida-base zonaB base)15) (=(distancia-recorrida-base zonaC base)18)
    (=(distancia-recorrida zonaA zonaB)5) (=(distancia-recorrida zonaA zonaC)9)
    (=(distancia-recorrida zonaB zonaA)5) (=(distancia-recorrida zonaB zonaA)4)
    (=(distancia-recorrida zonaC zonaA)9) (=(distancia-recorrida zonaC zonaB)4)
    (=(deposito)99)
    (robot-at robot1 base) (cesped-alto zonaA ) (cesped-alto zonaB )(cesped-alto zonaC )
)

(:goal (and
    (not(cesped-alto zonaA)) (not(cesped-alto zonaB)) (not(cesped-alto zonaC))
))

    
    (:metric 
        minimize (total-time)
    )
)
