let s:unite_source = {
      \ 'name': 'qflist',
      \ }

function! s:unite_source.gather_candidates(args, context)

  let res = []
  for val in getqflist()
    let name = bufname(val.bufnr)
    let dict = {
          \ 'word': printf("%s|%d:%d|%s", name, val.lnum, val.col, matchstr(val.text, '\s*\zs.*\S')),
          \ 'source': 'qflist',
          \ "kind": "jump_list",
          \ 'action__path': name,
          \ 'action__line': val.lnum,
          \ 'action__pattern': val.pattern
          \}
    call add(res, dict)
  endfor

  return res

endfunction

function! unite#sources#qflist#define()
  return s:unite_source
endfunction
