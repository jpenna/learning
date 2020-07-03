#lang racket


(define xs (list 1 (list 2 0 8 (list 5 92 1 023 12 (list 28 12 4 5) 3 (list 12 4) 1)) 3 (list 8 3 1)))

(define (sum1 xs)
  (if (null? xs)
      0
      (if (number? (car xs))
          (+ (car xs) (sum1 (cdr xs)))
          (+ (sum1 (car xs)) (sum1 (cdr xs))))))


(define (sum2 xs)
  (cond [(null? xs) 0]
        [(number? (car xs)) (+ (car xs) (sum2 (cdr xs)))]
        [#t (+ (sum2 (car xs)) (sum2 (cdr xs)))]))


(define (max-list xs)
  (cond [(null? xs) 0]
        [(null? (cdr xs)) (car xs)]
        [#t (let ([tlans (max-list (cdr xs))])
              (if (> tlans (car xs))
                  tlans
                  (car xs)))]))