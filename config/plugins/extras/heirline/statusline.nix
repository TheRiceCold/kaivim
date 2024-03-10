/* lua */ ''
local StatusLine = {
  hl = { fg = 'fg', bg = 'bg' },
  lib.component.mode(),
  lib.component.git_branch(),
  lib.component.file_info(),
  lib.component.git_diff(),
  lib.component.diagnostics(),
  lib.component.fill(),
  lib.component.cmd_info(),
  lib.component.fill(),
  lib.component.lsp(),
  lib.component.compiler_state(),
  lib.component.virtual_env(),
  lib.component.nav(),
  lib.component.mode { surround = { separator = 'right' } },
}
''
