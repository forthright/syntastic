"============================================================================
"File:        vile.vim [ruby]
"Description: Ruby based syntax checking plugin for syntastic.vim
"             It contains various types of ruby related vile plugins
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
" Checker: vile-rubycritic
"============================================================================

if !exists('g:loaded_syntastic_ruby_vile_rubycritic_checker')
    let g:loaded_syntastic_ruby_vile_rubycritic_checker = 1

    if !exists('g:syntastic_ruby_vile_rubycritic_sort')
        let g:syntastic_ruby_vile_rubycritic_sort = 1
    endif

    function! SyntaxCheckers_ruby_vile_rubycritic_IsAvailable() dict
        return executable(self.getExec())
    endfunction

    function! SyntaxCheckers_ruby_vile_rubycritic_GetLocList() dict
        let makeprg = self.makeprgBuild({
                    \ 'args': 'analyze -p rubycritic -f syntastic -n -d' })

        let errorformat = '%f:%l:%c: %t: %m'

        return SyntasticMake({
            \ 'makeprg': makeprg,
            \ 'errorformat': errorformat,
            \ 'subtype': 'Style'})
    endfunction

    call g:SyntasticRegistry.CreateAndRegisterChecker({
                \ 'filetype': 'ruby',
                \ 'name': 'vile_rubycritic',
                \ 'exec': 'vile' })
endif

"============================================================================
" Checker: vile-rubocop
"============================================================================

if !exists('g:loaded_syntastic_ruby_vile_rubocop_checker')
    let g:loaded_syntastic_ruby_vile_rubocop_checker = 1

    if !exists('g:syntastic_ruby_vile_rubocop_sort')
        let g:syntastic_ruby_vile_rubocop_sort = 1
    endif

    function! SyntaxCheckers_ruby_vile_rubocop_IsAvailable() dict
        return executable(self.getExec())
    endfunction

    function! SyntaxCheckers_ruby_vile_rubocop_GetLocList() dict
        let makeprg = self.makeprgBuild({
                    \ 'args': 'analyze -p rubocop -f syntastic -n -d' })

        let errorformat = '%f:%l:%c: %t: %m'

        return SyntasticMake({
            \ 'makeprg': makeprg,
            \ 'errorformat': errorformat,
            \ 'subtype': 'Style'})
    endfunction

    call g:SyntasticRegistry.CreateAndRegisterChecker({
                \ 'filetype': 'ruby',
                \ 'name': 'vile_rubocop',
                \ 'exec': 'vile' })
endif

"============================================================================
" Checker: vile-rails-best-practices
"============================================================================

if !exists('g:loaded_syntastic_ruby_vile_rails_best_practices_checker')
    let g:loaded_syntastic_ruby_vile_rails_best_practices_checker = 1

    if !exists('g:syntastic_ruby_vile_rails_best_practices_sort')
        let g:syntastic_ruby_vile_rails_best_practices_sort = 1
    endif

    function! SyntaxCheckers_ruby_vile_rails_best_practices_IsAvailable() dict
        return executable(self.getExec())
    endfunction

    function! SyntaxCheckers_ruby_vile_rails_best_practices_GetLocList() dict
        let makeprg = self.makeprgBuild({
                    \ 'args': 'analyze -p rails-best-practices -f syntastic -n -d' })

        let errorformat = '%f:%l:%c: %t: %m'

        return SyntasticMake({
            \ 'makeprg': makeprg,
            \ 'errorformat': errorformat,
            \ 'subtype': 'Style'})
    endfunction

    call g:SyntasticRegistry.CreateAndRegisterChecker({
                \ 'filetype': 'ruby',
                \ 'name': 'vile_rails_best_practices',
                \ 'exec': 'vile' })
endif

"============================================================================

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
