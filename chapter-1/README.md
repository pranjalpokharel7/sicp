## Verbal Exercises

These exercises reequire you to ponder over what the answer could be instead of writing a program, hence their answers/discussions are summarized here in this README.

### 1.1

The exercise provides a series of inputs for which you need to deduce the interpreter evaluation. We will use the racket shell for these evaluations. The output is printed after ;.

```lisp
10 ; 10
(+ 5 3 4) ; 12
(-9 1) ; 8
(/ 6 2) ; 3
(+ (* 2 4) (- 4 6)) ; 6
(define a 3) ; assignment -> a = 3
(define b (+ a 1)) ; assignment -> b = 4
(+ a b (* a b)) ; 19
(= a b) ; #f {False}

(if (and (> b a) (< b (* a b)))
    b
    a) ; 4, b > a and b < a * b, both cases are true

(cond ((= a 4) 6)
    ((= b 4) (+ 6 7 a))
    (else 25)) ; 16, 2nd case is evaluated

(+ 2 (if (> b a) b a)) ; 6

(* (cond ((> a b) a)
        ((< a b) b) ; a < b, so this case is evaluated to b
        (else -1))
    (+ a 1)) ; 16, multiply b * (a + 1)
```

### 1.2

Prefix form of the given expression can be derived step by step.
```lisp
(/ x y)

; where y can be defined as,
(define y (* 3 (- 6 2) (- 2 7)))

; where x can be defined as,
(define x (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))))

; final prefix form is
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

; break the expression down into smaller abstractions if it is difficult to visualize
```

### 1.4

The decision block adds `a` and `b` if `b > 0`, else subtracts `b` from `a` (since `b` is negative in that case).

It is certainly unusual to see operators being the result of boolean expression evaluation. Guess it goes on to demonstrate the expressiveness of lisp.

### 1.5

**Applicative-Order**: Arguments to a procedure are evaluated before any further evaluation is done. \
**Normal-Order Evaluation**: Arguments to a procedure are evaluated only when needed (usually when everything is broken down into primitives).

```lisp
(define (p) (p))
```

This is a recursive definition, which never ends in applicative order evaluation. However, `(p)` as an expression that is never evaluated in normal order, the expression evaluates to 0.

```lisp
(define (test x y)
(if (= x 0) 0 y)) ; x is 0 so this evaluates to 0, anything passed as y in normal order is not evaluated
```

