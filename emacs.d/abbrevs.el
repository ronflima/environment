;;-*-coding: utf-8;-*-
(define-abbrev-table 'json-mode-abbrev-table
  '(
    ("jfix" "" django-fixture :count 0)
   ))

(define-abbrev-table 'python-mode-abbrev-table
  '(
    ("brk" "# DEBUG
    import pdb; pdb.set_trace()" nil :count 5)
    ("ctxget" "    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context
" nil :count 3)
   ))

