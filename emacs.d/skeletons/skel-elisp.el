(define-skeleton elisp-mit-file
  "ELisp MIT Licensed File"
  \n
  > ";; MIT License" \n
  > ";;" \n
  > ";; Copyright (c) " _(format-time-string "%Y" (current-time)) _ " - " user-company-name \n
  > ";; Created: " (format-time-string "%Y-%m-%d" (current-time))_ " by " _ (user-full-name) _ " <" _ user-mail-address _ ">" _ \n
  > ";;" \n
  > ";; Permission is hereby granted, free of charge, to any person" \n
  > ";; obtaining a copy of this software and associated documentation" \n
  > ";; files (the \"Software\"), to deal in the Software without" \n
  > ";; restriction, including without limitation the rights to use, copy," \n
  > ";; modify, merge, publish, distribute, sublicense, and/or sell copies" \n
  > ";; of the Software, and to permit persons to whom the Software is" \n
  > ";; furnished to do so, subject to the following conditions:" \n
  > ";;" \n
  > ";; The above copyright notice and this permission notice shall be" \n
  > ";; included in all copies or substantial portions of the Software." \n
  > ";;" \n
  > ";; THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND," \n
  > ";; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF" \n
  > ";; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND" \n
  > ";; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS" \n
  > ";; BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN" \n
  > ";; ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN" \n
  > ";; CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE" \n
  > ";; SOFTWARE." \n
  > ";;" \n \n
  > ";;" \n
  > ";; " (skeleton-read "This file purpose: ") \n
  > ";;" \n \n
)

