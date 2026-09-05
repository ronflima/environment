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
;; Skelletons
;;
(load (expand-file-name "init.el" (expand-file-name "skeletons" user-emacs-directory)))
(add-hook 'find-file-hook 'auto-insert)
(setq auto-insert-alist '(("router.*\\.js$". node-router)
                          ("\\.js$"        . node-new-file)
			              ("\\.rb$"        . ruby-formaweb-file)
                          ("\\.c$"         . c-mit-file)
                          ("\\.h$"         . c-mit-file)
                          ("\\.swift$"     . swift-mit-file)
                          ("setup.py"      . python-mit-setup)
                          ("\\.py$"        . brazuca-python-module)
                          ("\\.sql$"       . skel-sql-file)
                          ("\\.org$"       . brazuca-org-file)
                          ("\\.go\\'"      . brazuca-golang-skeleton)))
