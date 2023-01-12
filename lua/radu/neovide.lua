if (not vim.g.neovide) then
    return
end
-- font size:
vim.g.neovide_scale_factor = 1.0

vim.cmd([[
" g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
let g:neovide_transparency = 0.87
let g:transparency = 0.87
let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))

let g:neovide_scroll_animation_length = 0.0
let g:neovide_cursor_animation_length=0.0
let g:neovide_cursor_trail_size = 0.0

let g:neovide_fullscreen = v:false


if has('mouse')
  set mouse=a
endif
]])

