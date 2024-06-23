;; Javascript and Node related skeletons

(define-skeleton node-new-file
  "New node javascript file"
  > "/* -*-javascript-*- */" \n
  > "//" \n
  > "// Copyright (c) " (format-time-string "%Y") " - " _ user-company-name _ " - All rights Reserved" \n
  > "//" \n
  > "// *DISCLAIMER*" \n
  > "//" \n
  > "// This is copyrighted material. This is not free or open software. This" \n
  > "// source-code is private and property of Brazuca Studio." \n
  > "//" \n
  > "// Created: " (format-time-string "%Y-%m-%d" (current-time))_ " by " _ (user-full-name) _ "<" _ user-mail-address _ ">" _ \n
  > "//" \n
  \n
  > "//" \n
  > "// ## Purpose" \n
  > "// " (skeleton-read "This file purpose: ") \n
  > "//" \n _ \n _ \n
  > "'use strict'" \n _ \n
  )

(define-skeleton node-router
  "Node controller"
  > "/* -*-javascript-*- */" \n
  > "//" \n
  > "// Copyright (c) " _ (format-time-string "%Y") _ " - " _ user-company_name _ " - All rights Reserved" \n
  > "//" \n
  > "// *DISCLAIMER*" \n
  > "//" \n
  > "// This is copyrighted material. This is not free or open software. This" \n
  > "// source-code is private and property of Brazuca Studio" \n
  > "//" \n
  > "// Created: " (format-time-string "%Y-%m-%d" (current-time))_ " by " _ (user-full-name) _ "<" _ user-mail-address _ ">" _ \n
  > "//" \n
  \n
  > "//" \n
  > "// ## Purpose" \n
  > "// " (skeleton-read "This controller purpose: ") \n
  > "//" \n _ \n
  > "'use strict'" \n _ \n
  > "const router = require('express').Router()" \n _ \n
  > "router.post('" (setq v1 (skeleton-read "Route: " "/"))  "', (req, res, next) => {" \n
  > "// TODO: Implement this method" \n
  > "res.status(501).end()" \n
  > "})" \n _ \n
  > "router.get('" v1 "', (req, res, next) => {" \n
  > "// TODO: Implement this method" \n
  > "res.status(501).end()" \n
  > "})" \n _ \n
  > "router.get('" v1 "/:id', (req, res, next) => {" \n
  > "// TODO: Implement this method" \n
  > "res.status(501).end()" \n
  > "})" \n _ \n
  > "router.put('" v1 "/:id', (req, res, next) => {" \n
  > "// TODO: Implement this method" \n
  > "res.status(501).end()" \n
  > "})" \n _ \n
  > "router.delete('" v1 "/:id', (req, res, next) => {" \n
  > "// TODO: Implement this method" \n
  > "res.status(501).end()" \n
  > "})" \n _ \n
  > "module.exports = router"\n
  )

(define-skeleton js-mit
  "Open-source javascript file"
  > "// -*-javascript-*-" \n
  > "//" \n
  > "// MIT License" \n
  > "//" \n
  > "// Copyright (c) " (format-time-string "%Y") _ "- " _ user-company-name _ " - All rights reserved." _ \n
  > "//" \n
  > "// Permission is hereby granted, free of charge, to any person obtaining a copy" \n
  > "// of this software and associated documentation files (the \"Software\"), to deal" \n
  > "// in the Software without restriction, including without limitation the rights" \n
  > "// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell" \n
  > "// copies of the Software, and to permit persons to whom the Software is" \n
  > "// furnished to do so, subject to the following conditions:" \n
  > "//" \n
  > "// The above copyright notice and this permission notice shall be included in all" \n
  > "// copies or substantial portions of the Software." \n
  > "//" \n
  > "// THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR" \n
  > "// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY," \n
  > "// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE" \n
  > "// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER" \n
  > "// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM," \n
  > "// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE" \n
  > "// SOFTWARE." \n
  > "//" \n
  > "// Purpose: " _ (skeleton-read "This file purpose: ") \n
  > "//" \n _ \n 
  > "'use strict'" \n
  )
