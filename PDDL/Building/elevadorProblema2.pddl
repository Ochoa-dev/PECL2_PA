(define (problem elevadorProblema2) (:domain elevador)
(:objects 
n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 - numero
p1 p2 p3 p4  - persona
elevadorrapido - e-rapido
elevadorlento - e-lento


)

(:init
    (siguiente n0 n1)(siguiente n1 n2)(siguiente n2 n3)(siguiente n3 n4)(siguiente n4 n5)

    (encima n0 n1) (encima n0 n2) (encima n0 n3) (encima n0 n4) (encima n0 n5) (encima n0 n6) (encima n0 n7) (encima n0 n8) (encima n0 n9) 
    (encima n1 n2) (encima n1 n3) (encima n1 n4) (encima n1 n5) (encima n1 n6) (encima n1 n7) (encima n1 n8) (encima n1 n9) 
    (encima n2 n3) (encima n2 n4) (encima n2 n5) (encima n2 n6) (encima n2 n7) (encima n2 n8) (encima n2 n9)
    (encima n3 n4) (encima n3 n5) (encima n3 n6) (encima n3 n7) (encima n3 n8) (encima n3 n9)
    (encima n4 n5) (encima n4 n6) (encima n4 n7) (encima n4 n8) (encima n4 n9)
    (encima n5 n6) (encima n5 n7) (encima n5 n8) (encima n5 n9) 
    (encima n6 n7) (encima n6 n8) (encima n6 n9) 
    (encima n7 n8) (encima n7 n9) 
    (encima n8 n9) 
 
    (en elevadorrapido n4) (en elevadorlento n5)
    (persona-en p1 n0) (persona-en p2 n0) (persona-en p3 n3) (persona-en p4 n5) 

    (personas-en-elevador elevadorrapido n0) (personas-en-elevador elevadorlento n0)

    (soporta elevadorrapido n0) (soporta elevadorrapido n1) (soporta elevadorrapido n2)(soporta elevadorrapido n3)(soporta elevadorrapido n4)
    (soporta elevadorlento n0)(soporta elevadorlento n1)(soporta elevadorlento n2)(soporta elevadorlento n3)(soporta elevadorlento n4)

    (puede-llegar elevadorrapido n0)(puede-llegar elevadorrapido n2)(puede-llegar elevadorrapido n4)(puede-llegar elevadorrapido n6)(puede-llegar elevadorrapido n8)
    (puede-llegar elevadorlento n0)(puede-llegar elevadorlento n1)(puede-llegar elevadorlento n2)(puede-llegar elevadorlento n3)(puede-llegar elevadorlento n4)(puede-llegar elevadorlento n5)(puede-llegar elevadorlento n6)(puede-llegar elevadorlento n7)(puede-llegar elevadorlento n8)(puede-llegar elevadorlento n9)

  

    (=(elevador-rapido n0 n2 ) 6) (=(elevador-rapido n2 n4 ) 12) (=(elevador-rapido n4 n6 ) 18) (=(elevador-rapido n6 n8 ) 24) 
    (=(elevador-lento n0 n1 ) 11)(=(elevador-lento n1 n2 ) 22)(=(elevador-lento n2 n3 ) 33)(=(elevador-lento n3 n4 ) 44)(=(elevador-lento n4 n5 ) 55)(=(elevador-lento n5 n6 ) 66) (=(elevador-lento n6 n7 ) 77)(=(elevador-lento n7 n8 ) 88) (=(elevador-lento n8 n9 ) 99)

)

(:goal (and
    (persona-en p1 n4)
    (persona-en p2 n8)
    (persona-en p3 n0)
    (persona-en p4 n7)
))


(:metric minimize (total-time))
)
