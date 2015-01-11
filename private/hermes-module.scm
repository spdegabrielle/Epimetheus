(module hermes-module
  mzscheme
  (require (lib "list.ss" "srfi" "1")
           (lib "8.ss" "srfi")
           (lib "9.ss" "srfi")
           (lib "23.ss" "srfi")
           (lib "include.ss"))
  (provide make-hermes-object)
  (include "hermes.scm"))
