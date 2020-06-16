;; Javascript and Node related skeletons

(define-skeleton django-fixture
  "Django Fixture Skeleton"
  > "{" ?\n
  >  "\"model\": \""  (skeleton-read "Model: ")  "\"," ?\n
  >  "\"pk\": " (skeleton-read "PK: ")  "," ?\n
  >  "\"fields\": {" ?\n
  >  "}" ?\n
  > "}," \n
  )

