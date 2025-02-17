(define-skeleton brazuca-org-file
  "Org File Brazuca way"
  \n
  > "#-*-mode:org-*-" \n
  > "# Copyright (c) " _ (format-time-string "%Y" (current-time)) _ " - " _ user-company-name _ " - All rights reserved" \n
  > "# Created at " _ (format-time-string "%Y-%m-%d" (current-time)) \n
  > "# Author: " _ (user-full-name) _ "<" _ user-mail-address _ ">" _ \n
  > "# Purpose: " _ (skeleton-read "This file purpose: ") \n
  > "#+OPTIONS: ^:{}" \n)

(defun brazuca-workdays()
  "Outputs a list of working days in Org Mode format"
  (let ((weekday '("Monday" "Tuesday" "Wednesday" "Thursday" "Friday")))
    (mapc (lambda (d) (insert (concat "* " d "\n** Activity Plan\n"))) weekday)))

(define-skeleton brazuca-weekly-timesheet
  "Org file for weekly time sheet reports"
  \n
  > "#-*-mode:org-*-" \n
  > "# Copyright (c) " _ (format-time-string "%Y" (current-time)) _ " - " _ user-company-name _ " - All rights reserved" \n
  > "# Created at " _ (format-time-string "%Y-%m-%d" (current-time)) \n
  > "# Author: " _ (user-full-name) _ "<" _ user-mail-address _ ">" _ \n
  > "# Purpose: " _ (skeleton-read "This file purpose: ") \n
  > "#+OPTIONS: toc:nil" \n \n
  > "* Time Report" \n \n
  > "This time report is for the following period:" \n \n
  > "- Starting at " (skeleton-read "Starting date: ") \n
  > "- Ending at " (skeleton-read "End date: ") \n \n
  > "The following table summarizes the worked hours." \n
  > "#+BEGIN: clocktable :scope file :maxlevel 2" \n
  > "#+CAPTION: Time Summary" \n
  > "#+END:" \n
  > (brazuca-workdays) \n)
