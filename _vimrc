scriptencoding utf-8
" 個人用vimrc設定
"
" 個人用設定は_vimrcというファイルを作成しそこで行ないます。_vimrcはこのファ
" イルの後に読込まれるため、ここに書かれた内容を上書きして設定することが出来
" ます。_vimrcは$HOMEまたは$VIMに置いておく必要があります。$HOMEは$VIMよりも
" 優先され、$HOMEでみつかった場合$VIMは読込まれません。
"
"---------------------------------------------------------------------------
"---------------------------------------------------------------------------
" NeoBundle 設定
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=$VIM/bundle/neobundle.vim/
  "echo expand('$VIM/bundle')
  call neobundle#begin(expand('$VIM/bundle'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif 

"カラースキーマ
NeoBundle 'vim-scripts/phd'
NeoBundle 'ciaranm/inkpot'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'altercation/solarized'

"便利コマンドが使えるようになる
NeoBundle 'Shougo/unite.vim' 

"入力補完機能
"NeoBundle 'Shougo/neosnippet.vim'

filetype plugin indent on
