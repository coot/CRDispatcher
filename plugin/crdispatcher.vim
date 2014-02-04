" Author: Marcin Szamotulski
" Email:  mszamot [AT] gmail [DOT] com
" License: vim-license, see :help license
"
" This plugin is a dependency for three other plugins:
"   * system : http://www.vim.org/scripts/script.php?script_id=4224
"   * CommandAlias : http://www.vim.org/scripts/script.php?script_id=4250
"   * EnchantedVim: http://www.vim.org/scripts/script.php?script_id=4849
"
" It registers an object CRDispatcher to which you can append function which
" will change command line.  For exampe  
"
" fun Fun(cmdline):
"   " Transform cmdline.
"   return cmdline
" endfun
" call add(CRDispatcher['/'], function('Fun'))
" call add(CRDispatcher[':'], function('Fun'))
"
" All the registered call backs (for a given command line type) will be called
" after you hit enter: they are triggered with a custom
"     cm <CR> <Plug>CRDsipatch
" map.
"
" For examples how this can be used to enhance vim funcionality please look
" into the three plugins.
"
" Happy Viming,
" Marcin

let CRDispatcher = crdispatcher#CRDispatcher
fun CRDispatch()
    return CRDispatcher.dispatch()
endfun
cno <Plug>CRDispatch <C-\>eCRDispatcher.dispatch()<CR><CR>
cno <C-M> <CR>
cm <CR> <Plug>CRDispatch
