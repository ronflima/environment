(define-skeleton brazuca-dot-activity-diagram
  "Graphviz DOT Activity Diagram"
  \n
  > "/* -*- mode:dot;coding:utf-8 -*-" \n
  > "*" \n
  > "* Copyright (c)" _ (format-time-string "%Y" (current-time)) _ " - " _ user-company-name _ " - All Rights Reserved" \n
  > "* Created: " _ (format-time-string "%Y-%m-%d" (current-time)) _ " by " _ (user-full-name) _ "<" _ user-mail-address _ ">" _ \n
  > "*" \n
  > "* This file purpose: " _ (skeleton-read "This file purpose: ") _ \n
  > "*/" _ \n
  > "digraph " _ (skeleton-read "Graph name: ") _ " {" \n
  > "start [shape=circle, style=filled, fillcolor=black, label=\"\"];" _ \n
  > "end [shape=doublecircle, style=filled, fillcolor=black, label=\"\"];" _ \n
  > \n
  > "}" \n
 )

