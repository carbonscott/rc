function! TimeCurrent()
    let time_now = strftime("%b %X")
    execute "normal a" . time_now
endfunction

command! -nargs=0 TimeCurrent call TimeCurrent()
