" Disable Vi compatability
set nocompatible

" Enable pathogen
execute pathogen#infect()

" Indendaton
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Colorscheme
let s:name=system("colorscheme")

" Use default if not set.
if empty(s:name)
  let s:name="default"
endif

" Set background based on if the word is contained within the scheme name
let &background= (s:name =~ "dark" ? "dark" : "light")

" Strip any describing words from the scheme name
let s:name=split(s:name, "-")[0]

" Finally try to set the colorscheme
execute "colorscheme " . s:name

" Auto commands
if has("autocmd")
  " Auto source vimrc files
  autocmd! bufwritepost vimrc source %

  " Auto source screenrc files when running inside a screen session
  if !empty($STY)
    autocmd bufwritepost screenrc ! screen -S $STY -X source %:p && screen -S $STY -X redisplay
  endif

  " Strip trailing whitespaces before save.
  autocmd bufwritepre * :%s/\s\+$//e
endif
