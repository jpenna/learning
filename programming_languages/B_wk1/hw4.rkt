
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

;; 1
(define (sequence low high stride)
      (letrec ([loop (lambda (n acc)
                       (if (< high n)
                           (reverse acc)
                           (loop (+ n stride) (cons n acc))))])
        (loop low (list))))
                           
;; 2
(define (string-append-map xs suffix)
  (map (lambda (s) (string-append s suffix)) xs))


;; 3
(define (list-nth-mod xs n)
  (cond [(< n 0) (error "list-nth-mod: negative number")]
        [(null? xs) (error "list-nth-mod: empty list")]
        [(car (list-tail xs (remainder n (length xs))))]))

;; 4
(define (stream-for-n-steps s n)
  (letrec ([loop (lambda (acc st x)
                   (let ([pair (st)])
                     (if (> x 0)
                         (loop (cons (car pair) acc) (cdr pair) (- x 1))
                         (reverse acc))))])
    (loop (list) s n)))

;; 5
(define (funny-number-stream)
  (letrec ([f (lambda (next)          
           (cons (if (= (remainder next 5) 0) (- 0 next) next) (lambda () (f (+ next 1)))))])
    (f 1)))

;; 6
(define (dan-then-dog)
  (letrec ([f (lambda (next)
                (if (= next 0)
                    (cons "dan.jpg" (lambda () (f 1)))
                    (cons "dog.jpg" (lambda () (f 0)))))])
    (f 0)))

;; 7
(define (stream-add-zero s)
  (letrec ([f (lambda (stream)
                (let ([val (stream)])
                  (cons (cons 0 (car val)) (lambda () (f (cdr val))))))])
    (lambda () (f s))))

;; 8
(define (cycle-lists xs ys)
  (letrec ([get-next (lambda (ls full) (if (null? (cdr ls)) full (cdr ls)))]
           [f (lambda (_xs _ys)
                (cons (cons (car _xs) (car _ys)) (lambda () (f (get-next _xs xs) (get-next _ys ys)))))])
    (lambda () (f xs ys))))

;; 9
(define (vector-assoc v vec)
  (letrec ([length (vector-length vec)]
           [search (lambda (pos)
                     (cond [(= length pos) #f]
                           [(and
                             (pair? (vector-ref vec pos))
                             (equal? (car (vector-ref vec pos)) v)
                            ) (vector-ref vec pos)]
                           [#t (search (+ pos 1))]))])
    (search 0)))

;; 10
(define (cached-assoc xs n)
  (let* ([cache (make-vector n #f)]
         [max (- n 1)]
         [pos 0]
         [update-position (lambda () (set! pos (if (< pos max) (+ pos 1) 0)))]
         [search-and-add (lambda (v)
                          (let ([found (assoc v xs)])
                            (if found
                                (begin (vector-set! cache pos found) (update-position) found)
                                #f)))])
    (lambda (v)
      (let ([found (vector-assoc v cache)])
        (if found found (search-and-add v))))))

;; challenge
(define-syntax while-less
  (syntax-rules (do)
    [(while-less e1 do e2)
     (let ([x e1])
       (letrec ([loop (lambda ()
                        (if (< e2 x) (loop) #t))])
         (loop)))]))
      
     