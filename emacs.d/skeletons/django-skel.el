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
(define-skeleton django-html-form
  "Django HTML form for Django templates"
  \n
  > "<form method=\"post\" class=\"w-25 mx-auto border border-primary-subtle rounded p-4 shadow\">" \n
  > "{% csrf_token %}" \n
  > "<div class=\"container-fluid\">" \n
  > "{% include \"form.html\" %}" \n
  > "</div>" \n
  > "<div class=\"container-fluid mt-2 text-center\">" \n
  > "<button class=\"btn btn-primary\" type=\"submit\">{% translate \"Entrar\" %}</button>" \n
  > "</div>" \n
  > "<div class=\"container-fluid mt-2\">"
  > "<a href=\"{% url 'password_reset' %}\" class=\"link-secondary\">{% translate \"Esqueci minha senha\" %}</a>" \n
  > "</div>" \n
  > "</form>" \n
  )
