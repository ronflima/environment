(require 'package)
(package-refresh-contents)
(custom-set-variables
 '(package-selected-packages
   (quote
    (web-mode virtualenvwrapper py-autopep8 fixmee auto-complete))))
(package-install-selected-packages)
(kill-emacs 0)
