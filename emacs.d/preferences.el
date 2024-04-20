;; Emacs Customizations
;; Author: Ronaldo F. Lima <ronaldo@brazuca.dev>

;; MELPA support and package customizations
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 '(package-selected-packages
   (quote
    (
     auto-complete
     exec-path-from-shell
     fixmee
     go-mode
     jedi
     load-env-vars
     markdown-mode
     py-isort
     virtualenvwrapper
     web-mode
     ))))

(setq package-install-upgrade-built-in t)
(package-install-selected-packages)

(load-library "auto-complete")
(load-library "auto-complete-config")
(load-library "button-lock")
(load-library "calendar")
(load-library "dired-x")
(load-library "fixmee")
(load-library "ido")
(load-library "package")
(load-library "py-isort")
(load-library "vc-dir")
(load-library "virtualenvwrapper")
(load-library "web-mode")

;; Operating system dependent settings
(cond
 ;; Windows
 ((string-equal system-type "windows-nt")
  (global-set-key [f2] 'powershell)
  (set-face-attribute 'default nil :family "Consolas" :height 140 :weight 'regular)
  )
 
 ;; MacOS
 ((string-equal system-type "darwin")
  (set-face-attribute 'default nil :family "Menlo" :height 160 :weight 'normal)
  (setq mac-allow-anti-aliasing t)
  (setq gud-pdb-marker-regexp "^> \\([-axx-zA-Z0-9_/.:\\]*\\|<string>\\)(\\([0-9]+\\))\\([a-zA-Z0-9_]*\\|\\?\\|<module>\\)()\\(->[^\n\r]*\\)?[\n\r]")
  (exec-path-from-shell-initialize)
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
  (exec-path-from-shell-initialize)
  )
 )

(put 'erase-buffer 'disabled nil)

;; No tabs!
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Time formts
(display-time-mode 1)
(setq display-time-default-load-average nil)
(setq display-time-format "%H:%M %d/%m/%Y")

;; Skelletons
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
                          ("\\.sql$"       . skel-sql-file)))

;; Web Mode
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

(defun brazuca-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
)
(add-hook 'web-mode-hook  'brazuca-mode-hook)
(setq epg-pinentry-mode 'loopback)

;; MongoDB
(defcustom inf-mongo-command "mongo 127.0.0.1:27017" "Default MongoDB shell command used.")

;; Javascript preferences
(setq js-indent-level 4)

;; Python Preferences
(setq venv-location (expand-file-name "~/.virtualenvs"))
(if (not (file-directory-p venv-location))
    (make-directory venv-location))
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq python-indent-offset 4)
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'before-save-hook 'py-isort-before-save)
(setq jedi:complete-on-dot t)

;; Modes
(add-hook 'prog-mode-hook 'hs-minor-mode)
(auto-fill-mode 1)
(setq column-number-mode t)
(setq fill-column 132)
(setq line-number-mode t)

;; Visuals
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 120))
(global-auto-revert-mode 1)
(menu-bar-mode -1)
(set-face-background 'default "black")
(set-face-foreground 'default "green")
(setq inhibit-startup-message t)
(setq make-backup-files nil) 
(setq ring-bell-function 'ignore)
(setq visible-bell nil)
(tool-bar-mode 0)
(turn-on-font-lock)       

;; Encodings
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)

;; I prefer the scroll bar on the right side.
(set-scroll-bar-mode 'right)

;; Abbrev settings
(setq abbrev-file-name (expand-file-name "abbrevs.el" user-emacs-directory))
(setq abbrev-mode t)

;; Keymaps
(global-set-key "%"  'match-paren)
(global-set-key [M-down] 'end-of-buffer)
(global-set-key [M-left] 'beginning-of-line)
(global-set-key [M-right] 'end-of-line)
(global-set-key [M-up] 'beginning-of-buffer)
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)

;; Dired customizations
(setq dired-guess-shell-alist-user
      '(("^manage.py$" "python * runserver")
        ("\\.py$" "python")
        ("^requirements.txt$" "pip install -r")))

;; Tramp mode
(setq tramp-default-method "ssh")

;; SSH customizations
(add-hook 'ssh-mode-hook
          (lambda()
            (setq ssh-directory-tracking-mode t)
            (shell-dirtrack-mode t)
            (setq dirtrackp nil)))

;; VC Customizations
(define-key vc-dir-mode-map (kbd "\C-cc") 'vc-find-conflicted-file)
(setq smerge-command-prefix "\C-cm")
(setq vc-suppress-confirm t)

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

;; auto complete
(ac-config-default)
(add-to-list 'ac-dictionary-directories (expand-file-name "ac-dict" user-emacs-directory))
(global-auto-complete-mode t)

;; ido mode
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Fixmee
(global-fixmee-mode 1)

;; Sudoku
(add-to-list 'auto-mode-alist '("\\.sdk\\'" . sudoku-mode))

;; INSERT current date function
;; Reference: https://www.emacswiki.org/emacs/InsertingTodaysDate
(defun insdate-insert-current-date (&optional omit-day-of-week-p)
  "Insert today's date using the current locale.
  With a prefix argument, the date is inserted without the day of
  the week."
  (interactive "P*")
  (insert (calendar-date-string (calendar-current-date) nil
                                omit-day-of-week-p)))
(global-set-key "\C-x\M-d" `insdate-insert-current-date)

(defun sort-words (reverse beg end)
  "Sort words in region alphabetically, in REVERSE if negative.
    Prefixed with negative \\[universal-argument], sorts in reverse.
  
    The variable `sort-fold-case' determines whether alphabetic case
    affects the sort order.
  
    See `sort-regexp-fields'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\w+" "\\&" beg end))

;; Org-mode customizations
(setq org-todo-keywords
      '((sequence "TODO" "DOING" "|" "DONE")))

;; Start emacs server
(server-start)
