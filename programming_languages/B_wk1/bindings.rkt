#lang racket

(define x 4)
(define f (lambda (z) (* x z)))
(define c (+ x 4))
(f 4)
(set! x 10)
(f 4)


(define y (cons 14 null))
(define z (cons 14 (cons 89 (cons 56 0))))
