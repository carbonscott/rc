function! TimeCurrent()
    let time_now = strftime("%X %b %d")
    execute "normal a" . time_now
endfunction

command! -nargs=0 TimeCurrent call TimeCurrent()
