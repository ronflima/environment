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
;; OS-related customizations
;;
(cond
 ;; Windows
 ((string-equal system-type "windows-nt")
  (global-set-key [f2] 'powershell)
  (set-face-attribute 'default nil :family "SourceCodePro" :height 140 :weight 'regular))
 
 ;; MacOS
 ((string-equal system-type "darwin")
  (set-face-attribute 'default nil :family "SourceCodePro" :height 140 :weight 'normal)
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
  (set-face-attribute 'default nil :family "SourceCodePro" :height 140 :weight 'regular)
  (setq dired-listing-switches "-aBhl --group-directories-first")
  ;; Support to inferior shell
  (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
  (global-set-key [f2] 'shell)
  (setenv "PATH" (concat "/usr/local/bin" ":" (getenv "PATH")))
  (setq shell-file-name "bash")
  (setenv "SHELL" shell-file-name)
  (setq exec-path (append exec-path '("/usr/local/bin")))
  (setq explicit-bash-args '("--noediting" "--login" "-i")))
 )
