require('incline').setup {}

-- vim_current_word
vim.cmd [[
  hi CurrentWord guifg=#bd5eff
  let g:vim_current_word#highlight_twins = 0
  let g:vim_current_word#excluded_filetypes = ['minifiles', 'netrw', 'alpha']
]]

local g = vim.g

--- Neovide Configuration ---
if g.neovide then
	g.neovide_scale_factor = 1.0
	g.neovide_hide_mouse_when_typing = true
	g.neovide_refresh_rate = 60
	g.neovide_refresh_rate_idle = 5
	g.neovide_no_idle = true
	g.neovide_confirm_quit = true
	g.neovide_input_use_logo = true
	g.neovide_cursor_antialiasing = true

	g.neovide_cursor_antialiasing = true
	g.neovide_scroll_animation_length = 0.3
	g.neovide_cursor_animate_in_insert_mode = true

	g.neovide_cursor_vfx_mode = 'ripple' -- pixiedust
	g.neovide_cursor_vfx_particle_speed = 10.0
	g.neovide_padding_top = 16
	g.neovide_padding_bottom = 0
	g.neovide_padding_right = 12
	g.neovide_padding_left = 16

	g.neovide_transparency = 0.75
	vim.o.guifont = 'JetBrainsMono Nerd Font:h12'

	vim.cmd [[
    highlight Normal guibg=NONE ctermbg=NONE
    highlight NonText guibg=NONE ctermbg=NONE
  ]]
end
