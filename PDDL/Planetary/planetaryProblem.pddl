(define (problem planetaryProblem)

    (:domain 
        planetary
    )
    
    (:objects 
     rover1 - rover
     sitio1 sitio2 sitio3 sitio4 sitio5 tierra - posicion 
     objeto1 objeto2 - objeto

    )
    
    (:init
    (=(cantidad-bateria rover1) 30)
    (=(limite-carga) 50)
    (en rover1 sitio1)
    (puede-moverse sitio1 sitio2)(puede-moverse sitio2 sitio3)(puede-moverse sitio3 sitio4)(puede-moverse sitio4 sitio5)

    )
    
    (:goal
        (and (hacer-foto sitio2) (perforar sitio3) (comunicar rover1 tierra) (analizar rover1 objeto1))
  
            
            
    )
    
    (:metric 
        minimize (total-time)
    )
)