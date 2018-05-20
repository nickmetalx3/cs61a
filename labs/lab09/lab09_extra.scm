;; Extra Scheme Questions ;;

; Q5
(define (square x) (* x x))

(define (pow b n)
  (if (= 0 n)
      1
      (if (even? n)
          (square (pow b (quotient n 2))) 
      	  (* b (pow b (- n 1))))
))

; Q6
(define lst
  (list (list 1) 2 '(3 . 4) 5)
)

; Q7
(define (composed f g)
  (define (helper x)
    (f (g x)))
  helper
)

; Q8
(define (remove item lst)
  (filter (lambda (x) (not (= x item))) lst)
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

; Q9
(define (max a b) (if (> a b) a b))
(define (min a b) (if (> a b) b a))
(define (rem a b) (modulo a b))
(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (rem a b))))


;;; Tests
(gcd 24 60)
; expect 12
(gcd 1071 462)
; expect 21

; Q10
(define (in-lst s x)
  (if (null? s)
     #f
     (or (= x (car s)) (in-lst (cdr s) x))))

(define (no-repeats s)
  (if (null? s)
        s
        (if (in-lst (cdr s) (car s))
            (no-repeats (cdr s))
            (cons (car s) (no-repeats (cdr s))))))

; much better solution as shown in the lab
(define (no-repeats s)
  (if (null? s)
        s
        (cons (car s) 
          (no-repeats (filter (lambda (x) (not (= (car s) x))) (cdr s))))))

; Q11
(define (substitute s old new)
  (cond 
   ((null? s) s)
   ((equal? (car s) old) 
      (cons new (substitute (cdr s) old new)))
   ((pair? (car s)) 
      (cons (substitute (car s) old new) (substitute (cdr s) old new)))
   (else 
      (cons (car s) (substitute (cdr s) old new)))))

; Q12
(define (sub-all s olds news)
  (cond
   ((null? olds) s)
   (else (sub-all (substitute s (car olds) (car news)) (cdr olds) (cdr news))))
)