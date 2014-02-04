let crdispatcher#CRDispatcher = {
    \ '/': [],
    \ '?': [],
    \ ':': [],
    \ '>': [],
    \ '@': [],
    \ '-': [],
    \ }
fun! crdispatcher#CRDispatcher.dispatch() dict
    echom 'crdispatcher#CRDispatcher.dispatch'
    let cmdtype = getcmdtype()
    let cmdlines = split(getcmdline(), '\\\@<!|')
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
