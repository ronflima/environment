(define-skeleton django-html-template
  "Django HTML template"
  \n
  > "{% extends \"base.html\" %}" \n
  > "{% comment %}" \n
  > "*****" \n
  > "# Copyright (c)" (format-time-string "%Y" (current-time)) _ " - " _ user-company-name _ " - All Rights Reserved" \n 
  > "#" \n
  > "# Created: " _ (format-time-string "%Y-%m-%d" (current-time))_ " by " _ (user-full-name) _ "<" _ user-mail-address _ ">" _ \n
  > "#" \n
  > "# This file purpose: " (skeleton-read "This file purpose: ") \n
  > "*****" \n \n
  > "{% endcomment %}" \n \n
  > "{% load i18n %}" \n
 )
