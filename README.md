# mql4-dev
Vim setup for mql4 development
It implements the following:
- Snippets to complete every MQL4 function with parameters. It also has snippets for Indicators, EAs and Scripts.
- Compile current file
- Errors displayed in quickfix window
- Launching MQL4 help on current word
It relies on the MQL4 syntax highlighting developed by Vaclav Vobornik and Tim Popes excellent Vim Dispatch to allow async compilation and help launching. See dependencies below.

Using a combination of snippet, tag and omni completion gives you a useful completion environment for MQL4 development.

## Dependencies

### Syntax highlighting
```
Plug 'vobornik/vim-mql4'
```
This also sets the filetype to be 'mql4'

### Async compiling
```
Plug 'tpope/vim-dispatch'
```
Allows compilation and help file viewer to be launched.

### Snippets
This plugin includes snippets for all MQL4 functions. Completion can be done with any engine compatible with UltiSnips.
For example, if you want to use the iOpen function, tying enough characters in iOpen for the snippet engine will generate the assignment and allow you to edit each of the parameters. There is also snippets for indicator properties.

## Usage

Compilation is done using the scripts in bin. The scripts require MT4_HOME environment variable to be setup to point to root of MT4 installation and the location of meateditor.exe.

### Mapped Keys

| Key | Description |
|-----|-------------|
|K    |Launch MT4 help on current word|
|<F10>|Call make to build all using makefile. See makefile.mk for makefile template|
|<F11>|Compile|

Note: to launch the MT4 Help keyhh.exe needs to be installed. See http://keyworks.helpmvp.com/

## Optional Extras
### Tags
To use tags install Universal or Exuberant ctags from your package manager.
To enable support for ctags include the following in your ctags config file:

```
--extras=+q
--kinds-c++=+p 
--fields=+iaSm
-I input
-I property=define
--language-force=C++
--langmap=C++:+.mq4.mqh
```

It forces ctags to treat .mq4 and .mqh files as c++ files.

It is recommended to automatically build tags files use Gutentags:
```
Plug 'ludovicchabant/vim-gutentags'
```

#### Tagbar
Once you have tags you can use tagbar:
```
Plug 'majutsushi/tagbar'
```
and configure to recognise mql4 tags using:

```vim
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
```
### Omni Completion
Completion of MQL4 classes members and variables is improved using the C++ omni completion. 
Install using:
```
Plug 'vim-scripts/OmniCppComplete'
```
This plugin set this omni completion option by default for mql4 files.

### Makefiles
Makefiles can be used to launch the compiler. Included with this code is a makefile template which can be included in a Makefile in the same folder as the mql4 program. This can be very useful if you are compiling many indicators and EAs.
