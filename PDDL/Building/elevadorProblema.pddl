(define (problem elevadorProblema) (:domain elevador)
(:objects 
n0 n1 n2 n3 n4 n5 - numero
p1 p2 - persona
elevadorrapido - e-rapido
elevadorlento - e-lento


)

(:init
    (siguiente n0 n1)(siguiente n1 n2)(siguiente n2 n3)(siguiente n3 n4)(siguiente n4 n5)

    (encima n0 n1) (encima n0 n2) (encima n0 n3) (encima n0 n4) (encima n0 n5) 
    (encima n1 n2) (encima n1 n3) (encima n1 n4) (encima n1 n5) 
    (encima n2 n3) (encima n2 n4) (encima n2 n5) 
    (encima n3 n4) (encima n3 n5) 
    (encima n4 n5) 

    (en elevadorrapido n4) (en elevadorlento n5)
    (persona-en p1 n0) (persona-en p2 n0)

    (personas-en-elevador elevadorrapido n0) (personas-en-elevador elevadorlento n0)

    (soporta elevadorrapido n0) (soporta elevadorrapido n1) (soporta elevadorrapido n2)
    (soporta elevadorlento n0)(soporta elevadorlento n1)(soporta elevadorlento n2)

    (puede-llegar elevadorrapido n0)(puede-llegar elevadorrapido n2)(puede-llegar elevadorrapido n4)
    (puede-llegar elevadorlento n0)(puede-llegar elevadorlento n1)(puede-llegar elevadorlento n2)(puede-llegar elevadorlento n3)(puede-llegar elevadorlento n4)(puede-llegar elevadorlento n5)

  

    (=(elevador-rapido n0 n2 ) 6) (=(elevador-rapido n2 n4 ) 12) 
    (=(elevador-lento n0 n1 ) 11)(=(elevador-lento n1 n2 ) 22)(=(elevador-lento n2 n3 ) 33)(=(elevador-lento n3 n4 ) 44)(=(elevador-lento n4 n5 ) 55)

)

(:goal (and
    (persona-en p1 n4)
))


(:metric minimize (total-time))
)
