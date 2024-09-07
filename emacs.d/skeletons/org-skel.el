(define-skeleton brazuca-org-file
  "Org File Brazuca way"
    \n
    > "# -*-mode:org-*-" \n
    > "# Copyright (c) " _ (format-time-string "%Y" (current-time)) _ " - " _ user-company-name _ " - All rights reserved" \n
    > "# Created at " _ (format-time-string "%Y-%m-%d" (current-time)) \n
    > "# Author: " _ (user-full-name) _ "<" _ user-mail-address _ ">" _ \n
    > "# Purpose: " _ (skeleton-read "This file purpose: ") \n
    > "#+OPTIONS: ^:{}" \n
 )
