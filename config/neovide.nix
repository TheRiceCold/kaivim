{
  config.extraConfigLua = ''
    local g = vim.g

    if g.neovide then
      -- Neovide options
      g.neovide_refresh_rate = 60
      g.neovide_transparency = 0.8
      g.neovide_fullscreen = false

      g.neovide_hide_mouse_when_typing = false
      g.neovide_cursor_animate_command_line = true
      g.neovide_cursor_animate_in_insert_mode = true

      g.neovide_cursor_vfx_mode = "ripple"
      g.neovide_cursor_vfx_particle_curl = 1.0
      g.neovide_cursor_vfx_particle_speed = 10.0
      g.neovide_cursor_vfx_particle_density = 7.0
      g.neovide_cursor_vfx_particle_lifetime = 1.5

      vim.o.guifont = "JetBrainsMono Nerd Font:h13"
    end
  '';
}
