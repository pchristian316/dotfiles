lua require('core.init')

set clipboard+=unnamedplus

set inccommand=nosplit
" set colorcolumn=81

if has('unix')
	set thesaurus+=/usr/share/dict/words
endif

autocmd FileType markdown setlocal spell

colorscheme base16-kanagawa
colorscheme kanagawa
