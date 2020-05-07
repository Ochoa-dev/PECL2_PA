(define (problem robotProblema1) (:domain robot)
(:objects 
robot1 - rob
zonaA zonaB zonaC base - zona

)

(:init
    (=(cantidad-bateria robot1) 80)
    (=(limite-carga)110)
    (=(espacio-zona zonaA)6)
    (=(distancia-recorrida base zonaA)12)
    (=(distancia-recorrida-base zonaA base)12)
    (=(deposito)0)
    (robot-at robot1 base) (cesped-alto zonaA )
)

(:goal (and
    (not(cesped-alto zonaA))
))

    
    (:metric 
        minimize (total-time)
    )
)
