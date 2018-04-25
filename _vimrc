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
	call neobundle#begin(expand('$VIM/bundle'))
	NeoBundleFetch 'Shougo/neobundle.vim'

	"vimproc...非同期実行
	"		https://github.com/Shougo/vimproc.vim/releases
	"		こちらからDLLをダウンロードしてbundle/vimproc.vim/libに置いた。
	NeoBundle 'Shougo/vimproc.vim'

	"vimshell...vim上でshellを起動する
	NeoBundle 'Shougo/vimshell.vim'

	"unite.vim...vimの統合ユーザーインターフェース
	NeoBundle 'Shougo/unite.vim' 

  "Unite.vimで最近使ったファイルを表示できるようにする
	NeoBundle 'Shougo/neomru.vim' 

	"ファイラー
	NeoBundle 'The-NERD-tree'

  "バックグラウンドでgrepやmake実行ができる
  NeoBundle 'yuratomo/bg.vim'

	"即時実行(Test中)
	NeoBundle 'thinca/vim-quickrun'

	"カラースキーマ
	"	GitHubの"README.txt"が置いてあるページ(トップページ?)の上方に
	"	記述してあるパスを指定して"NeoBundleInstall"を実行する。
	"	vimを再起動すると適用される。
	NeoBundle 'vim-scripts/phd'
	NeoBundle 'vim-scripts/newspaper.vim'
	NeoBundle 'ciaranm/inkpot'
	NeoBundle 'cocopon/iceberg.vim'
	NeoBundle 'altercation/solarized'
	NeoBundle 'jonathanfilip/vim-lucius'
	NeoBundle 'jeetsukumaran/vim-nefertiti'

	call neobundle#end()
endif 

filetype plugin indent on

"---------------------------------------------------------------------------
" グローバル変数
let g:vimrc_local = $VIM

"---------------------------------------------------------------------------
" キーマップ一覧

"Ctrl+B...バッファ一覧
noremap <C-B> :call <SID>open_buffer()<CR>
function! s:open_buffer()
    execute ':Unite buffer'
endfunction

"Ctrl+G...検索
noremap <C-G> :call <SID>my_grep()<CR>
function! s:my_grep()
  "ルートディレクトリへ移動
  echo 'cd ' . g:vimrc_local
  execute('cd ' . g:vimrc_local)
  "▼BackGround grep(内部ではfindstrコマンドを使っているっぽい)
  "   /S 再帰的に検索する
  "   /R 正規表現
  let l:target = input("Target: ")
  let l:pattern = input("Pattern: ")
  execute(':Background grep /s /r ' . l:pattern . ' ' . l:target)
  "▼Unite vimgrep
	"   search-bufferという名前のバッファへ結果を出力する
  "execute ':Unite vimgrep -buffer-name=result-buffer'
endfunction

"「やり直し」と重複するのでオミット。
"Ctrl+R...検索結果を開く
"noremap <C-R> :call <SID>unite_grep_result()<CR>
"function! s:unite_grep_result()
"    execute ':UniteResume result-buffer'
"endfunction


"Ctrl+N...NERDTreeを開く
noremap <C-N> :call <SID>open_nerd_tree()<CR>
function! s:open_nerd_tree()
    execute 'lcd %:h'
    execute ':NERDTree'
endfunction

"---------------------------------------------------------------------------
" 自前コマンド

"CRLFtoLF...改行コード変換コマンド(CrLF→LF)
"source $VIM/myscripts/crlf_to_lf.vim

"JsonViewer...JSONファイルを見やすくする
"source $VIM/myscripts/json.vim

"RunPython...pythonで実行する
command! RunPython call s:run_python()
function! s:run_python()
	execute ':QuickRun python'
endfunction

"---------------------------------------------------------------------------
" Quickrun.vim設定

"runの結果を画面分割して表示する
let g:quickrun_config={'*': {'split': ''}}

"---------------------------------------------------------------------------
" NERDtree設定

"ファイルを開いた後も、NERDTreeを自動的に閉じるかどうか
"0: 閉じない 1:閉じる
let g:NERDTreeQuitOnOpen=1

"---------------------------------------------------------------------------
"　以下セッティング情報

<<<<<<< HEAD
"バックアップファイルを作成しない
set nobackup
" バックアップファイルの保存先
"set backupdir=>G:/temp/vim
=======
" スワップファイルの保存先
set backupdir=>D:/temp/vim
>>>>>>> 017a0b2873176ddcf6f1d1f8165ad618d7a87a15

" undoファイルを作成する
set undofile
" undo情報ファイルの保存先
<<<<<<< HEAD
set undodir=G:/temp/vim
=======
" (参考)http://www.kaoriya.net/blog/2014/03/30/
set undodir=D:/temp/vim
>>>>>>> 017a0b2873176ddcf6f1d1f8165ad618d7a87a15

"Windows操作(コピペなど)
source $VIMRUNTIME/mswin.vim

"tagsジャンプのときに、複数あるときは一覧表示する
nnoremap <C-]> g<C-]>

" 自動的にカレントディレクトリを編集ファイルと同じディレクトリに変更する
let s:current_path = getcwd()
if s:current_path != $HOME
	let g:vimrc_local = s:current_path
	"let l:vimrc_local = s:current_path . '\.vimrc.local'
	if filereadable(s:current_path . '\.vimrc.local')
		source .vimrc.local
	endif
endif
