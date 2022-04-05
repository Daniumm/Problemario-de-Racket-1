#lang racket
;Importamos la librería para usar while loops en el último ejercicio
(require dyoo-while-loop)

;Daniel Alejandro Martínez Rosete A01654093
;Problemario 1

;Función 1
;En esta función solo se aplicó la formula de fahrenheit a celsius
(printf "Función 1\n\n")
(define fahrenheit-to-celsius
  (lambda (temp)
    (/ (* (- temp 32) 5) 9)
    ))

;Función 1 Ejemplos
(fahrenheit-to-celsius 212)
(fahrenheit-to-celsius 32)
(fahrenheit-to-celsius -40)


;Función 2
;En esta función solo se usó una serie de if para checar si un número es negativo, positivo o cero
(printf "\n\nFunción 2\n\n")
(define sign
  (lambda (num)
    (if (< num 0)  
    -1   
    (if (> num 0)    
    1   
    0))
    ))

;Función 2 Ejemplos
(sign -5)
(sign 10)
(sign 0)


;Función 3
;En esta función solo se usó la fórmula para sacar raíces de ecuaciones cuadraticas (Chicharronera)
(printf "\n\nFunción 3\n\n")
(define roots
  (lambda (a b c)
    (/ (+ (sqrt (- (expt b 2) (* 4 (* a c)) )) (- b)) (* 2 a))
    ))

;Función 3 Ejemplos
(roots 2 4 2)
(roots 1 0 0)
(roots 4 5 1)

;Función 4
;En esta función se define primero el bmi de la persona colocando el peso y la altura en la formula y checando con if en que categoria cae
(printf "\n\nFunción 4\n\n")
(define bmi
  (lambda (weight height)
    (define bmiVar (/ weight (expt height 2) ))
    
    (if (< bmiVar 20)  
    "underweight"
    
    (if (< bmiVar 25)  
    "normal"

    (if (< bmiVar 30)  
    "obese1"

    (if (< bmiVar 40)  
    "obese2"

    (if (>= bmiVar 40)  
    "obese3"

    "error"
    
    )))))


    ))

;Función 4 Ejemplos
(bmi 45 1.7)
(bmi 55 1.5)
(bmi 76 1.7)
(bmi 81 1.6)
(bmi 120 1.6)


;Función 5
;Esta función saca el factorial de un numero usando un for/product que multiplica los valores de i dentro del for y saca el resultado
(printf "\n\nFunción 5\n\n")
(define factorial
  (lambda (n)
    
    
    
    
    (if (= n 0)  
    1
    (if (= n 1)  
    1

    (for/product ([i (in-range 1 (+ n 1))]) i)
    ))
    
    
    ))

;Función 5 Ejemplos
(factorial 0)
(factorial 5)
(factorial 40)



;Función 6
;Aquí hay dos funciones, una que inserta un elemeto a la lista en cierta posición y otra que duplica cada elemento de la lista dentro de si misma para esto creamos una nueva lista donde inserte dos veces cada punto de la lista anterior
(printf "\n\nFunción 6\n\n")

(define (addPos lst pos x)
  (define-values (before after) (split-at lst pos))
  (append before (cons x after)))

(define duplicate
  (lambda (lst)

    (define newLst '())
    (for ([i (in-list lst)])
      (set! newLst (append newLst (list i)))
      (set! newLst (append newLst (list i)))

    
    )
    
    newLst))

;Función 6 Ejemplos
(duplicate '())
(duplicate '(1 2 3 4 5))
(duplicate '(a b c d e f g h))



;Función 7
; Esta función agarra dos argumentos y eleva 'a' a la 'b' por lo que para esto defini un resultado como 1 y con un for fui acumulando las multiplicaciones dentro de resultado
(printf "\n\nFunción 7\n\n")

(define pow
  (lambda (a b)
    
    (define result 1)

    (for ([i b])

          (set! result (* result a))

    )

    (if (= b 0)

        (set! result 1)
    
        result
    
    )
    
    result))

;Función 7 Ejemplos
(pow 5 0)
(pow -5 3)
(pow 15 12)


;Función 8
;Esta función te devuelve el nth número de la secuencia de fibonacci para eso defini el número antepasado como 0, el pasado como 1 y el actual como 0 y en un for vamos sumando los pasados y los ponemos dentro del actual para asi, si el numero es menor o igual a 1 se regresa n y si no el resultado del for
(printf "\n\nFunción 8\n\n")

(define fib
  (lambda (n)

    (define past2 0)
    (define past 1)
    (define current 0)

    (for ([i (in-range 1 n)])

      (set! current (+ past2 past))
      (set! past2 past)
      (set! past current)

      )

    (if (= n 0)

        (set! current n)

        (if (= n 1)

            (set! current n)

            (+ 1)
       ))
    
    current))

;Función 8 Ejemplos
(fib 6)
(map fib (range 10))
(fib 42)


;Función 9
;La función enlist hace algo muy parecido a la funcion duplicate pero en vez de duplicarlo solo se agrega a la nueva lista los elementos dentro de nuevas listas
(printf "\n\nFunción 9\n\n")

(define enlist
  (lambda (lst)

    (define newLst '())
    (for ([i (in-list lst)])
      (set! newLst (append newLst (list (list i))))
      

    
    )
    
    newLst))

;Función 9 Ejemplos
(enlist '())
(enlist '(a b c))
(enlist '((1 2 3) 4 (5) 7 8))



;Función 10
;En esta función se recibe una lista y se regresa una nueva lista con solo números positivos, para esto solo use la función filter con la condición positive?
(printf "\n\nFunción 10\n\n")

(define positives
  (lambda (lst)

    (filter positive? lst)
    
    ))

;Función 10 Ejemplos
(positives '())
(positives '(12 -4 3 -1 -10 -13 6 -5))
(positives '(-4 -1 -10 -13 -5))



;Función 11
;En esta función es sumar todos los elementos de una lista para esto use el for/sum que suma todos los elementos automaticamente
(printf "\n\nFunción 11\n\n")

(define add-list
  (lambda (lst)

    (for/sum ([i lst]) i)
    
    ))

;Función 11 Ejemplos
(add-list '())
(add-list '(2 4 1 3))
(add-list '(1 2 3 4 5 6 7 8 9 10))


;Función 12
;Aqui es invertir los pares que nos dan y para esto use una función map que aplica para todas las parejas y les aplique reverse
(printf "\n\nFunción 12\n\n")

(define invert-pairs
  (lambda (lst)

    (map reverse lst)
    
    ))

;Función 12 Ejemplos
(invert-pairs '())
(invert-pairs '((a 1)(a 2)(b 1)(b 2)))
(invert-pairs '((January 1)(February 2)(March 3)))


;Función 13
;En esta función definí si la lista era de simbolos o no, checando con un for cada elemento si era simbolo y si no era el resultado se pone el resultado en falso
(printf "\n\nFunción 13\n\n")

(define list-of-symbols?
  (lambda (lst)

    (define result #t)

    (for ([i (in-list lst)])
      
      (if (symbol? i)

          (+ 1)
          
          (set! result #f)


          )
      
    
    )
    result))

;Función 13 Ejemplos
(list-of-symbols? '())
(list-of-symbols? '(a b c d e))
(list-of-symbols? '(a b c d 42 e))


;Función 14
;En esta función se reciben 3 argumentos, dos elementos de la lista y una lista y se tienen que intercambiar para esto solo checo si es a lo cambio a 'b', si es b lo cambio a 'a' y si no lo dejo igual
(printf "\n\nFunción 14\n\n")

(define swapper
  (lambda (a b lst)


    (define newLst '())
    (for ([i (in-list lst)])

      (if (= i a)
      
          (set! newLst (append newLst (list b)))

      (if (= i b)

          (set! newLst (append newLst (list a)))

          (set! newLst (append newLst (list i)))
      

      ))
    )
    
    newLst))

;Función 14 Ejemplos
(swapper 1 2 '())
(swapper 1 2 '(4 4 5 2 4 8 2 5 6 4 5 1 9 5 9 9 1 2 2 4))
(swapper 1 2 '(4 3 4 9 9 3 3 3 9 9 7 9 3 7 8 7 8 4 5 6))



;Función 15
;En esta función se calcula el producto punto de ambas listas utilizando un for y sacando los valores de la lista usando list-ref y se acumula todo en sum
(printf "\n\nFunción 15\n\n")

(define dot-product
  (lambda (a b)
    
    (define sum 0)
    (for ([i (length a)])

      (set! sum (+ sum (* (list-ref a i) (list-ref b i))))




      )

    sum))

;Función 15 Ejemplos
(dot-product '() '())
(dot-product '(1 2 3) '(4 5 6))
(dot-product '(1.3 3.4 5.7 9.5 10.4) '(-4.5 3.0 1.5 0.9 0.0))




;Función 16
;En esta función se calcula el promedio de todos los elementos de la lista sumandolos y dividiendolos entre la longitud de la lista
(printf "\n\nFunción 16\n\n")

(define average
  (lambda (lst)
    
    (define sum 0)
    (for ([i (in-list lst)])

      (set! sum (+ sum i))




      )
    (if (= (length lst) 0)
        (+ 2)
        (set! sum (/ sum (length lst)))
       )
    sum))

;Función 16 Ejemplos
(average '())
(average '(4))
(average '(5 6 1 6 0 1 2))
(average '(1.7 4.5 0 2.0 3.4 5 2.5 2.2 1.2))





;Función 17
;En esta función saque la desviación estandar utilizando la función anterior de average luego con un for hice x menos el promedio al cuadrado para cada elemento y lo acumulé en sum luego use std para hacer la operacion final
(printf "\n\nFunción 17\n\n")

(define standard-deviation
  (lambda (lst)
    
    (define avrg (average lst))
    (define std 0)
    (define sum 0)
    
    (for ([i (in-list lst)])

      (set! sum (+ sum (expt (- i avrg) 2)))
      
       )
    (if (= (length lst) 0)
        (+ 2)
        (set! std (sqrt (/ sum (length lst)) ))
    )
    std))

;Función 17 Ejemplos
(standard-deviation '())
(standard-deviation '(4 8 15 16 23 42))
(standard-deviation '(110 105 90 100 95))
(standard-deviation '(9 2 5 4 12 7 8 11 9 3 7 4 12 5 4 10 9 6 9 4))


;Función 18
;En esta función se recibe n que es el numero de veces que se repetirá cada elemnto en la lista y la lista entonces como en funciones anteriores creamos una nueva lista y hacemos un for con la n para que se repita el numero de veces que se necesitan
(printf "\n\nFunción 18\n\n")

(define replic
  (lambda (n lst)

    (define newLst '())
    (for ([i (in-list lst)])
      
      (for ([j n])
        (set! newLst (append newLst (list i)))

        )
 

    
    )
    
    newLst))

;Función 18 Ejemplos
(replic 7 '())
(replic 0 '(a b c))
(replic 3 '(a))
(replic 4 '(1 2 3 4))



;Función 19
;En esta función expand es muy parecida a la de arriba solo que en esta usamos 2 for para que cada numero se repita el número de veces de su posición
(printf "\n\nFunción 19\n\n")

(define expand
  (lambda (lst)

    (define newLst '())
    (for ([i (in-list lst)])
      
      (for ([j (+ 1 (index-of lst i))])
        (set! newLst (append newLst (list i)))

        )
 

    
    )
    
    newLst))

;Función 19 Ejemplos
(expand '())
(expand '(a))
(expand '(1 2 3 4))
(expand '(a b c d e))




;Función 20
;En esta funcion usamos el while que es una libreria aparte para dividir el numero en dos guardando su remainder en la lista y guardando el nuevo numero otra vez para repetir el proceso hasta que el numero sea 0
(printf "\n\nFunción 20\n\n")

(define binary
  (lambda (n)

    (define result '())
    
    (while (> n 0)
        (define bin (remainder n 2))
        (set! n (quotient n 2))
        (set! result (append (list bin) result ))
        


    )
    result))

;Función 20 Ejemplos
(binary 0)
(binary 30)
(binary 45123)

























 
