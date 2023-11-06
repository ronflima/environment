(define-skeleton python-mit
  "Python MIT Licensed File"
  \n
  > "# -*-mode:python;encoding:utf-8-*-" \n
  > "# The MIT License (MIT)" \n
  > "# Copyright (c)" (format-time-string "%Y" (current-time)) _ " - Chicletemkt Tecnologia e Marketing Ltda" \n 
  > "#" \n
  > "# Permission is hereby granted, free of charge, to any person obtaining a copy" \n
  > "# of this software and associated documentation files (the \"Software\"), to deal" \n
  > "# in the Software without restriction, including without limitation the rights" \n
  > "# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell" \n
  > "# copies of the Software, and to permit persons to whom the Software is" \n
  > "# furnished to do so, subject to the following conditions:" \n
  > "#" \n
  > "# The above copyright notice and this permission notice shall be included in all" \n
  > "# copies or substantial portions of the Software." \n
  > "#"  \n
  > "# THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR" \n
  > "# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY," \n
  > "# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE" \n
  > "# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER" \n
  > "# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM," \n
  > "# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE" \n
  > "# SOFTWARE." \n
  > "#" \n
  > "# Created: " _ (format-time-string "%Y-%m-%d" (current-time))_ " by " _ (user-full-name) _ \n
  > "#" \n
  > "# This file purpose: " (skeleton-read "This file purpose: ") \n \n
 )

(define-skeleton python-mit-setup
  "Python MIT-licensed setup package"
    \n
  > "# -*-mode:python;encoding:utf-8-*-" \n
  > "# The MIT License (MIT)" \n
  > "# Copyright (c)" (format-time-string "%Y" (current-time)) _ " - Chicletemkt Tecnologia e Marketing Ltda" \n 
  > "#" \n
  > "# Permission is hereby granted, free of charge, to any person obtaining a copy" \n
  > "# of this software and associated documentation files (the \"Software\"), to deal" \n
  > "# in the Software without restriction, including without limitation the rights" \n
  > "# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell" \n
  > "# copies of the Software, and to permit persons to whom the Software is" \n
  > "# furnished to do so, subject to the following conditions:" \n
  > "#" \n
  > "# The above copyright notice and this permission notice shall be included in all" \n
  > "# copies or substantial portions of the Software." \n
  > "#"  \n
  > "# THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR" \n
  > "# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY," \n
  > "# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE" \n
  > "# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER" \n
  > "# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM," \n
  > "# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE" \n
  > "# SOFTWARE." \n
  > "#" \n
  > "# Created: " _ (format-time-string "%Y-%m-%d" (current-time))_ " by " _ (user-full-name) _ \n
  > "#" \n
  > "# This file purpose: " _ (skeleton-read "This file purpose: ") \n \n
  > "with open(\"README.md\", \"r\") as fh:" ?\n
  > "long_description = fh.read()" \n \n
  "setuptools.setup(" \n
  > "name=\"" _ (skeleton-read "This package name: ") _ "\"," ?\n
  > "version=\"0.0.1\"," ?\n
  > "author=\"" _ (user-full-name) _ "\"," ?\n
  > "author_email=\"" _ (skeleton-read "Your email address: ") _"\"," ?\n
  > "description=\"" _ (skeleton-read "Package description: ") _ "\"," ?\n
  > "long_description=long_description," ?\n
  > "long_description_content_type=\"text/markdown\"," ?\n
  > "url=\"" _ (skeleton-read "Project URL: ") _ "\"," ?\n
  > "packages=setuptools.find_packages()," ?\n
  > "classifiers=[" ?\n
  > "\"Programming Language :: Python :: 3\"," ?\n
  > "\"License :: OSI Approved :: MIT License\"," ?\n
  > "\"Operating System :: OS Independent\"," ?\n
  > "]," ?\n
  > "python_requires='>=3.6'," ?\n
  > ")" ?\n
  )
