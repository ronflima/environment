(define-skeleton skel-sql-file
  "SQL internal file"
  \n
  > "-- -*-sql-*-" \n
  > "--" \n
  > "-- (c) " (format-time-string "%Y" (current-time)) " Nineteen Apps - All Rights Reserved" \n
  > "-- Created: " (format-time-string "%Y-%m-%d" (current-time))_ " by " _ (user-full-name) _ \n
  > "--" \n
  > "-- This file purpose: " (skeleton-read "This file purpose: ") \n
  > "--" \n \n
)
