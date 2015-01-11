(module assert-module
  mzscheme
  (require (lib "23.ss" "srfi")
           (lib "34.ss" "srfi")
           (lib "include.ss"))
  (provide assert assert-fails)
  (include "assert.scm"))