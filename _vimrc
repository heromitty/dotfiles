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

	"VimShell(非同期でプラグインがインストール&アップデートできる)が使えるようになる
	"	TODO:G:\vim\bundle\vimproc.vimでDLLをmakeしないと使えない
	"NeoBundle 'Shougo/vimproc.vim', {
	"\ 'build' : {
	"\     'windows' : 'tools\\update-dll-mingw',
	"\     'cygwin' : 'make -f make_cygwin.mak',
	"\     'mac' : 'make -f make_mac.mak',
	"\     'linux' : 'make',
	"\     'unix' : 'gmake',
	"\    },
	"\ }
	"NeoBundle 'Shougo/vimshell.vim'

	"カラースキーマ
	NeoBundle 'vim-scripts/phd'
	NeoBundle 'ciaranm/inkpot'
	NeoBundle 'jonathanfilip/vim-lucius'
	NeoBundle 'altercation/solarized'

	"便利コマンドが使えるようになる
	"NeoBundle 'Shougo/unite.vim' 

	"入力補完機能
	"NeoBundle 'Shougo/neosnippet.vim'

	"TrinityToggle
	NeoBundle 'The-NERD-tree'
	NeoBundle 'taglist.vim'
	NeoBundle 'https://github.com/wesleyche/SrcExpl.git'
	"NeoBundle 'https://github.com/wesleyche/Trinity.git'

	call neobundle#end()
endif 

filetype plugin indent on

"プラグインが更新されているかチェックするコマンドだと思う(動作確認してない)
"NeoBundleCheck

"---------------------------------------------------------------------------
" SrcExpl設定

"tagsをSrcExpl起動時に自動で作成(更新)するかどうか
let g:SrcExpl_isUpdateTags = 0

"自動的にプレビューを表示するまでの時間(秒)
let g:SrcExpl_refreshTime = 1

"---------------------------------------------------------------------------
" スワップファイルの保存先
set backupdir=>C:/TEMP

"---------------------------------------------------------------------------
" undo情報ファイルの保存先
" (参考)http://www.kaoriya.net/blog/2014/03/30/
set undodir=C:/TEMP

"---------------------------------------------------------------------------
" 挙動に関する設定:

"Windows操作
source $VIMRUNTIME/mswin.vim

"---------------------------------------------------------------------------
" 自動的にカレントディレクトリを編集ファイルと同じディレクトリに変更する

let s:current_path = getcwd()
if s:current_path != $HOME
	let s:vimrc_local = s:current_path . '\.vimrc.local'
	if filereadable(s:vimrc_local)
		source .vimrc.local
	endif
endif

