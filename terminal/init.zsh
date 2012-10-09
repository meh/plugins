if terminal:is-dumb; then
  return 1
fi

functions:autoload add-zsh-hook

function terminal:precmd:title {
  if zstyle -t ':zoppo:plugin:terminal' auto-title; then
    terminal:title-with-path
  fi
}

function terminal:preexec:title {
  if zstyle -t ':zoppo:plugin:terminal' auto-title; then
    terminal:title-with-command "$2"
  fi
}

add-zsh-hook precmd terminal:precmd:title
add-zsh-hook preexec terminal:preexec:title

if functions:autoload colors && colors && terminal:colors 256; then
  typeset -gA fx fg bg

  fx=(
    bold                      "\e[01m"    no-bold                      "\e[22m"
    faint                     "\e[02m"    no-faint                     "\e[22m"
    standout                  "\e[03m"    no-standout                  "\e[23m"
    underline                 "\e[04m"    no-underline                 "\e[24m"
    blink                     "\e[05m"    no-blink                     "\e[25m"
    fast-blink                "\e[06m"    no-fast-blink                "\e[25m"
    reverse                   "\e[07m"    no-reverse                   "\e[27m"
    conceal                   "\e[08m"    no-conceal                   "\e[28m"
    strikethrough             "\e[09m"    no-strikethrough             "\e[29m"
    gothic                    "\e[20m"    no-gothic                    "\e[22m"
    double-underline          "\e[21m"    no-double-underline          "\e[22m"
    proportional              "\e[26m"    no-proportional              "\e[50m"
    overline                  "\e[53m"    no-overline                  "\e[55m"

                                          no-border                    "\e[54m"
    border-rectangle          "\e[51m"    no-border-rectangle          "\e[54m"
    border-circle             "\e[52m"    no-border-circle             "\e[54m"

                                          no-ideogram-marking          "\e[65m"
    underline-or-right        "\e[60m"    no-underline-or-right        "\e[65m"
    double-underline-or-right "\e[61m"    no-double-underline-or-right "\e[65m"
    overline-or-left          "\e[62m"    no-overline-or-left          "\e[65m"
    double-overline-or-left   "\e[63m"    no-double-overline-or-left   "\e[65m"
    stress                    "\e[64m"    no-stress                    "\e[65m"

                                          font-default                 "\e[10m"
    font-first                "\e[11m"    no-font-first                "\e[10m"
    font-second               "\e[12m"    no-font-second               "\e[10m"
    font-third                "\e[13m"    no-font-third                "\e[10m"
    font-fourth               "\e[14m"    no-font-fourth               "\e[10m"
    font-fifth                "\e[15m"    no-font-fifth                "\e[10m"
    font-sixth                "\e[16m"    no-font-sixth                "\e[10m"
    font-seventh              "\e[17m"    no-font-seventh              "\e[10m"
    font-eigth                "\e[18m"    no-font-eigth                "\e[10m"
    font-ninth                "\e[19m"    no-font-ninth                "\e[10m"
  )

  for color ({0..255}); do
    fg[$color]="\e[38;5;${color}m"
    bg[$color]="\e[48;5;${color}m"
  done
  unset color index
fi

# vim: ft=zsh sts=2 ts=2 sw=2 et fdm=marker fmr={{{,}}}
