(define-skeleton dot-chtmkt
  "Graphviz DOT Chiclete Mkt file"
  \n
  > "/* -*- mode:dot;coding:utf-8 -*-" \n
  > "*" \n
  > "* Copyright (c)" _ (format-time-string "%Y" (current-time)) _ " - Chicletemkt - All Rights Reserved" \n
  > "* Created: " _ (format-time-string "%Y-%m-%d" (current-time)) _ " by " _ (user-full-name) _ \n
  > "*" \n
  > "* This file purpose: " _ (skeleton-read "This file purpose: ") _ \n
  > "*/" _ \n
 )

