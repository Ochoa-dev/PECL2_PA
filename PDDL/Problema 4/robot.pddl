;Header and description

(define (domain robot)

;remove requirements that are not needed
(:requirements :strips  :typing :fluents :durative-actions :negative-preconditions)

(:types rob zona
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
        (cesped-alto ?zona - zona)
        (robot-at ?robot - rob ?zona - zona)
        (en-base)

)


(:functions
(cantidad-bateria ?robot - rob)
(limite-carga)
(espacio-zona ?zona - zona)
(distancia-recorrida ?desde ?hacia - zona)
(distancia-recorrida-base ?desde ?hacia - zona)
(deposito) 
)


(:durative-action cortar-cesped
    :parameters (?robot - rob ?zona - zona)
    :duration (= ?duration (* 2 (espacio-zona ?zona)))
    :condition (and 
        (at start (and (> (cantidad-bateria ?robot) (/(* 2 (espacio-zona ?zona))3)) (cesped-alto ?zona) (< (deposito) 100)
        ))
        (over all (robot-at ?robot ?zona))

    )
    :effect (and 
        (at start (and (decrease (cantidad-bateria ?robot) (/(* 2 (espacio-zona ?zona))3) )
        ))
        (at end (and (not(cesped-alto ?zona) ) (increase (deposito) (/(espacio-zona ?zona)4))
        ))
    )
)

   
    (:durative-action mover
      :parameters (?robot - rob  ?desde ?hacia - zona)
      :duration (= ?duration (* 3 (distancia-recorrida ?desde ?hacia))) ;1 metro = 3 seg
      :condition (and (at start (robot-at ?robot ?desde))
                        (at start (> (cantidad-bateria ?robot) (/ (* 3 (distancia-recorrida ?desde ?hacia)) 3))))
      :effect (and  
                        (at start (not(robot-at ?robot ?desde)))
                        (at start (decrease (cantidad-bateria ?robot) (/ (* 3 (distancia-recorrida ?desde ?hacia)) 3) ))
                        (at end (robot-at ?robot ?hacia) )
               )

    )

    (:durative-action mover-base
      :parameters (?robot - rob  ?desde ?hacia - zona)
      :duration (= ?duration (* 3 (distancia-recorrida-base ?desde ?hacia))) ;1 metro = 3 seg
      :condition (and (at start (robot-at ?robot ?desde))
                        (at start (> (cantidad-bateria ?robot) (/ (* 3 (distancia-recorrida-base ?desde ?hacia)) 3))))
      :effect (and  
                        (at start (not(robot-at ?robot ?desde)))
                        (at start (decrease (cantidad-bateria ?robot) (/ (* 3 (distancia-recorrida-base ?desde ?hacia)) 3) ))
                        (at end (and(en-base)(robot-at ?robot ?hacia) ))
               )

    )



    (:durative-action recargar
        :parameters (?robot - rob)
        :duration (= ?duration (* 2 (- (limite-carga) (cantidad-bateria ?robot)))) ;tarda dos unidades de tiempo por una unidad de carga
        :condition (and 
            (at start (and (< (cantidad-bateria ?robot) (limite-carga))  (en-base) ))
        )
        :effect (and 

            (at end (increase (cantidad-bateria ?robot) (- (limite-carga) (cantidad-bateria ?robot)))) ;siempre se carga al tope
        )
    )
   
   (:durative-action vaciar-deposito
       :parameters (?robot - rob)
       :duration (= ?duration 4)
       :condition (and 
           (at start (and (>(deposito) 99) (en-base)
           ))

       )
       :effect (and 
           (at start (and (decrease (cantidad-bateria ?robot) 3)
           ))
           (at end (decrease (deposito ) 100 )
           )
       )
   )
   




)