(define-skeleton skel-sql-file
  "SQL internal file"
  \n
  > "-- -*-sql-*-" \n
  > "-- Copyright (c) " (format-time-string "%Y" (current-time)) _ user-company-name - " - All Rights Reserved" \n
  > "-- Created: " (format-time-string "%Y-%m-%d" (current-time))_ " by " _ (user-full-name) _ "<" _ user-mail-address _ ">" _ \n
  > "--" \n
  > "-- This file purpose: " (skeleton-read "This file purpose: ") \n
  > "--" \n \n
)
