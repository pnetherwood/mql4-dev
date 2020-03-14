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

if has("unix")
  nnoremap <buffer> <silent> K :Start! /c/dev/MQL4/Shared\ Projects/bin/help.sh <cword><cr>
else
  nnoremap <buffer> <silent> K :Start! c:\dev\MQL4\Shared Projects\bin\help.bat <cword><cr>
endif

setlocal omnifunc=omni#cpp#complete#Main
let OmniCpp_NamespaceSearch = 0
let OmniCpp_ShowPrototypeInAbbr = 1
