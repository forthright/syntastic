"============================================================================
"File:        vile.vim [haskell]
"Description: Haskell based syntax checking plugin for syntastic.vim
"             It contains various types of .hs related vile plugins
"Maintainer:  Brent Lintner <brent.lintner@gmail.com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"============================================================================

let s:save_cpo = &cpo
set cpo&vim

"============================================================================
" Checker: vile-hlint
"============================================================================

if !exists('g:loaded_syntastic_haskell_vile_hlint_checker')
    let g:loaded_syntastic_haskell_vile_hlint_checker = 1

    if !exists('g:syntastic_haskell_vile_hlint_sort')
        let g:syntastic_haskell_vile_hlint_sort = 1
    endif

    function! SyntaxCheckers_haskell_vile_hlint_IsAvailable() dict
        return executable(self.getExec())
    endfunction

    function! SyntaxCheckers_haskell_vile_hlint_GetLocList() dict
        let makeprg = self.makeprgBuild({
                    \ 'args': 'punish -p hlint -f syntastic -n -d' })

        let errorformat = '%f:%l:%c: %t: %m'

        return SyntasticMake({
            \ 'makeprg': makeprg,
            \ 'errorformat': errorformat,
            \ 'subtype': 'Style'})
    endfunction

    call g:SyntasticRegistry.CreateAndRegisterChecker({
                \ 'filetype': 'haskell',
                \ 'name': 'vile_hlint',
                \ 'exec': 'vile' })
endif

"============================================================================

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
