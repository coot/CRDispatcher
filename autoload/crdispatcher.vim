" Author: Marcin Szamotulski
" Email:  mszamot [AT] gmail [DOT] com
" License: vim-license, see :help license

let crdispatcher#CRDispatcher = {
    \ '/': [],
    \ '?': [],
    \ ':': [],
    \ '>': [],
    \ '@': [],
    \ '-': [],
    \ }
fun! crdispatcher#CRDispatcher.dispatch(...) dict
    let cmdtype = getcmdtype()
    if empty(cmdtype)
	let cmdtype = ':'
    endif
    " TODO: this split will not work well when a range has a search very magic
    " pattern, like (a|b|c)
    if a:0 == 0
	let line = getcmdline()
    else
	let line = a:1
    endif
    " echom 'crdispatcher#CRDispatcher.dispatch: '.line
    let cmdlines = split(line, '\\\@<!|')
    let new_cmdlines = []
    for cmdline in cmdlines
	if has_key(self, cmdtype)
	    let funcrefs = get(self, cmdtype)
	    for F in funcrefs
		let cmdline = F(cmdline)
	    endfor
	endif
	call add(new_cmdlines, cmdline)
    endfor
    return join(new_cmdlines, '|')
endfun
