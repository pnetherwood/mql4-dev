
if !exists(':Tagbar')
    finish
endif

let g:tagbar_type_mql4 = {
    \ 'ctagstype': 'C++',
    \ 'kinds' : [
        \'c:class',
        \'m:members',
        \'f:functions',
        \'v:variables',
        \'d:macros',
        \'e:enums',
        \'g:enum'
    \]
\}
