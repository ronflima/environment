;; MIT License
;;
;; Copyright (c) 2026 Ronaldo F. Lima <ronaldo@brazuca.dev>
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

;;
;; Custom useful functions
;;

;; Match parenthesis function
;; Credit: Dirk Heumann routine, got in 2003
;; I still use it dude!
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;;
;; INSERT current date function
;; Reference: https://www.emacswiki.org/emacs/InsertingTodaysDate
;;
(defun insdate-insert-current-date (&optional omit-day-of-week-p)
  "Insert today's date using the current locale.
  With a prefix argument, the date is inserted without the day of
  the week."
  (interactive "P*")
  (insert (calendar-date-string (calendar-current-date) nil
                                omit-day-of-week-p)))

;;
;; Sort words in place
;;
(defun sort-words (reverse beg end)
  "Sort words in region alphabetically, in REVERSE if negative.
    Prefixed with negative \\[universal-argument], sorts in reverse.
  
    The variable `sort-fold-case' determines whether alphabetic case
    affects the sort order.
  
    See `sort-regexp-fields'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\w+" "\\&" beg end))

;;
;; Generates a strong password
;;
(defun generate-strong-password (&optional length)
  "Generate a random password of at least LENGTH characters (default 12).
The password is guaranteed to contain:
- At least 8 characters
- At least one digit (0-9)
- At least one uppercase letter (A-Z)
- At least one lowercase letter (a-z)
- At least one special character (@#%&'!_)"
  (let* ((min-length 8)
         (target-length (max min-length (or length 12)))
         (uppercase-chars "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
         (lowercase-chars "abcdefghijklmnopqrstuvwxyz")
         (digit-chars "0123456789")
         (special-chars "@#%&'!_")
         (all-chars (concat uppercase-chars lowercase-chars digit-chars special-chars))
         (pick-random-char (lambda (charset)
                             (aref charset (random (length charset)))))
         ;; Guarantee at least one character from each required set
         (password-chars (list (funcall pick-random-char uppercase-chars)
                               (funcall pick-random-char lowercase-chars)
                               (funcall pick-random-char digit-chars)
                               (funcall pick-random-char special-chars))))

    ;; Fill the remaining length with random characters from the combined pool
    (dotimes (_ (- target-length (length password-chars)))
      (push (funcall pick-random-char all-chars) password-chars))

    ;; Shuffle the list using the Fisher-Yates algorithm
    (let ((chars-vector (vconcat password-chars))
          (len target-length))
      (while (> len 1)
        (let* ((rand-idx (random len))
               (last-idx (1- len))
               (temp (aref chars-vector last-idx)))
          (aset chars-vector last-idx (aref chars-vector rand-idx))
          (aset chars-vector rand-idx temp)
          (setq len last-idx)))
      ;; Convert the shuffled vector back to a string
      (concat chars-vector))))
