;; Emacs Customizations
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

;;
;; MELPA support and package customizations
;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'calendar)
(require 'dired-x)
(require 'vc-dir)
(use-package load-env-vars :ensure t)
(use-package ido
  :ensure t
  :config
  (ido-mode t)
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t))
(use-package ssh :ensure t)
(use-package graphviz-dot-mode :ensure t)
(use-package markdown-mode :ensure t)
(use-package virtualenvwrapper
  :ensure t
  :config
  (setq venv-location (expand-file-name "~/.virtualenvs"))
  (if (not (file-directory-p venv-location))
      (make-directory venv-location))
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell))
(use-package web-mode :ensure t :config
  (defun brazuca-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 4))
  (add-hook 'web-mode-hook  'brazuca-mode-hook)
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode)))

;;
;; LSP and Pyright modes
;;
(use-package lsp-mode
  :ensure t
  :hook ((python-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp))
(use-package lsp-pyright
  :after lsp-mode
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))
(use-package company
  :after lsp-pyright
  :ensure t
  :hook (prog-mode . company-mode)
  :bind
  (:map company-active-map
        ("<tab>" . company-complete-selection))
  (:map lsp-mode-map
        ("<tab>" . company-indent-or-complete-common))
  :config
  (add-hook 'after-init-hook 'global-company-mode)        
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))
(use-package company-jedi
  :after company
  :ensure t
  :config
  (defun brazuca-company-jedi-python-hook ()
    (add-to-list 'company-backends 'company-jedi))
  (add-hook 'python-mode-hook 'brazuca-company-jedi-python-hook))
;;
;; Flymake Settings
;;
(require 'flymake)
(define-key flymake-mode-map (kbd "M-n") 'flymake-goto-next-error)
(define-key flymake-mode-map (kbd "M-p") 'flymake-goto-prev-error)

;;
;; Operating system dependent settings
;;
(cond
 ;; Windows
 ((string-equal system-type "windows-nt")
  (global-set-key [f2] 'powershell)
  (set-face-attribute 'default nil :family "Consolas" :height 140 :weight 'regular))
 
 ;; MacOS
 ((string-equal system-type "darwin")
  (set-face-attribute 'default nil :family "Menlo" :height 160 :weight 'normal)
  (setq mac-allow-anti-aliasing t)
  (setq gud-pdb-marker-regexp "^> \\([-axx-zA-Z0-9_/.:\\]*\\|<string>\\)(\\([0-9]+\\))\\([a-zA-Z0-9_]*\\|\\?\\|<module>\\)()\\(->[^\n\r]*\\)?[\n\r]")
  (use-package exec-path-from-shell :ensure t :config (exec-path-from-shell-initialize))
  (setq system-time-locale "en_US.UTF-8")
  ;; Inferior shell
  (setq explicit-shell-file-name "/bin/zsh")
  (setq explicit-zsh-args '("--login" "--interactive"))
  (setq shell-file-name "zsh")
  (defun zsh-shell-mode-setup ()
    (setq-local comint-process-echoes t))
  (add-hook 'shell-mode-hook #'zsh-shell-mode-setup)
  (global-set-key [f2] 'shell)
  ;; Dired Customizations
  (setq dired-listing-switches "-al --group-directories-first")
  (setq insert-directory-program "/opt/homebrew/bin/gls" dired-use-ls-dired t)
  (eval-after-load "dired"
    '(progn
       (define-key dired-mode-map (kbd "z")
                   (lambda () (interactive)
                     (let ((fn (dired-get-file-for-visit)))
                       (message "Opening `%s'" fn)
                       (start-process "default-app" nil "open" fn)))))))

 ;; Linux
 ((string-equal system-type "gnu/linux")
  (set-face-attribute 'default nil :family "Consolas" :height 160 :weight 'regular)
  (setq dired-listing-switches "-aBhl --group-directories-first")
  ;; Support to inferior shell
  (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
  (global-set-key [f2] 'shell)
  (setenv "PATH" (concat "/usr/local/bin" ":" (getenv "PATH")))
  (setq shell-file-name "bash")
  (setenv "SHELL" shell-file-name)
  (setq exec-path (append exec-path '("/usr/local/bin")))
  (setq explicit-bash-args '("--noediting" "--login" "-i"))
  (exec-path-from-shell-initialize)))

;;
;; Skelletons
;;
(add-to-list 'load-path (expand-file-name "skeletons" user-emacs-directory))
(load-library "skeletons.el")
(add-hook 'find-file-hook 'auto-insert)
(setq auto-insert-alist '(("router.*\\.js$". node-router)
                          ("\\.js$"        . node-new-file)
			              ("\\.rb$"        . ruby-formaweb-file)
                          ("\\.c$"         . c-mit-file)
                          ("\\.h$"         . c-mit-file)
                          ("\\.swift$"     . swift-mit-file)
                          ("setup.py"      . python-mit-setup)
                          ("\\.py$"        . python-mit)
                          ("\\.py$"        . brazuca-python-module)
                          ("\\.sql$"       . skel-sql-file)))

;;
;; Javascript preferences
;;
(setq js-indent-level 4)

;;
;; Python Preferences
;;
(use-package py-isort :ensure t :config (add-hook 'before-save-hook 'py-isort-before-save))
(setq python-indent-offset 4)
(add-hook 'python-mode-hook 'hs-minor-mode)

;;
;; C preferences
;;
(setq c-default-style "gnu")

;;
;; Modes
;;
(add-hook 'prog-mode-hook 'hs-minor-mode)
(auto-fill-mode 1)
(display-time-mode 1)
(put 'erase-buffer 'disabled nil)
(setq column-number-mode t)
(setq display-time-default-load-average nil)
(setq display-time-format "%H:%M %d/%m/%Y")
(setq epg-pinentry-mode 'loopback)
(setq fill-column 132)
(setq line-number-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;;
;; Visuals
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
(add-to-list 'default-frame-alist '(height . 40))
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

;;
;; Encodings
;;
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)

;;
;; Abbrevs
;;
(setq abbrev-file-name (expand-file-name "abbrevs.el" user-emacs-directory))
(setq abbrev-mode t)

;;
;; Dired customizations
;;
(setq dired-guess-shell-alist-user
      '(("^manage.py$" "python * runserver")
        ("\\.py$" "python")
        ("^requirements.txt$" "pip install -r")))

;;
;; Tramp mode
;;
(setq tramp-default-method "ssh")

;;
;; SSH customizations
;;
(add-hook 'ssh-mode-hook
          (lambda()
            (setq ssh-directory-tracking-mode t)
            (shell-dirtrack-mode t)
            (setq dirtrackp nil)))

;;
;; VC Customizations
;;
(define-key vc-dir-mode-map (kbd "\C-cc") 'vc-find-conflicted-file)
(setq smerge-command-prefix "\C-cm")
(setq vc-suppress-confirm t)

;;
;; Org-mode
;;
(setq org-todo-keywords
      '((sequence "TODO" "DOING" "|" "DONE")))
(setq org-log-done 'time)

;;
;; Useful functions
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
;; Keymaps
;;
(global-set-key "%"  'match-paren)
(global-set-key "\C-x\M-d" 'insdate-insert-current-date)
(global-set-key [M-down] 'end-of-buffer)
(global-set-key [M-left] 'beginning-of-line)
(global-set-key [M-right] 'end-of-line)
(global-set-key [M-up] 'beginning-of-buffer)
(global-set-key [end] 'end-of-line)
(global-set-key [home] 'beginning-of-line)

(server-start)
