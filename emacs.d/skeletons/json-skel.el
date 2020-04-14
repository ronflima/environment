;; Javascript and Node related skeletons

(define-skeleton django-fixture
  "Django fixture skeleton"
  > "{" \n
  >  "\"model\": \"" _ (skeleton-read "Model:") _ "\"," ?\n
  >  "\"pk\": " _ (skeleton-read "PK:") _ "," ?\n
  >  "\"fields\": {" ?\n
  >  "}" ?\n
  > "}," ?\n
  )

