"============================================================================
"File:        vile.vim [coffeescript]
"Description: CoffeeScript based syntax checking plugin for syntastic.vim
"             It contains various types of .ts related vile plugins
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
" Checker: vile-coffeelint
"============================================================================

if !exists('g:loaded_syntastic_coffee_vile_coffeelint_checker')
    let g:loaded_syntastic_coffee_vile_coffeelint_checker = 1

    if !exists('g:syntastic_coffee_vile_coffeelint_sort')
        let g:syntastic_coffee_vile_coffeelint_sort = 1
    endif

    function! SyntaxCheckers_coffee_vile_coffeelint_IsAvailable() dict
        return executable(self.getExec())
    endfunction

    function! SyntaxCheckers_coffee_vile_coffeelint_GetLocList() dict
        let makeprg = self.makeprgBuild({
                    \ 'args': 'analyze -p coffeelint -f syntastic -n -d' })

        let errorformat = '%f:%l:%c: %t: %m'

        return SyntasticMake({
            \ 'makeprg': makeprg,
            \ 'errorformat': errorformat,
            \ 'subtype': 'Style'})
    endfunction

    call g:SyntasticRegistry.CreateAndRegisterChecker({
                \ 'filetype': 'coffee',
                \ 'name': 'vile_coffeelint',
                \ 'exec': 'vile' })
endif

"============================================================================

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
