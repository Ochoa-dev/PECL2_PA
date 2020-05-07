(define (problem cooperationProblem) (:domain cooperation)
(:objects 

X1 X2 X3 X4 X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 X20 - x
Y1 Y2 Y3 Y4 Y5 Y6 Y7 Y8 Y9 Y10 Y11 Y12 Y13 Y14 Y15 Y16 Y17 Y18 Y19 Y20 - y
leader - ugv
follower - uav
n0 n1 - modo
P_0 P_45 P_90 P_135 P_180 P_225 P_270 P_315 - pan
T_0 T_45 T_90 T_270 T_315 - tilt
)

(:init
    (=(cantidad-bateria leader) 200)
    (=(cantidad-bateria follower) 100)
    (=(coste-mover leader X1 Y1) 1) (=(coste-mover leader X1 Y2) 2) (=(coste-mover leader X1 Y3) 3) ;;pondremos solamente algunas para comprobar que funciona
    (=(coste-mover leader X5 Y9) 14) (=(coste-mover leader X16 Y13) 29) (=(coste-mover leader X5 Y5) 10)

    (=(coste-mover follower X1 Y1) 2) (=(coste-mover follower X1 Y2) 4) (=(coste-mover follower X1 Y3) 6)
    (=(coste-mover follower X5 Y9) 28) (=(coste-mover follower X16 Y13) 29) (=(coste-mover follower X5 Y5) 20)

    (=(modo-nave n0) 1) (=(modo-nave n1) 2)

    (=(coste-foto leader)3 )  (=(coste-foto follower)5) 

    (=(coste-mover-camara leader P_0 T_0 ) 0) (=(coste-mover-camara leader P_0 T_45 ) 2)  (=(coste-mover-camara leader P_0 T_90 ) 4) (=(coste-mover-camara leader P_0 T_270 ) 7) 
    (=(coste-mover-camara leader P_45 T_0 ) 2)
    (=(coste-mover-camara follower P_0 T_0 ) 0) (=(coste-mover-camara follower P_0 T_45 ) 3) (=(coste-mover-camara follower P_0 T_90 ) 7) (=(coste-mover-camara follower P_0 T_270 ) 11) 
    (=(coste-mover-camara follower P_45 T_0 ) 3)

    (=(limite-carga leader)200)
    (=(limite-carga follower) 150)

    (en-base leader X6 Y10) (en-base follower X10 Y2)

    (nave-en leader X6 Y10) (nave-en follower X10 Y2)
    (nave-en-modo leader n0) (nave-en-modo follower n0)

    (posicion-camara leader P_0 T_0) (posicion-camara follower P_0 T_0)




)

(:goal (and
    (nave-en leader X5 Y9) (foto-tomada leader P_0 T_0)
     (nave-en follower X16 Y13) (foto-tomada follower P_0 T_0)
))


(:constraints 
    (and (preference p1 (always(not(nave-en follower X6 Y10)))) 
         (preference p2 (sometime(not(nave-en leader X10 Y2))))
         )
)

(:metric minimize (+(* 10 (is-violated p1)) (* 5 (is-violated p2))))
)
