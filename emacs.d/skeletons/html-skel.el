(define-skeleton html-bootstrap-file
  "HTML File with bootstrap support"
  \n
  > "<!doctype html>" \n
  > "<html lang=\"en\">" \n
  > "<head>" \n
  > "<!-- Required meta tags -->" \n
  > "<meta charset=\"utf-8\">" \n
  > "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">" \n
  > "<!-- Bootstrap CSS -->" 
  > "<link rel=\"stylesheet\"" \n
  > "href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\"" \n
  > "integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\"" \n
  > "crossorigin=\"anonymous\">" \n 
  > "<title>" _ (skeleton-read "Title: ") _ "</title>" \n
  > "</head>" \n
  > "<body>" \n \n 
  > "<!-- Optional JavaScript -->" \n
  > "<!-- jQuery first, then Popper.js, then Bootstrap JS -->" \n
  > "<script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" " \n
  > "integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" " \n
  > "crossorigin=\"anonymous\"></script>" \n
  > "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\" " \n
  > "integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\" " \n
  > "crossorigin=\"anonymous\"></script>" \n
  > "<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\" " \n
  > "integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\" " \n
  > "crossorigin=\"anonymous\"></script>" \n
  > "</body>" \n
  > "</html>" \n
)
