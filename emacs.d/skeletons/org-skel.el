(define-skeleton brazuca-org-file
  "Org File Brazuca way"
  \n
  > "# -*-mode:org-*-" \n
  > "# Copyright (c) " _ (format-time-string "%Y" (current-time)) _ " - " _ user-company-name _ " - All rights reserved" \n
  > "# Created at " _ (format-time-string "%Y-%m-%d" (current-time)) \n
  > "# Author: " _ (user-full-name) _ "<" _ user-mail-address _ ">" _ \n
  > "# Purpose: " _ (skeleton-read "This file purpose: ") \n
  > "#+OPTIONS: ^:{}" \n)

(defun brazuca-workdays()
  "Outputs a list of working days in Org Mode format"
  (let ((weekday '("Monday" "Tuesday" "Wednesday" "Thursday" "Friday")))
        (setq activity-plan (mapc (lambda (d) (insert (concat "** " d "\n\n*** Activity Plan\n\n\n"))) weekday))
        (apply 'concat activity-plan)))

(define-skeleton brazuca-weekly-timesheet
  "Org file for weekly time sheet reports"
  \n
  "# -*-mode:org-*-" \n
  "# Copyright (c) " _ (format-time-string "%Y" (current-time)) _ " - " _ user-company-name _ " - All rights reserved" \n
  "# Created at " _ (format-time-string "%Y-%m-%d" (current-time)) \n
  "# Author: " _ (user-full-name) _ "<" _ user-mail-address _ ">" _ \n
  "# Purpose: " _ (skeleton-read "This file purpose: ") \n
  "#+OPTIONS: toc:nil" \n \n
  "* Time Report" \n \n
  "Client: " (skeleton-read "Client: ") \n
  "This time report is for the following period:" \n \n
  "- Starting at " \n
  > "- Ending at " \n \n
  "The following table summarizes the worked hours." \n
  "#+BEGIN: clocktable :scope file :maxlevel 2 :header \"#+NAME: clocktable\\n\"" \n
  "#+CAPTION: Time Summary" \n
  "#+END:" \n
  \n \n
  "** Billable hours" \n \n
  "#+TBLNAME:billablehours" \n
  "|-" \n
  "|Description|Time|" \n
  "|-" \n
  "|Working Time||" \n
  "|-" \n
  "| Total||" \n
  "#+TBLFM: @2$2=remote(clocktable,@2$2);T" \n
  "* Detailed Week Work" \n \n
  > (brazuca-workdays) \n)
