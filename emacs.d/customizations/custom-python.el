;; Emacs Customizations for Python
;; MIT License
;;
;; Copyright (c) 2025 Ronaldo F. Lima <ronaldo@brazuca.dev>
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


(use-package lsp-mode :ensure t :config (setq warning-minimum-level ':error))
(use-package lsp-pyright :after lsp-mode :ensure t)
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.venv\\'"))
(use-package lsp-ui
  :ensure t
  :after lsp-mode)
(use-package lsp-pyright
  :after lsp-mode
  :ensure t)
(use-package flycheck
  :after lsp-mode
  :ensure t
  :config (global-flycheck-mode))
(use-package company
  :after lsp-pyright
  :ensure t
  :hook (prog-mode . company-mode)
  :bind
  (:map company-active-map
        ("<tab>" . company-complete-selection))
  (:map lsp-mode-map
        ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))
(use-package company-jedi
  :after company
  :ensure t)
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(use-package py-isort :ensure t)
(use-package pyvenv-auto :ensure t :hook ((python-mode . pyvenv-auto-run)))

(add-hook 'python-mode-hook 'lsp)
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'display-line-numbers-mode)
(add-hook 'before-save-hook 'py-isort-before-save)

(setq py-autopep8-options '("--max-line-length=132"))
(setq python-fill-docstring-style 'django)
(setq python-indent-offset 4)
(setq dired-guess-shell-alist-user
      '(("^manage.py$" "python * runserver")
        ("\\.py$" "python")
        ("^requirements.txt$" "pip install -r")))
