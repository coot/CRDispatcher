" Author: Marcin Szamotulski
" Email:  mszamot [AT] gmail [DOT] com
" License: vim-license, see :help license

let g:CRDispatcher = crdispatcher#CRDispatcher
fun! CRDispatch()
    return g:CRDispatcher.dispatch()
endfun
cno <C-M> <CR>
cno <Plug>CRDispatch <C-\>eCRDispatcher.dispatch()<CR><CR>
cm <expr> <CR> index(['>', ''], getcmdtype()) != -1 && exists('g:CRDispatcher') ? '<CR>' :  '<Plug>CRDispatch'

" Clever <c-f> fix:
cno <c-f> <C-\>eCRDispatcher.dispatch(1)<CR><c-f>
