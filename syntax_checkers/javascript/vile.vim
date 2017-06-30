"============================================================================
"File:        vile.vim [javascript]
"Description: JS based syntax checking plugin for syntastic.vim
"             It contains various types of JS related vile plugins
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
" Checker: vile-eslint
"============================================================================

if !exists('g:loaded_syntastic_javascript_vile_eslint_checker')
    let g:loaded_syntastic_javascript_vile_eslint_checker = 1

    if !exists('g:syntastic_javascript_vile_eslint_sort')
        let g:syntastic_javascript_vile_eslint_sort = 1
    endif

    function! SyntaxCheckers_javascript_vile_eslint_IsAvailable() dict
        return executable(self.getExec())
    endfunction

    function! SyntaxCheckers_javascript_vile_eslint_GetLocList() dict
        let makeprg = self.makeprgBuild({
                    \ 'args': 'analyze -p eslint -f syntastic -n -d' })

        let errorformat = '%f:%l:%c: %t: %m'

        return SyntasticMake({
            \ 'makeprg': makeprg,
            \ 'errorformat': errorformat,
            \ 'subtype': 'Style'})
    endfunction

    call g:SyntasticRegistry.CreateAndRegisterChecker({
                \ 'filetype': 'javascript',
                \ 'name': 'vile_eslint',
                \ 'exec': 'vile' })
endif

"============================================================================
" Checker: vile-jshint
"============================================================================

if !exists('g:loaded_syntastic_javascript_vile_jshint_checker')
    let g:loaded_syntastic_javascript_vile_jshint_checker = 1

    if !exists('g:syntastic_javascript_vile_jshint_sort')
        let g:syntastic_javascript_vile_jshint_sort = 1
    endif

    function! SyntaxCheckers_javascript_vile_jshint_IsAvailable() dict
        return executable(self.getExec())
    endfunction

    function! SyntaxCheckers_javascript_vile_jshint_GetLocList() dict
        let makeprg = self.makeprgBuild({
                    \ 'args': 'analyze -p jshint -f syntastic -n -d' })

        let errorformat = '%f:%l:%c: %t: %m'

        return SyntasticMake({
            \ 'makeprg': makeprg,
            \ 'errorformat': errorformat,
            \ 'subtype': 'Style'})
    endfunction

    call g:SyntasticRegistry.CreateAndRegisterChecker({
                \ 'filetype': 'javascript',
                \ 'name': 'vile_jshint',
                \ 'exec': 'vile' })
endif

"============================================================================

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
