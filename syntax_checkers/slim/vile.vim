"============================================================================
"File:        vile.vim [slim]
"Description: Slim based syntax checking plugin for syntastic.vim
"             It contains various types of slim related vile plugins
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
" Checker: vile-slim-lint
"============================================================================

if !exists('g:loaded_syntastic_slim_vile_slim_lint_checker')
    let g:loaded_syntastic_slim_vile_slim_lint_checker = 1

    if !exists('g:syntastic_slim_vile_slim_lint_sort')
        let g:syntastic_slim_vile_slim_lint_sort = 1
    endif

    function! SyntaxCheckers_slim_vile_slim_lint_IsAvailable() dict
        return executable(self.getExec())
    endfunction

    function! SyntaxCheckers_slim_vile_slim_lint_GetLocList() dict
        let makeprg = self.makeprgBuild({
                    \ 'args': 'analyze -p slim-lint -f syntastic -n -d' })

        let errorformat = '%f:%l:%c: %t: %m'

        return SyntasticMake({
            \ 'makeprg': makeprg,
            \ 'errorformat': errorformat,
            \ 'subtype': 'Style'})
    endfunction

    call g:SyntasticRegistry.CreateAndRegisterChecker({
                \ 'filetype': 'slim',
                \ 'name': 'vile_slim_lint',
                \ 'exec': 'vile' })
endif

"============================================================================
" Checker: vile-rails-best-practices
"============================================================================

if !exists('g:loaded_syntastic_slim_vile_rails_best_practices_checker')
    let g:loaded_syntastic_slim_vile_rails_best_practices_checker = 1

    if !exists('g:syntastic_slim_vile_rails_best_practices_sort')
        let g:syntastic_slim_vile_rails_best_practices_sort = 1
    endif

    function! SyntaxCheckers_slim_vile_rails_best_practices_IsAvailable() dict
        return executable(self.getExec())
    endfunction

    function! SyntaxCheckers_slim_vile_rails_best_practices_GetLocList() dict
        let makeprg = self.makeprgBuild({
                    \ 'args': 'analyze -p rails-best-practices -f syntastic -n -d' })

        let errorformat = '%f:%l:%c: %t: %m'

        return SyntasticMake({
            \ 'makeprg': makeprg,
            \ 'errorformat': errorformat,
            \ 'subtype': 'Style'})
    endfunction

    call g:SyntasticRegistry.CreateAndRegisterChecker({
                \ 'filetype': 'slim',
                \ 'name': 'vile_rails_best_practices',
                \ 'exec': 'vile' })
endif

"============================================================================

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
