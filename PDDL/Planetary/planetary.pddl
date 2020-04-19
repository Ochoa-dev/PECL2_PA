(define (domain planetary)
  (:requirements :strips  :typing :fluents :durative-actions :negative-preconditions)


  (:types rover posicion objeto )
  (:predicates 
        (en ?rover - rover ?lugar - posicion )
        (puede-moverse ?desde ?hacia - posicion)
        (hacer-foto ?lugar - posicion)
        (perforar ?lugar - posicion)
        (en-movimiento ?rover)
        (comunicar ?rover - rover ?tierra - posicion)
        (analizar ?rover - rover ?objeto - objeto) 
        (extender ?rover - rover)
        (paneles-extendidos ?rover - rover)
         )


   (:functions
        (cantidad-bateria ?rover)
        (limite-carga)
    )      

   
    (:durative-action mover-rapido
      :parameters (?rover - rover ?desde ?hacia - posicion)
      :duration (= ?duration 8)
      :condition (and (at start (en ?rover ?desde))
                        (at start (> (cantidad-bateria ?rover) 10))
                        (over all(puede-moverse ?desde ?hacia) ))
      :effect (and  
                        (at start (not(en ?rover ?desde)))
                        (at start (decrease (cantidad-bateria ?rover) 10 ))
                        (at start (en-movimiento ?rover))
                        (at end (and(en ?rover ?hacia) (not(en-movimiento ?rover))))
               )

    )
    (:durative-action mover-despacio
      :parameters (?rover - rover ?desde ?hacia - posicion)
      :duration (= ?duration 13)
      :condition (and (at start (en ?rover ?desde))
                        (at start (> (cantidad-bateria ?rover) 17))
                        (over all(puede-moverse ?desde ?hacia) ))
      :effect (and  
                        (at start (not(en ?rover ?desde)))
                        (at start (decrease (cantidad-bateria ?rover) 17 ))
                        (at start (en-movimiento ?rover))
                        (at end (and(en ?rover ?hacia) (not(en-movimiento ?rover))))
               )

    )


    (:durative-action hacer-foto
        :parameters (?rover - rover ?lugar - posicion)
        :duration (= ?duration 3)
        :condition (and 
            (at start (and (en ?rover ?lugar ) (> (cantidad-bateria ?rover) 2) 
            ))
            (over all (and (en ?rover ?lugar ) (not(en-movimiento ?rover))))

        )
        :effect (and 
            (at start  (decrease (cantidad-bateria ?rover) 2)
            )
            (at end (hacer-foto ?lugar))
        )
    )


    (:durative-action perforar
        :parameters (?rover - rover ?lugar - posicion)
        :duration (= ?duration 20)
        :condition (and 
            (at start (and (en ?rover ?lugar ) (> (cantidad-bateria ?rover) 15) )
            )
            (over all (and (en ?rover ?lugar ) (not(en-movimiento ?rover)))
            )

        )
        :effect (and 
            (at start (decrease (cantidad-bateria ?rover) 15))
            (at end (perforar ?lugar))
        )
    )



    (:durative-action contactar-tierra
        :parameters (?rover - rover ?tierra - posicion)
        :duration (= ?duration 12)
        :condition (and 
        (at start (> (cantidad-bateria ?rover) 7))
            (over all (not(en-movimiento ?rover))
            )

        )
        :effect (and 
            (at start (decrease (cantidad-bateria ?rover) 7))
            
            (at end (comunicar ?rover ?tierra)
            )
        )
    )
    
    
    (:durative-action analizar
        :parameters (?rover - rover ?objeto - objeto)
        :duration (= ?duration 10)
        :condition (and 
            (at start (and (> (cantidad-bateria ?rover) 6)
            ))
            (over all (and (not(en-movimiento ?rover))
            ))

        )
        :effect (and 
            (at start (and (decrease (cantidad-bateria ?rover) 6)
            ))
            (at end (and (analizar ?rover ?objeto)
            ))
        )
    )

    (:durative-action extender-paneles
        :parameters (?rover - rover)
        :duration (= ?duration 4)
        :condition (and 
            (at start (and (> (cantidad-bateria ?rover) 1)
            ))
            (over all (and (not(en-movimiento ?rover)
            )))

        )
        :effect (and 
            (at start (and (decrease (cantidad-bateria ?rover) 1) 
            ))
            (at end (and (extender ?rover) (paneles-extendidos ?rover)
            ))
        )
    )

    (:durative-action recargar
        :parameters (?rover - rover)
        :duration (= ?duration (* 2 (- (limite-carga) (cantidad-bateria ?rover)))) ;tarda dos unidades de tiempo por una unidad de carga
        :condition (and 
            (over all (and (paneles-extendidos ?rover) (not(en-movimiento ?rover)   ;paneles extendidos y sin que se mueva
            )))
            (at start (< (cantidad-bateria ?rover) (limite-carga)))
        )
        :effect (and 

            (at end (increase (cantidad-bateria ?rover) (- (limite-carga) (cantidad-bateria ?rover)))) ;siempre se carga al tope
        )
    )
 
   
 )