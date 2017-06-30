"============================================================================
"File:        vile.vim [sass]
"Description: Sass based syntax checking plugin for syntastic.vim
"             It contains various types of sass related vile plugins
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
" Checker: vile-sass-lint
"============================================================================

if !exists('g:loaded_syntastic_sass_vile_sass_lint_checker')
    let g:loaded_syntastic_sass_vile_sass_lint_checker = 1

    if !exists('g:syntastic_sass_vile_sass_lint_sort')
        let g:syntastic_sass_vile_sass_lint_sort = 1
    endif

    function! SyntaxCheckers_sass_vile_sass_lint_IsAvailable() dict
        return executable(self.getExec())
    endfunction

    function! SyntaxCheckers_sass_vile_sass_lint_GetLocList() dict
        let makeprg = self.makeprgBuild({
                    \ 'args': 'analyze -p sass-lint -f syntastic -n -d' })

        let errorformat = '%f:%l:%c: %t: %m'

        return SyntasticMake({
            \ 'makeprg': makeprg,
            \ 'errorformat': errorformat,
            \ 'subtype': 'Style'})
    endfunction

    call g:SyntasticRegistry.CreateAndRegisterChecker({
                \ 'filetype': 'sass',
                \ 'name': 'vile_sass_lint',
                \ 'exec': 'vile' })
endif

"============================================================================

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
