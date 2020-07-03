#lang racket
;; Programming Languages Homework 5 Simple Test
;; Save this file to the same directory as your homework file
;; These are basic tests. Passing these tests does not guarantee that your code will pass the actual homework grader

;; Be sure to put your homework file in the same folder as this test file.
;; Uncomment the line below and, if necessary, change the filename
(require "hw5.rkt")

(require rackunit)

(define tests
  (test-suite
   "Sample tests for Assignment 5"

   ;; check racketlist to mupllist with normal list
   (check-equal? (racketlist->mupllist (list (int 3) (int 4))) (apair (int 3) (apair (int 4) (aunit))) "racketlist->mupllist test")
   (check-equal? (racketlist->mupllist (list)) (aunit) "racketlist->mupllist test")
         
   ;; check mupllist to racketlist with normal list
   (check-equal? (mupllist->racketlist (apair (int 3) (apair (int 4) (aunit)))) (list (int 3) (int 4)) "racketlist->mupllist test")
   (check-equal? (mupllist->racketlist (aunit)) (list) "racketlist->mupllist test")


   ;; values
   (check-equal? (eval-exp (int 17)) (int 17) "value")
   (check-equal? (eval-exp (aunit)) (aunit) "value")
   (check-equal? (eval-exp (closure 1 2)) (closure 1 2) "value")
   (check-equal? (eval-exp (apair (aunit) (apair (int 1) (int 2)))) (apair (aunit) (apair (int 1) (int 2))) "value")
   (check-equal? (eval-under-env (var "name") (list (cons "name" "john"))) "john" "variable")


   (check-equal? (eval-under-env (fun "name" 3 (int 5)) (list 5)) (closure (list 5) (fun "name" 3 (int 5))) "closure")
   
   ;; tests if ifgreater returns (int 2)
   (check-equal? (eval-exp (ifgreater (int 3) (int 4) (int 3) (int 2))) (int 2) "ifgreater test")
   (check-equal? (eval-exp (ifgreater (int 7) (int 4) (int 3) (int 2))) (int 3) "ifgreater test")
   ; (check-equal? (eval-exp (ifgreater (aunit) (int 4) (int 3) (int 2))) (int 2) "ifgreater test")
   ; (check-equal? (eval-exp (ifgreater (int 6) (aunit) (int 3) (int 2))) (int 2) "ifgreater test")
   (check-equal? (eval-exp (ifgreater (add (int 4) (int 4)) (add (int 3) (int 2)) (add (int 3) (int 2)) (add (int 2) (int 2)))) (int 5) "ifgreater test")
   (check-equal? (eval-exp (ifgreater (add (int 4) (int 4)) (add (int 34) (int 2)) (add (int 3) (int 2)) (add (int 2) (int 2)))) (int 4) "ifgreater test")
   (check-equal? (eval-exp (ifgreater (add (int 4) (int 4)) (add (int 34) (int 2)) (add "no eval" (int 2)) (add (int 2) (int 2)))) (int 4) "ifgreater test")
   (check-equal? (eval-exp (ifgreater (add (int 4) (int 4)) (add (int 3) (int 2)) (add (int 3) (int 2)) (add "no eval" (int 2)))) (int 5) "ifgreater test")



   ;; mlet test
   (check-equal? (eval-exp (mlet "x" (int 1) (add (int 5) (var "x")))) (int 6) "mlet test")

   ;; call test
   (check-equal? (eval-exp (call (closure '() (fun #f "x" (add (var "x") (int 7)))) (int 1))) (int 8) "call test")
   ; (check-equal? (eval-exp (call (int 1) (int 1))) (int 8) "call test")
   (check-equal? (eval-exp (call (fun #f "x" (add (var "x") (int 7))) (int 4))) (int 11) "call test")

                                                                  
   ;;snd test
   (check-equal? (eval-exp (snd (apair (int 1) (int 2)))) (int 2) "snd test")
   (check-equal? (eval-exp (fst (apair (int 1) (int 2)))) (int 1) "fst test")
   ; (check-exn exn:fail? (eval-exp (fst (int 1))) (int 1) "wrong test")

   ;; isaunit test
   (check-equal? (eval-exp (isaunit (closure '() (fun #f "x" (aunit))))) (int 0) "isaunit test")

   ;; ifaunit test
   (check-equal? (eval-exp (ifaunit (int 1) (int 2) (int 3))) (int 3) "ifaunit test")
 
   ;; mlet* test
   (check-equal? (eval-exp (mlet* (list (cons "x" (int 10))) (var "x"))) (int 10) "mlet* test")
   (check-equal? (eval-exp (mlet* (list) (int 10))) (int 10) "mlet* test")
   (check-equal? (eval-exp (mlet* (list (cons "x" (int 10)) (cons "y" (var "x"))) (var "y"))) (int 10) "mlet* test")
   
   ;; ifeq test
   (check-equal? (eval-exp (ifeq (int 1) (int 2) (int 3) (int 4))) (int 4) "ifeq test")
   (check-equal? (eval-exp (ifeq (int 1) (int 1) (int 3) (int 4))) (int 3) "ifeq test")
   (check-equal? (eval-exp (ifeq (int 2) (int 1) (int 3) (int 4))) (int 4) "ifeq test")
   
   ;; mupl-map test
   (check-equal? (eval-exp (call (call mupl-map (fun #f "x" (add (var "x") (int 7)))) (apair (int 1) (aunit)))) 
                 (apair (int 8) (aunit)) "mupl-map test")

   ;; problems 1, 2, and 4 combined test
   (check-equal? (mupllist->racketlist
   (eval-exp (call (call mupl-mapAddN (int 7))
                   (racketlist->mupllist 
                    (list (int 3) (int 4) (int 9)))))) (list (int 10) (int 11) (int 16)) "combined test")
))

(require rackunit/text-ui)
;; runs the test
(run-tests tests)
