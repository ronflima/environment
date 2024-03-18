(require 'package)
(package-refresh-contents)
(custom-set-variables
 '(package-selected-packages
   (quote
    (
     auto-complete
     exec-path-from-shell
     fixmee
     go-model pyenv-mode
     highlight-indentation
     jedi
     load-env-vars
     markdown-mode
     py-autopep8
     virtualenvwrapper
     web-mode
     ))))
(package-install-selected-packages)
(kill-emacs 0)
