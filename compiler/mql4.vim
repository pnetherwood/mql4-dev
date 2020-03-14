if exists("current_compiler")
  finish
endif
let current_compiler = "mql4"

let s:cpo_save = &cpo
set cpo&vim

CompilerSet errorformat=
      \%f(%l\\,%c)\ :\ %tarning\ %n:\ %m,
      \%f(%l\\,%c)\ :\ %trror\ %n:\ %m,
      \%-G%f\ :\ information:\ including\ %m,
      \%-G%f\ :\ information:\ compiling\ %m,
      \%+G%f\ :\ information:\ %m,
      \%D%*\\a[%*\\d]:\ Entering\ directory\ %*[`']%f',
      \%X%*\\a[%*\\d]:\ Leaving\ directory\ %*[`']%f',
      \%D%*\\a:\ Entering\ directory\ %*[`']%f',
      \%X%*\\a:\ Leaving\ directory\ %*[`']%f',
      \%-G\\s%#,
      \%-G%.%#

let &cpo = s:cpo_save
unlet s:cpo_save
