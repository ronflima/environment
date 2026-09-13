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
;; Visual customizations
;;
(defun brazuca-dark-mode()
  "Sets emacs into a \"dark mode\""
  (interactive)
  (set-face-background 'default "black")
  (set-face-foreground 'default "green"))
(defun brazuca-light-mode()
  "Sets emacs into a light mode"
  (interactive)
  (set-face-background 'default "white")
  (set-face-foreground 'default "black"))
(brazuca-dark-mode) ;; Prefer the dark theme. But this can get
                    ;; customized at customizations.el
(add-to-list 'default-frame-alist '(height . 30))
(add-to-list 'default-frame-alist '(width . 120))
(global-auto-revert-mode 1)
(menu-bar-mode -1)
(setq inhibit-startup-message t)
(setq make-backup-files nil) 
(setq ring-bell-function 'ignore)
(setq visible-bell nil)
(tool-bar-mode 0)
(turn-on-font-lock)
(set-scroll-bar-mode 'right)
