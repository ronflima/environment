;; Emacs Customizations for Python
;; MIT License
;;
;; Copyright (c) 2019 Ronaldo F. Lima <ronaldo@brazuca.dev>
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
;; Note: This requires emacs 29 or newer.

(use-package lsp-pyright :after lsp-mode :ensure t)
(use-package py-autopep8 :ensure t :hook ((python-mode) . py-autopep8-mode))
(use-package py-isort :ensure t)
(use-package pyvenv-auto :ensure t :hook ((python-mode . pyvenv-auto-run)))

(add-hook 'before-save-hook 'py-isort-before-save)
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'display-line-numbers-mode)
(add-hook 'python-mode-hook #'lsp)

(setq python-fill-docstring-style 'django)
(setq python-indent-offset 4)
(setq dired-guess-shell-alist-user
      '(("^manage.py$" "python * runserver")
        ("\\.py$" "python")
        ("^requirements.txt$" "pip install -r")))
