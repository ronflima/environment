(define-skeleton c-mit-file
  "C MIT Licensed File"
  \n
  > "/* -*-c-*-" \n
  > "The MIT License (MIT)" \n
  >  \n
  > "Copyright (c) " _ (format-time-string "%Y" (current-time)) _ " - Ronaldo Faria Lima" \n 
  >  \n
  > "Permission is hereby granted, free of charge, to any person obtaining a copy" \n
  > "of this software and associated documentation files (the \"Software\"), to deal" \n
  > "in the Software without restriction, including without limitation the rights" \n
  > "to use, copy, modify, merge, publish, distribute, sublicense, and/or sell" \n
  > "copies of the Software, and to permit persons to whom the Software is" \n
  > "furnished to do so, subject to the following conditions:" \n
  >  \n
  > "The above copyright notice and this permission notice shall be included in all" \n
  > "copies or substantial portions of the Software." \n
  >  \n
  > "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR" \n
  > "IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY," \n
  > "FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE" \n
  > "AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER" \n
  > "LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM," \n
  > "OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE" \n
  > "SOFTWARE." \n
  > \n
  > "Created: " (format-time-string "%Y-%m-%d" (current-time))_ " by " _ (user-full-name) _ \n
  > \n
  > "This file purpose: " (skeleton-read "This file purpose: ") \n
  > "*/" \n \n
)
