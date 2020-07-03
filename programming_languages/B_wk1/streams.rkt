#lang racket

(define (myifbad e1 e2 e3)
  (if e1 e2 e3))

; will never end
(define badfac
  (lambda (x)
    (myifbad (= x 0)
             1
             (x * (badfac (- x 1))))))


(define (my-power-two)
  (letrec ([f (lambda (val)
             (let ([v (* val 2)])
               (cons v (lambda () (f v)))))])
    (f 1)))

(define (number-until stream tester)
  (letrec ([f (lambda (s acc)
                (let ([pr (s)])
                  (if (tester (car pr))
                      acc
                      (f (cdr pr) (+ acc 1)))))])
    (f stream 0)))

; 1 2 3 4 5 ...
(define (nats x)
  (lambda () (cons x (nats (+ x 1)))))

(define (fibonacci x)
  (letrec ([f (lambda (count acc1 acc2)
                (if (< count x)
                  (f (+ count 1) acc2 (+ acc1 acc2))
                  acc2))])
    (if (or (= x 1) (= x 2)) 1 (f 1 0 1))))

