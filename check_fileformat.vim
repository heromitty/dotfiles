function! s:ReplaceReturnCode()
	if &fileformat == 'unix' && input("replace return code to LF?[y/n]") == "y"
		"echo "UNIX"
		:%s///g
	elseif &fileformat == 'dos'
		"echo "DOS"
	endif
endfunction
autocmd BufWritePre * :call <SID>ReplaceReturnCode()
