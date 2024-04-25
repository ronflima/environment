;; Emacs Customizations
;; Author: Ronaldo F. Lima <ronaldo@brazuca.dev>

(load-library (expand-file-name "preferences.el" user-emacs-directory))
(setq custom-file (expand-file-name "customizations.el" user-emacs-directory))
(when 
       (file-exists-p custom-file)
       (load custom-file)
)
