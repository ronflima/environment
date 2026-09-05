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
;; General modes customizations
;;
(defun brazuca-text-mode-hook()
  (setq fill-column 132))
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'text-mode-hook 'brazuca-text-mode-hook)
(auto-fill-mode 1)
(display-time-mode 1)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(put 'erase-buffer 'disabled nil)
(setq column-number-mode t)
(setq display-time-default-load-average nil)
(setq display-time-format "%H:%M %d/%m/%Y")
(setq epg-pinentry-mode 'loopback)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
