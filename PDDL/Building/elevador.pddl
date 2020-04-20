;Header and description

(define (domain elevador)

;remove requirements that are not needed
(:requirements :strips  :typing :fluents :durative-actions :negative-preconditions)

(:types  elevador persona numero - object
        e-lento e-rapido - elevador

)


(:predicates 
(puede-llegar ?e - elevador ?p1 - numero)
(en ?e - elevador ?p1 - numero)
(encima ?p1 ?p2 - numero)
(persona-en ?p - persona ?pl - numero)
(personas-en-elevador ?e - elevador ?n - numero)
(siguiente ?n1 ?n2 - numero)
(soporta ?e - elevador ?n - numero)
(en-elevador ?p - persona ?e - elevador)

)


(:functions  
      (elevador-rapido ?p1  ?p2 - numero)
      (elevador-lento ?p1  ?p2 - numero)
      

)

(:durative-action subir-rapido
    :parameters (?e - e-rapido ?p1 ?p2 - numero)
    :duration (= ?duration (elevador-rapido ?p1 ?p2))
    :condition (and 
        (at start (and (en ?e ?p1) (encima ?p1 ?p2) (puede-llegar ?e ?p2)
        ))
    )
    :effect (and 
        (at start (and (not(en ?e ?p1))
        ))
        (at end (and (en ?e ?p2) 
        ))
    )
)



(:durative-action subir-lento
    :parameters (?e - e-lento ?p1 ?p2 - numero)
    :duration (= ?duration (elevador-lento ?p1 ?p2))
    :condition (and 
        (at start (and (en ?e ?p1) (encima ?p1 ?p2) (puede-llegar ?e ?p2)
        ))
    )
    :effect (and 
        (at start (and (not(en ?e ?p1))
        ))
        (at end (and (en ?e ?p2) 
        ))
    )
)


(:durative-action bajar-rapido
    :parameters (?e - e-rapido ?p1 ?p2 - numero)
    :duration (= ?duration (elevador-rapido ?p2 ?p1))
    :condition (and 
        (at start (and (en ?e ?p1) (encima ?p2 ?p1) (puede-llegar ?e ?p2)
        ))
    )
    :effect (and 
        (at start (and (not(en ?e ?p1))
        ))
        (at end (and (en ?e ?p2) 
        ))
    )
)

(:durative-action bajar-lento
    :parameters (?e - e-lento ?p1 ?p2 - numero)
    :duration (= ?duration (elevador-lento ?p2 ?p1))
    :condition (and 
        (at start (and (en ?e ?p1) (encima ?p2 ?p1) (puede-llegar ?e ?p2)
        ))
    )
    :effect (and 
        (at start (and (not(en ?e ?p1))
        ))
        (at end (and (en ?e ?p2) 
        ))
    )
)


(:durative-action entrar
    :parameters (?persona - persona ?e - elevador ?p - numero ?num1 ?num2 - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (and  (persona-en ?persona ?p) (personas-en-elevador ?e ?num1) (siguiente ?num1 ?num2) (soporta ?e ?num2) 
        ))
        (over all (and (en ?e ?p)
        ))

    )
    :effect (and 
        (at start (and (not(persona-en ?persona ?p)) (not(personas-en-elevador ?e ?num1))
        ))
        (at end (and (en-elevador ?persona ?e)(personas-en-elevador ?e ?num2)
        ))
    )
)

(:durative-action salir
    :parameters (?persona - persona ?e - elevador ?p - numero ?num1 ?num2 - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (and  (en-elevador ?persona ?e) (personas-en-elevador ?e ?num1) (siguiente ?num2 ?num1) 
        ))
        (over all (and (en ?e ?p)
        ))

    )
    :effect (and 
        (at start  (and (not(personas-en-elevador ?e ?num1)) (not(en-elevador ?persona ?e)
        )))
        (at end (and  (personas-en-elevador ?e ?num2) (persona-en ?persona ?p)))

    )
)


)








