(define-skeleton brazuca-yaml
  "Yaml template"
  \n
  "# -*-mode:yaml-*-" \n
  "#" \n
  "# Copyright (c) " _ (format-time-string "%Y" (current-time)) _ " - " _ user-company-name _ " - All rights reserved" \n
  "# Created at " _ (format-time-string "%Y-%m-%d" (current-time)) \n
  "# Author: " _ (user-full-name) _ "<" _ user-mail-address _ ">" _ \n
  "# Purpose: " _ (skeleton-read "This file purpose: ") \n
  "#" \n)
