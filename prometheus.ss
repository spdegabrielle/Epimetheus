(module prometheus
  mzscheme
  (require (lib "list.ss" "srfi" "1")
           (lib "16.ss" "srfi")
           (lib "23.ss" "srfi")
           (lib "include.ss")
           (file "private/hermes-module.scm"))        
  (provide make-prometheus-root-object
           *the-root-object*
           define-method
           define-object)
  (include "private/prometheus.scm"))
