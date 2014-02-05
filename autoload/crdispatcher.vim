" Author: Marcin Szamotulski
" Email:  mszamot [AT] gmail [DOT] com
" License: vim-license, see :help license

let crdispatcher#CRDispatcher = {
	    \ 'callbacks': []
	    \ }
fun! crdispatcher#CRDispatcher.dispatch(...) dict
    if a:0 >= 1
	let self.ctrl_f = a:1
    else
	let self.ctrl_f = 0
    endif
    let self.cmdtype = getcmdtype()
    let self.line = getcmdline()
    " split cmdline into | segments
    " TODO: this split will not work well when a range has a search very magic
    " pattern, like (a|b|c)
    let cmdlines = split(self.line, '\\\@<!|')
    let new_cmdlines = []
    for cmdline in cmdlines
	let self.cmdline = cmdline
	for F in self['callbacks']
	    " every callback has accass to whole self and can change
	    " self.cmdline
	    call F(self)
	endfor
	call add(new_cmdlines, self.cmdline)
    endfor
    return join(new_cmdlines, '|')
endfun
