;; Emacs Customizations
;; Author: Ronaldo F. Lima <ronaldo@chicletemkt.com>

(load-library "~/.emacs.d/preferences.el")
(setq custom-file (expand-file-name "customizations.el" user-emacs-directory))
   (when (file-exists-p custom-file)
            (load custom-file))
