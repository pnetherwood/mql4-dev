" Use standard compiler settings unless user wants otherwise
if !exists("current_compiler")
  :compiler mql4
endif

setlocal tabstop=3
setlocal softtabstop=3
setlocal expandtab
setlocal shiftwidth=3
setlocal nowrap
setlocal cindent

let s:path = expand('<sfile>:p:h')
function! s:GetBinPath()
  let l:script = s:path
  if has("unix")
    let l:script .= '/../bin'
  else
    let l:script .= '\\..\\bin'
  endif
  return l:script
endfunction

function! s:OpenMQL4Help(word)
  let l:script = s:GetBinPath()
  if has("unix")
    let l:script .= '/help.sh'
  else
    let l:script .= '\\help.bat'
  endif
  let l:script = shellescape(l:script)
  " use vim-dispatch to launch help prog
  let l:script = 'Start! ' . l:script . ' ' . a:word
  execute l:script
endfunction

function! s:Compile()
  let l:script = s:GetBinPath()
  if has("unix")
    let l:script .= '/compile.sh'
  else
    let l:script .= '\\compile.bat'
  endif
  let l:script = shellescape(l:script)
  execute 'setlocal makeprg='.l:script.'\ '.expand('%')
  " use vim-dispatch to launch compiler
  execute 'Make'
endfunction

nnoremap <buffer> <silent> K :call <SID>OpenMQL4Help(expand('<cword>'))<cr>
nnoremap <F10> :setlocal makeprg=make<bar>Make<cr>
nnoremap <F11> :call <SID>Compile()<cr>

" Use omni completion function from https://github.com/vim-scripts/OmniCppComplete
setlocal omnifunc=omni#cpp#complete#Main
let OmniCpp_NamespaceSearch = 0
let OmniCpp_ShowPrototypeInAbbr = 1
