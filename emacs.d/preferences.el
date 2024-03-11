
;; Emacs Customizations
;; Author: Ronaldo F. Lima <ronaldo@brazuca.dev>

;; MELPA support and package customizations
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 '(package-selected-packages
   (quote
    (web-mode virtualenvwrapper py-autopep8 fixmee auto-complete yaml-mode markdown-mode))))
(setq package-install-upgrade-built-in t)

;; Operating system dependent settings
(cond
 ;; -------
 ;; Windows
  ((string-equal system-type "windows-nt")
  (set-face-attribute 'default nil :family "Consolas" :height 140 :weight 'regular)
  (setq venv-location "~/python/virtualenvs")
  (global-set-key [f2] 'powershell)
  )
 
 ;; -----
 ;; MacOS
 ((string-equal system-type "darwin")
  (set-face-attribute 'default nil :family "Menlo" :height 180 :weight 'normal)
  (setq mac-allow-anti-aliasing t)
  ;; Inferior shell
  (setq explicit-shell-file-name "/bin/zsh")
  (setq shell-file-name "zsh")
  (setq explicit-zsh-args '("--login" "--interactive"))
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

 ;; -----
 ;; Linux
 ((string-equal system-type "gnu/linux")
  (set-face-attribute 'default nil :family "Consolas" :height 160 :weight 'regular)
  (setq venv-location "~/projetos/python/virtualenvs")
  (setq dired-listing-switches "-aBhl --group-directories-first")
  ;; Support to inferior shell
  (setq shell-file-name "bash")
  (setq explicit-bash-args '("--noediting" "--login" "-i"))
  (setenv "SHELL" shell-file-name)
  (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
  (setenv "PATH" (concat "/usr/local/bin" ":" (getenv "PATH")))
  (setq exec-path (append exec-path '("/usr/local/bin")))
  (global-set-key [f2] 'shell)
  )
 )

(put 'erase-buffer 'disabled nil)

;; No tabs!
(setq-default indent-tabs-mode nil)

;; Time formts
(setq display-time-format "%H:%M %d/%m/%Y")
(setq display-time-default-load-average nil)
(display-time-mode 1)

;; Skelletons
(add-to-list 'load-path "~/.emacs.d/skeletons")
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
(require 'web-mode)
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
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq python-indent-offset 4)
(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(add-hook 'python-mode-hook 'hs-minor-mode)
(setq jedi:tooltip-method nil)
(add-hook 'python-mode-hook 'jedi:setup)

;; Prolog support
(autoload 'prolog-mode "prolog" "Major mode for prolog programs" t)
(add-to-list 'auto-mode-alist '("\\.pl\\'" . prolog-mode))

;; Modes
(auto-fill-mode 1)
(setq column-number-mode t)
(setq line-number-mode t)

;; Visuals
(turn-on-font-lock)       
(setq make-backup-files nil) 
(global-auto-revert-mode 1)
(setq visible-bell nil)
(setq ring-bell-function 'ignore)
(set-face-foreground 'default "green")
(set-face-background 'default "black")
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 120))
(tool-bar-mode 0)
(setq inhibit-startup-message t)
(menu-bar-mode -1)

;; Encodings
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)

;; I prefer the scroll bar on the right side.
(set-scroll-bar-mode 'right)

;; Abbrev settings
(setq abbrev-file-name "~/.emacs.d/abbrevs.el")
(setq abbrev-mode t)

;; Keymaps
(global-set-key "%"  'match-paren)

(global-set-key [M-left] 'beginning-of-line)
(global-set-key [M-right] 'end-of-line)
(global-set-key [M-down] 'end-of-buffer)
(global-set-key [M-up] 'beginning-of-buffer)

;; Dired customizations
(require 'dired-x)
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
(require 'vc-dir)
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

;; Hooks
;; Make hideshow minor mode always active for all program modes
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; auto complete
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

;; ido mode
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;; Fixmee
(require 'button-lock)
(require 'fixmee)
(global-fixmee-mode 1)

;; Sudoku
(add-to-list 'auto-mode-alist '("\\.sdk\\'" . sudoku-mode))

;; Insert current date function
;; Reference: https://www.emacswiki.org/emacs/InsertingTodaysDate
(require 'calendar)
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
