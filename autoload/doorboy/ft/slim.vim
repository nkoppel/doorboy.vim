" vim: set iskeyword-=#:

"
" This ftplugin requires vim-slim.
" https://github.com/slim-template/vim-slim
"

function! doorboy#ft#slim#setup()
  inoremap <buffer> <expr> \| doorboy#ft#slim#put_ruby_quotation('\|')
  inoremap <buffer> <expr> / doorboy#ft#slim#put_ruby_quotation('/')
  inoremap <buffer> <expr> # doorboy#ft#slim#put_interpolation_in_string('#')
endfunction

function! doorboy#ft#slim#put_ruby_quotation(quotation)
  if doorboy#util#current_synIDattr_name() =~? 'ruby'
    return doorboy#mapping#put_quotation(a:quotation)
  endif
  return a:quotation
endfunction

function! doorboy#ft#slim#put_interpolation_in_string(char)
  if doorboy#util#current_synIDattr_name() =~? 'ruby'
    return doorboy#ft#ruby#put_interpolation_in_string(a:char)
  endif
  return a:char
endfunction
