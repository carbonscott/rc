" Time and date...
function! TimeCurrent()
    let time_now = strftime("%X %b %d")
    execute "normal i" . time_now
endfunction

command! -nargs=0 TimeCurrent call TimeCurrent()




" Date...
function! DateCurrent()
    let time_now = strftime("%A, %B %e, %Y")
    execute "normal i" . time_now
endfunction

command! -nargs=0 DateCurrent call DateCurrent()
