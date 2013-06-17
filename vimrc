" Disable Vi compatability
set nocompatible

" Enable pathogen
execute pathogen#infect()

" Enable filetype plugins
filetype plugin indent on

" Set wildignore
set wildignore+=*/build/*,*/tmp/*,*.so,*.swp,*.zip

" Indendaton
set tabstop=3
set softtabstop=3
set shiftwidth=3
set expandtab

" Show line numbers.
set number
set numberwidth=3

" Get name of the terminal colorscheme.
let s:name=system("colorscheme")

" Use default if not set.
if empty(s:name)
  let s:name="default"
endif

" Set background based on the naming convention of the colorscheme.
let &background= (s:name =~ "dark" ? "dark" : "light")

" Strip any describing words from the scheme name.
let s:name=split(s:name, "-")[0]

" Apply the colorscheme.
execute "colorscheme " . s:name

" Auto commands
if has("autocmd")
  " Auto source vimrc files
  autocmd! bufwritepost vimrc source %

  " Auto source screenrc files when running inside a screen session
  if !empty($STY)
    autocmd bufwritepost screenrc silent ! screen -S $STY -X source %:p && screen -S $STY -X redisplay
  endif

  " Strip trailing whitespaces before save.
  autocmd bufwritepre * :%s/\s\+$//e
endif

" Enable per directory .vimrc files
set exrc
set secure
