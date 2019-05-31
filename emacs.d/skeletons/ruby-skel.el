;;
;; Skeletons for ruby language
;;

(define-skeleton ruby-formaweb-file
  "Ruby file for Formaweb projects"
  > "# -*-ruby-*-" \n
  > "# Copyright (c) " (format-time-string "%Y" (current-time)) " - Nineteen - All rights reserved"\n
  > "#" \n
  > "# Author:: " (user-full-name) \n
  > "# Created:: " (format-time-string "%Y-%m-%d" (current-time)) \n
  > "#"\n
  > "# " (skeleton-read "This file purpose: ") \n
  > \n
)
