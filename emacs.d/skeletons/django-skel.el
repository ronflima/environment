(define-skeleton django-html-template
  "Django HTML template"
  \n
  "{% extends \"base.html\" %}" \n
  "{% comment %}" \n
  "*****" \n
  "Copyright (c)" (format-time-string "%Y" (current-time)) " - " user-company-name " - All Rights Reserved" \n \n
  "Created: "  (format-time-string "%Y-%m-%d" (current-time)) " by " (user-full-name) " - (" user-mail-address ")" \n
  "This file purpose: " (skeleton-read "This file purpose: ") \n
  "*****" \n \n
  "{% endcomment %}" \n \n
  "{% load i18n %}" \n
 )
