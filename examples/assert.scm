;;; Somewhat extensive ASSERT macros:

(define-syntax assert
  (syntax-rules ()
    ((_ expr)
     (assert #f expr))
    ((_ name expr)
     (*assert name 'expr (lambda () expr)))))

(define (*assert name expr proc)
  (test-begin name expr)
  (let ((value (with-exception-handler
                   (lambda (handler)
                     (test-error name expr)
                     (raise handler))
                 proc)))
    (if value
        (test-success name expr)
        (test-failure name expr)))
  (values))

(define-syntax assert-fails
  (syntax-rules ()
    ((_ expr)
     (assert-fails #f expr))
    ((_ name expr)
     (*assert-fails name 'expr (lambda () expr)))))

(define (*assert-fails name expr proc)
  (test-begin name expr)
  (call-with-current-continuation
   (lambda (return)
     (with-exception-handler
         (lambda (c)
           (test-success name expr)
           (return))
       proc)
     (test-failure name expr)))
  (values))

(define (test-begin name expr)
  (if name
      (begin
        (display name)
        (display " ... "))))

(define (test-success name expr)
  (if name
      (begin
        (display "[ OK ]")
        (newline))))

(define (test-failure name expr)
  (if (not name)
      (begin
        (display "Testing ")
        (write expr)
        (display " ... ")))
  (display "[FAIL]")
  (newline)
  (error "Test suite failed."))

(define (test-error name expr)
  (if (not name)
      (begin
        (display "Testing ")
        (write expr)
        (display " ... ")))
  (display "[ERROR]")
  (newline))

