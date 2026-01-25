" min-easymotion.vim - Minimal EasyMotion implementation
" Maintainer: Generated
" Version: 1.0
" License: MIT

if exists('g:loaded_min_easymotion')
  finish
endif
let g:loaded_min_easymotion = 1

" ============================================================================
" Configuration
" ============================================================================

if !exists('g:MinEasyMotion_keys')
  let g:MinEasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj'
endif

if !exists('g:MinEasyMotion_do_shade')
  let g:MinEasyMotion_do_shade = 1
endif

if !exists('g:MinEasyMotion_smartcase')
  let g:MinEasyMotion_smartcase = 1
endif

" ============================================================================
" Highlight Groups
" ============================================================================

function! s:InitHighlight()
  " Single-key labels - bold red
  highlight default MinEasyMotionTarget
        \ cterm=bold ctermfg=196
        \ gui=bold guifg=#ff0000

  " Two-key combo first char - bold yellow
  highlight default MinEasyMotionTarget2First
        \ cterm=bold ctermfg=220
        \ gui=bold guifg=#ffb400

  " Two-key combo second char - yellow
  highlight default MinEasyMotionTarget2Second
        \ cterm=NONE ctermfg=214
        \ gui=NONE guifg=#b98300

  " Dimmed inactive text
  highlight default MinEasyMotionShade
        \ cterm=NONE ctermfg=242
        \ gui=NONE guifg=#777777
endfunction

call s:InitHighlight()
augroup MinEasyMotionHighlight
  autocmd!
  autocmd ColorScheme * call s:InitHighlight()
augroup END

" ============================================================================
" Core Functions
" ============================================================================

" Get visible window bounds
function! s:GetVisibleBounds()
  let top = line('w0')
  let bottom = line('w$')
  return [top, bottom]
endfunction

" Collect target positions matching pattern
" direction: 0=backward, 1=forward, 2=bidirectional
function! s:CollectTargets(pattern, direction)
  let targets = []
  let [top, bottom] = s:GetVisibleBounds()
  let curpos = getcurpos()
  let cur_line = curpos[1]
  let cur_col = curpos[2]

  " Build search flags based on smartcase
  let flags = ''
  if g:MinEasyMotion_smartcase && a:pattern =~# '^\l*$'
    let flags = '\c'
  endif
  let search_pattern = flags . a:pattern

  " Save position
  let save_pos = getpos('.')

  " Search forward
  if a:direction == 1 || a:direction == 2
    call setpos('.', save_pos)
    while 1
      let pos = searchpos(search_pattern, 'W')
      if pos[0] == 0 || pos[0] > bottom
        break
      endif
      " Skip current position for bidirectional
      if pos[0] == cur_line && pos[1] == cur_col
        continue
      endif
      call add(targets, pos)
    endwhile
  endif

  " Search backward
  if a:direction == 0 || a:direction == 2
    call setpos('.', save_pos)
    while 1
      let pos = searchpos(search_pattern, 'bW')
      if pos[0] == 0 || pos[0] < top
        break
      endif
      " Skip current position for bidirectional
      if pos[0] == cur_line && pos[1] == cur_col
        continue
      endif
      call add(targets, pos)
    endwhile
  endif

  " Restore position
  call setpos('.', save_pos)

  " Sort targets by distance from cursor
  let targets = s:SortByDistance(targets, cur_line, cur_col)

  return targets
endfunction

" Sort targets by distance from cursor position
function! s:SortByDistance(targets, cur_line, cur_col)
  let scored = []
  for pos in a:targets
    let dist = abs(pos[0] - a:cur_line) * 1000 + abs(pos[1] - a:cur_col)
    call add(scored, [dist, pos])
  endfor
  call sort(scored, {a, b -> a[0] - b[0]})
  return map(scored, 'v:val[1]')
endfunction

" Collect line targets (first non-blank char of each visible line)
function! s:CollectLineTargets()
  let targets = []
  let [top, bottom] = s:GetVisibleBounds()
  let cur_line = line('.')

  for lnum in range(top, bottom)
    " Skip current line
    if lnum == cur_line
      continue
    endif

    let line = getline(lnum)
    " Find first non-blank character
    let col = match(line, '\S') + 1
    if col == 0
      " Empty or whitespace-only line - use column 1
      let col = 1
    endif
    call add(targets, [lnum, col])
  endfor

  " Sort by distance from cursor
  let targets = s:SortByDistance(targets, cur_line, col('.'))

  return targets
endfunction

" Assign label keys to targets
" Returns: list of [label_string, [line, col]]
function! s:AssignLabels(targets)
  let keys = split(g:MinEasyMotion_keys, '\zs')
  let num_keys = len(keys)
  let num_targets = len(a:targets)
  let labels = []

  if num_targets == 0
    return labels
  endif

  if num_targets <= num_keys
    " Single-key labels
    for i in range(num_targets)
      call add(labels, [keys[i], a:targets[i], 1])
    endfor
  else
    " Need two-key combos
    " Calculate how many single keys we can use
    " If we have N keys and T targets:
    " Let S = single key targets, G = group keys
    " S + G = N (use all keys)
    " S + G * N = T (each group has N subtargets)
    " So: S = N - G, and S + G*N = T
    " (N - G) + G*N = T => N + G*(N-1) = T => G = (T - N) / (N - 1)
    let groups_needed = (num_targets - num_keys) / (num_keys - 1)
    if (num_targets - num_keys) % (num_keys - 1) > 0
      let groups_needed += 1
    endif
    let single_keys = num_keys - groups_needed

    let target_idx = 0

    " Assign single keys first (to closest targets)
    for i in range(single_keys)
      if target_idx >= num_targets
        break
      endif
      call add(labels, [keys[i], a:targets[target_idx], 1])
      let target_idx += 1
    endfor

    " Assign group keys
    let group_idx = 0
    while target_idx < num_targets
      let group_key = keys[single_keys + group_idx]
      for j in range(num_keys)
        if target_idx >= num_targets
          break
        endif
        let sub_key = keys[j]
        call add(labels, [group_key . sub_key, a:targets[target_idx], 2])
        let target_idx += 1
      endfor
      let group_idx += 1
    endwhile
  endif

  return labels
endfunction

" State for displaying labels
let s:saved_lines = {}
let s:match_ids = []

" Show labels on screen
function! s:ShowLabels(labels)
  let s:saved_lines = {}
  let s:match_ids = []

  " Save undo state to restore later (keeps label changes out of undo history)
  let s:save_undo_seq = undotree().seq_cur

  " Apply shade to entire visible area
  if g:MinEasyMotion_do_shade
    let [top, bottom] = s:GetVisibleBounds()
    let shade_id = matchadd('MinEasyMotionShade', '\%>' . (top-1) . 'l\%<' . (bottom+1) . 'l.')
    call add(s:match_ids, shade_id)
  endif

  " Group labels by line for efficient replacement
  let by_line = {}
  for [label, pos, key_count] in a:labels
    let lnum = pos[0]
    if !has_key(by_line, lnum)
      let by_line[lnum] = []
    endif
    call add(by_line[lnum], [label, pos[1], key_count])
  endfor

  " Save original lines and replace with labels
  for [lnum, items] in items(by_line)
    let lnum = str2nr(lnum)
    let line = getline(lnum)
    let s:saved_lines[lnum] = line

    " Sort by column descending to replace from right to left
    call sort(items, {a, b -> b[1] - a[1]})

    let new_line = line
    for [label, col, key_count] in items
      " Replace character(s) at position with label
      let before = col > 1 ? new_line[:col-2] : ''
      let after_idx = col - 1 + len(label)
      let after = after_idx < len(new_line) ? new_line[after_idx:] : ''
      let new_line = before . label . after
    endfor

    call setline(lnum, new_line)
  endfor

  " Add highlights for labels
  for [label, pos, key_count] in a:labels
    let lnum = pos[0]
    let col = pos[1]
    if key_count == 1
      " Single key - red
      let id = matchadd('MinEasyMotionTarget', '\%' . lnum . 'l\%' . col . 'c.')
      call add(s:match_ids, id)
    else
      " Two-key combo
      let id1 = matchadd('MinEasyMotionTarget2First', '\%' . lnum . 'l\%' . col . 'c.')
      let id2 = matchadd('MinEasyMotionTarget2Second', '\%' . lnum . 'l\%' . (col+1) . 'c.')
      call add(s:match_ids, id1)
      call add(s:match_ids, id2)
    endif
  endfor

  redraw
endfunction

" Restore original buffer content
function! s:RestoreBuffer()
  " Remove highlights
  for id in s:match_ids
    silent! call matchdelete(id)
  endfor
  let s:match_ids = []

  " Restore original lines
  for [lnum, line] in items(s:saved_lines)
    call setline(str2nr(lnum), line)
  endfor
  let s:saved_lines = {}

  " Undo back to state before labels were shown (removes label changes from undo history)
  if exists('s:save_undo_seq')
    silent! execute 'undo' s:save_undo_seq
    unlet s:save_undo_seq
  endif

  redraw
endfunction

" Prompt user and handle jump
" mode: 'n' = normal, 'v' = visual
function! s:PromptAndJump(labels, mode)
  " Build lookup tables
  let single_keys = {}
  let group_keys = {}

  for [label, pos, key_count] in a:labels
    if key_count == 1
      let single_keys[label] = pos
    else
      let group_key = label[0]
      let sub_key = label[1]
      if !has_key(group_keys, group_key)
        let group_keys[group_key] = {}
      endif
      let group_keys[group_key][sub_key] = pos
    endif
  endfor

  " Jump target (set inside try block if valid selection)
  let jump_pos = []

  try
    " Get first keypress
    let char = nr2char(getchar())

    " Check for escape or Ctrl-C
    if char ==# "\<Esc>" || char ==# "\<C-c>"
      return
    endif

    " Check single key match
    if has_key(single_keys, char)
      let jump_pos = single_keys[char]
      return
    endif

    " Check group key match
    if has_key(group_keys, char)
      " Show only this group's labels
      call s:RestoreBuffer()
      let group_labels = []
      for [sub_key, pos] in items(group_keys[char])
        call add(group_labels, [sub_key, pos, 1])
      endfor
      call s:ShowLabels(group_labels)

      " Get second keypress
      let char2 = nr2char(getchar())

      " Check for escape or Ctrl-C
      if char2 ==# "\<Esc>" || char2 ==# "\<C-c>"
        return
      endif

      if has_key(group_keys[char], char2)
        let jump_pos = group_keys[char][char2]
      endif
      return
    endif

  catch /^Vim:Interrupt$/
    " Ctrl-C pressed - treat as cancel (jump_pos stays empty)
  finally
    " Always restore buffer
    call s:RestoreBuffer()

    " Restore visual selection if in visual mode
    if a:mode ==# 'v'
      normal! gv
    endif

    " Jump if we have a valid target
    if !empty(jump_pos)
      call cursor(jump_pos[0], jump_pos[1])
    endif
  endtry
endfunction

" Main entry point
" mode (optional): 'n' = normal (default), 'v' = visual
function! s:EasyMotion(pattern, direction, ...)
  let mode = a:0 > 0 ? a:1 : 'n'

  " Collect targets
  let targets = s:CollectTargets(a:pattern, a:direction)

  if empty(targets)
    echo 'No matches'
    if mode ==# 'v'
      normal! gv
    endif
    return
  endif

  " Assign labels
  let labels = s:AssignLabels(targets)

  " Show labels
  call s:ShowLabels(labels)

  " Prompt and jump
  call s:PromptAndJump(labels, mode)
endfunction

" ============================================================================
" Entry Points
" ============================================================================

function! s:Jump()
  echo 'Char: '
  let char = nr2char(getchar())
  if char ==# "\<Esc>"
    return
  endif
  let escaped = escape(char, '.$^~\[]')
  call s:EasyMotion(escaped, 2)
endfunction

function! s:VisualJump()
  echo 'Char: '
  let char = nr2char(getchar())
  if char ==# "\<Esc>"
    normal! gv
    return
  endif
  let escaped = escape(char, '.$^~\[]')
  call s:EasyMotion(escaped, 2, 'v')
endfunction

function! s:LineJump()
  let targets = s:CollectLineTargets()

  if empty(targets)
    echo 'No lines'
    return
  endif

  let labels = s:AssignLabels(targets)
  call s:ShowLabels(labels)
  call s:PromptAndJump(labels, 'n')
endfunction

function! s:VisualLineJump()
  let targets = s:CollectLineTargets()

  if empty(targets)
    echo 'No lines'
    normal! gv
    return
  endif

  let labels = s:AssignLabels(targets)
  call s:ShowLabels(labels)
  call s:PromptAndJump(labels, 'v')
endfunction

function! s:WordJump()
  call s:EasyMotion('\<\w', 2)
endfunction

function! s:VisualWordJump()
  call s:EasyMotion('\<\w', 2, 'v')
endfunction

" ============================================================================
" Mappings
" ============================================================================

nnoremap <silent> <Leader>f :call <SID>Jump()<CR>
xnoremap <silent> <Leader>f :<C-u>call <SID>VisualJump()<CR>
nnoremap <silent> <Leader>l :call <SID>LineJump()<CR>
xnoremap <silent> <Leader>l :<C-u>call <SID>VisualLineJump()<CR>
nnoremap <silent> <Leader>w :call <SID>WordJump()<CR>
xnoremap <silent> <Leader>w :<C-u>call <SID>VisualWordJump()<CR>

" vim: set sw=2 ts=2 et:
