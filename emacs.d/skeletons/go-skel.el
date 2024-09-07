;;
;; Golang Skeletons
;; MIT License
;;
;; Copyright (c) 2024 Ronaldo F. Lima <ronaldo@brazuca.dev>
;;
;; Permission is hereby granted, free of charge, to any person
;; obtaining a copy of this software and associated documentation
;; files (the "Software"), to deal in the Software without
;; restriction, including without limitation the rights to use, copy,
;; modify, merge, publish, distribute, sublicense, and/or sell copies
;; of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
;; BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
;; ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
;; CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.
;;

(define-skeleton brazuca-golang-skeleton
  "Golang skeleton"
  \n
  > "// -*-mode:go;encoding:utf-8-*-" \n
  > "// Copyright (c)" (format-time-string "%Y" (current-time)) _ " - " _ user-company-name _ " - All Rights Reserved" \n 
  > "//" \n
  > "// Created: " _ (format-time-string "%Y-%m-%d" (current-time))_ " by " _ (user-full-name) _ "<" _ user-mail-address _ ">" _ \n
  > "//" \n
  > "// This file purpose: " (skeleton-read "This file purpose: ") \n \n
  > "package " _ (skeleton-read "Package: ") _ \n \n
 )
