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

;;
;; Python customizations
;;
(use-package pyenv-mode
  :ensure t
  :after eglot
  :init
  (add-to-list 'exec-path "~/.pyenv/shims")
  (setenv "WORKON_HOME" "~/.pyenv/versions/")
  :config
  (pyenv-mode))
(use-package pyvenv-auto :ensure t
  :hook ((python-mode . pyvenv-auto-run)))
(use-package pyconf
  :ensure t)
(use-package python-black
  :ensure t
  :demand t
  :after python
  :hook ((python-mode . python-black-on-save-mode)))
(use-package dape
  :ensure t
  :config
  ;; Devcontainer configs
  (add-to-list 'dape-configs
               `(python-devcontainer
                 modes (python-mode python-ts-mode)
                 ensure (lambda (config)
                          dape-ensure-command-selected)
                 command "devcontainer"
                 command-args ("exec" "--workspace-folder" "." "python" "-m" "debugpy" "--listen" "5678" "--wait-for-client")
                 host "localhost"
                 port 5678
                 :type "python"
                 :request "attach"
                 :pathMappings [(:localRoot dape-cwd :remoteRoot "/workspace")])))
(use-package virtualenv :ensure t)
