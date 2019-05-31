(define-skeleton html-bootstrap-file
  "HTML File with bootstrap support"
  \n
  > "<!DOCTYPE HTML>" \n
  > "<html>" \n
  > "<head>" \n
  > "<meta charset=\"UTF-8\">" \n
  > "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">" \n
  > "<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css\" integrity=\"sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB\" crossorigin=\"anonymous\">" \n
  > "<link href=\"css/styles.css\" rel=\"stylesheet\" type=\"text/css\">" \n
  > "<link rel=\"shortcut icon\" type=\"image/png\" href=\"img/favicon.png\">" \n
  > "<title>" _ (skeleton-read "Page title: ") _ "</title>" \n
  > "</head>" \n
  > "<body>" \n
  > "<script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>" \n
  > "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\" integrity=\"sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49\" crossorigin=\"anonymous\"></script>" \n
  > "<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js\" integrity=\"sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T\" crossorigin=\"anonymous\"></script>" \n
  > "</body>" \n
  > "</html>" \n
)
