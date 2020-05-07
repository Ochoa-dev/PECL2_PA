;Header and description

(define (domain cooperation)

;remove requirements that are not needed
(:requirements :strips  :typing :fluents :durative-actions :preferences :negative-preconditions)

(:types nave x y modo pan tilt - object
        uav ugv - nave
      
       
)



(:predicates 
    (en-base ?nave - nave ?x - x ?y - y)
    (nave-en ?nave - nave ?x - x ?y - y )
    (acoplada ?nave - nave)
    (moviendose ?nave - nave)
    (posicion-camara ?nave - nave ?pan - pan ?tilt - tilt)
    (nave-en-modo ?nave - nave ?modo - modo) 
    (foto-tomada ?nave - nave ?pan - pan ?tilt - tilt)
    (foto-transmitida ?nave - nave ?pan - pan ?tilt - tilt)
)


(:functions 
   (cantidad-bateria ?nave - nave)
   (coste-mover ?nave - nave ?x - x ?y - y)
   (modo-nave ?modo - modo)
   (coste-foto ?nave)
   (coste-mover-camara ?nave - nave ?pan - pan ?tilt - tilt)
   (limite-carga  ?nave - nave)


)


(:durative-action acoplar
    :parameters (?nave - nave ?x - x ?y - y)
    :duration (= ?duration 0)
    :condition (and 
        (over all (and (en-base ?nave ?x ?y)
        ))

    )
    :effect (and 

        (at end (and (acoplada ?nave)
        ))
    )
)


(:durative-action desacoplar
    :parameters (?nave - nave  ?x - x ?y - y)
    :duration (= ?duration 0)
    :condition (and 

        (over all (and (en-base ?nave ?x ?y)
        ))

    )
    :effect (and 

        (at end (and (not(acoplada ?nave))
        ))
    )
)


(:durative-action mover
    :parameters (?nave - nave ?x - x ?y - y ?modo - modo)
    :duration (= ?duration (/(coste-mover ?nave ?x ?y)(modo-nave ?modo)))
    :condition (and 
        (at start (and (> (cantidad-bateria ?nave) (coste-mover ?nave ?x ?y)))))
    
    :effect (and 
        (at start (and (moviendose ?nave) (decrease (cantidad-bateria ?nave) (*(coste-mover ?nave ?x ?y)(modo-nave ?modo))))
        )
        (at end (and(nave-en ?nave ?x ?y )(not(moviendose ?nave)))))
    
)

(:durative-action tomar-foto
    :parameters (?nave - nave ?pan - pan ?tilt - tilt)
    :duration (= ?duration (coste-foto ?nave))
    :condition (and 
        (at start (and (posicion-camara ?nave ?pan ?tilt )  (> (cantidad-bateria ?nave) (coste-foto ?nave)) )
        )
        (over all (and (not(moviendose ?nave))
        ))
    )
    :effect (and 
        (at start (and (decrease (cantidad-bateria ?nave) (coste-foto ?nave)
        )))
        (at end (and (foto-tomada ?nave ?pan ?tilt)
        ))
    )
)

(:durative-action cambiar-modo
    :parameters (?nave - nave ?modo - modo)
    :duration (= ?duration 0)
    :condition (and 
        (at start (and (> (cantidad-bateria ?nave) 3)
        ))

    )
    :effect (and 

        (at end (and (nave-en-modo ?nave ?modo)
        ))
    )
)



(:durative-action transmitir-foto
    :parameters (?nave - nave ?pan - pan ?tilt - tilt)
    :duration (= ?duration 0)
    :condition (and 
        (at start (and (foto-tomada ?nave  ?pan ?tilt) (> (cantidad-bateria ?nave) 2)
        ))
    )
    :effect (and 

        (at end (and (foto-transmitida ?nave ?pan ?tilt)
        ))
    )
)



(:durative-action cambiar-orientacion
    :parameters (?nave - nave ?pan - pan ?tilt - tilt)
    :duration (= ?duration (coste-mover-camara ?nave ?pan ?tilt))
    :condition (and 
        (at start (and (not(posicion-camara ?nave  ?pan ?tilt )) (> (cantidad-bateria ?nave) (coste-mover-camara ?nave ?pan ?tilt))
        ))
        (over all (and (not(moviendose ?nave)))
        )
    )
    :effect (and 
        (at start (and (decrease (cantidad-bateria ?nave) (coste-mover-camara ?nave ?pan ?tilt)
        )
        ))
        (at end (and (posicion-camara ?nave ?pan ?tilt )
        ))
    )
)


    (:durative-action recargar
        :parameters (?nave - nave)
        :duration (= ?duration (* 2 (- (limite-carga ?nave) (cantidad-bateria ?nave)))) 
        :condition (and 
            (over all (and  (not(moviendose ?nave)  
            )))
            (at start (< (cantidad-bateria ?nave) (limite-carga ?nave)))
        )
        :effect (and 

            (at end (increase (cantidad-bateria ?nave) (- (limite-carga ?nave) (cantidad-bateria ?nave)))) ;
        )
    )




)