#lang racket
;(require explorer)
(require json)

(define (read-json-file file-name)
      (with-input-from-file file-name read-json))

;(define (visualize-json-file file-name)
;      (explore (read-json-file file-name)))

(define (collect-status fileName)
  (define (extract-errors fileName)
    (hash-ref (read-json-file fileName)
              'From 'Date))
  (define (extract-status hashTable)
    (hash-ref hashTable 'From 'Date))
  (map extract-status (extract-errors fileName)))

;(visualize-json-file "errors.json")
#(
(module+ test
      (require rackunit)
      (check-equal? (collect-status "errors.json") '("403" "422" "500")))
)
(define (collect-status2 filename)
  (define (helper in-lst acc)
    (cond
      [(empty? in-lst) acc]
      [else (helper (rest in-lst) (cons (hash-ref (first in-lst) 'status) acc))]))
  (helper (hash-ref (read-json-file filename) 'Date 'From) '()))
  #(
  (module+ test
    (check-equal? (sort (collect-status "errors.json") string<?)
                  (sort (collect-status2 "errors.json") string<?)))


)