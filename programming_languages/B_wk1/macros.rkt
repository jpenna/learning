#lang racket

(define-syntax my-if
  (syntax-rules (then else)
    [(my-if e1 then e2 else e3)
     (if e1 e2 e3)]
    [(my-if e1 else e2 then e3)
     (if (not e1) e2 e3)]))