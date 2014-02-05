# CRDispatcher Vim Plugin
This is a utility plugin which is used in my other Vim plugins.  It let
regieter callback functions which transform the command line after hitting
enter: for example EnchantedVim is using it to add `\v` to patterns.

It also has a nice hack to make `c_CTRL-f` work nicely: it will transform
the line when entering the command line.  The `crdispatcher#CRDsiaptcher` dict
which is passed to callbacks has `ctrl_f` entry which is `1` in this case.
This is useful if a callback should only be used with `<cr>` or `ctrl-f`.

The plugins that depend on it are:
* [System](https://github.com/coot/System)
* [CommandAlias](https://www.github.com/coot/cmdalias_vim)
* [EnchantedVim](https://github.com/coot/EnchantedVim)

## Callbacks
Every callback function axcepts one argument: the crdispatcher#CRDispatcher
dictionary, and it can modify the cmdline value.

## Note
You can use the expression register with Vim 7.3.686 or later.  With an earlier version
you will not be able to use it.

## Code
This plugin is a simple example of OO programing in VimL.

* Copyright: © Marcin Szamotulski, 2014
* License: vim-license, see `:help license`
