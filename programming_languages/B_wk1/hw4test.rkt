#lang racket
;; Programming Languages Homework4 Simple Test
;; Save this file to the same directory as your homework file
;; These are basic tests. Passing these tests does not guarantee that your code will pass the actual homework grader

;; Be sure to put your homework file in the same folder as this test file.
;; Uncomment the line below and change HOMEWORK_FILE to the name of your homework file.
(require "hw4.rkt")

(provide (all-defined-out))
(require rackunit)

;; Helper functions
(define ones (lambda () (cons 1 ones)))
(define a 2)

(define (nats x)
  (lambda () (cons x (nats (+ x 1)))))

(define first (cached-assoc (list (cons 1 2) (cons 3 4) (cons 5 8) (cons 10 9) (cons 4 7) (cons 5 3) (cons 1 8)) 3))

(define tests
  (test-suite
   "Sample tests for Assignment 4"
   
   ; sequence test
   (check-equal? (sequence 0 5 1) (list 0 1 2 3 4 5) "Sequence test")
   (check-equal? (sequence 0 5 2) (list 0 2 4) "Sequence test")
   (check-equal? (sequence 0 9 3) (list 0 3 6 9) "Sequence test")
   (check-equal? (sequence 15 22 2) (list 15 17 19 21 ) "Sequence test")
   (check-equal? (sequence 5 3 1) (list) "Sequence test")

   ; string-append-map test
   (check-equal? (string-append-map 
                  (list "dan" "dog" "curry" "dog2") 
                  ".jpg") '("dan.jpg" "dog.jpg" "curry.jpg" "dog2.jpg") "string-append-map test")


   
   ; list-nth-mod test
   (check-equal? (list-nth-mod (list 0 1 2 3 4) 2) 2 "list-nth-mod test")
   (check-equal? (list-nth-mod (list 0 1 2 3 4) 3) 3 "list-nth-mod test")
   (check-exn exn:fail? (lambda () (list-nth-mod (list 0 1 2 3 4) -8)))
   (check-exn exn:fail? (lambda () (list-nth-mod (list) 1)))

   ; stream-for-n-steps test
   (check-equal? (stream-for-n-steps ones 2) (list 1 1) "stream-for-n-steps test")
   (check-equal? (stream-for-n-steps (nats 0) 5) (list 0 1 2 3 4) "stream-for-n-steps test")
   

   ; funny-number-stream test
   (check-equal? (stream-for-n-steps funny-number-stream 16) (list 1 2 3 4 -5 6 7 8 9 -10 11 12 13 14 -15 16) "funny-number-stream test")
   (check-equal? (stream-for-n-steps funny-number-stream 4) (list 1 2 3 4) "funny-number-stream test")
   (check-equal? (stream-for-n-steps funny-number-stream 0) (list) "funny-number-stream test")
 
   ; dan-then-dog test
   (check-equal? (stream-for-n-steps dan-then-dog 1) (list "dan.jpg") "dan-then-dog test")
   (check-equal? (stream-for-n-steps dan-then-dog 2) (list "dan.jpg" "dog.jpg") "dan-then-dog test")
   (check-equal? (stream-for-n-steps dan-then-dog 3) (list "dan.jpg" "dog.jpg" "dan.jpg") "dan-then-dog test")
   (check-equal? (stream-for-n-steps dan-then-dog 4) (list "dan.jpg" "dog.jpg" "dan.jpg" "dog.jpg") "dan-then-dog test")
   

   ; stream-add-zero test
   (check-equal? (stream-for-n-steps (stream-add-zero ones) 1) (list (cons 0 1)) "stream-add-zero test")
  ; (check-equal? (stream-for-n-steps (stream-add-zero dan-then-dog) 4) (list (cons 0 "dan.jpg") (cons 0 "dog.jpg") (cons 0 "dan.jpg") (cons 0 "dog.jpg")) "stream-add-zero test")
   
 
   ; cycle-lists test
   (check-equal? (stream-for-n-steps (cycle-lists (list 1 2 3) (list "a" "b")) 3) (list (cons 1 "a") (cons 2 "b") (cons 3 "a")) 
                 "cycle-lists test")
   (check-equal? (stream-for-n-steps (cycle-lists (list 1 2 3) (list "a")) 4) (list (cons 1 "a") (cons 2 "a") (cons 3 "a") (cons 1 "a")) 
                 "cycle-lists test")
   (check-equal? (stream-for-n-steps (cycle-lists (list 1) (list "a")) 4) (list (cons 1 "a") (cons 1 "a") (cons 1 "a") (cons 1 "a")) 
                 "cycle-lists test")
   (check-equal? (stream-for-n-steps (cycle-lists (list 1 2 3) (list "a" "b" "c")) 5) (list (cons 1 "a") (cons 2 "b") (cons 3 "c") (cons 1 "a") (cons 2 "b")) 
                 "cycle-lists test")

   ; vector-assoc test
   (check-equal? (vector-assoc 4 (vector (cons 2 1) (cons 3 1) (cons 4 1) (cons 5 1))) (cons 4 1) "vector-assoc test")
   (check-equal? (vector-assoc 8 (vector (cons 2 1) (cons 3 1) (cons 4 1) (cons 5 1))) #f "vector-assoc test")
   (check-equal? (vector-assoc 2 (vector (cons 2 1) (cons 3 1) (cons 4 1) (cons 5 1))) (cons 2 1) "vector-assoc test")
   (check-equal? (vector-assoc 4 (vector (cons 2 1) 0 (cons 4 1) (cons 5 1))) (cons 4 1) "vector-assoc test")
   

   ; cached-assoc tests

   (check-equal? (first 3) (cons 3 4) "cached-assoc test")
   (check-equal? (first 5) (cons 5 8) "cached-assoc test")
   (check-equal? (first 5) (cons 5 8) "cached-assoc test") ; hit cache
   (check-equal? (first 10) (cons 10 9) "cached-assoc test")
   (check-equal? (first 4) (cons 4 7) "cached-assoc test")
   (check-equal? (first 4) (cons 4 7) "cached-assoc test") ; hit cache
   (check-equal? (first 3) (cons 3 4) "cached-assoc test")
   (check-equal? (first 3) (cons 3 4) "cached-assoc test") ; hit cache
   (check-equal? (first 1) (cons 1 2) "cached-assoc test")
   (check-equal? (first 99) #f "cached-assoc test")
   (check-equal? (first 3) (cons 3 4) "cached-assoc test") ; hit cache
   (check-equal? (first 1) (cons 1 2) "cached-assoc test") ; hit cache
   (check-equal? (first 4) (cons 4 7) "cached-assoc test") ; hit cache
     
   (check-equal? ((cached-assoc (list (cons 1 2) (cons 3 4)) 5) 5) #f "cached-assoc test")



   ; while-less test
|#   (check-equal? (while-less 7 do (begin (set! a (+ a 1)) a)) #t "while-less test")
   (check-equal? a 7 "while")
   (check-equal? (while-less 7 do (begin (set! a (+ a 1)) a)) #t "while-less test")
   (check-equal? a 8 "while")
  #| 
   ))

   
(require rackunit/text-ui)
;; runs the test
(run-tests tests)
