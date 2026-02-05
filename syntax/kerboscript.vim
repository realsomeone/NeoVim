" =====================================================
" KerboScript Syntax Highlighting for Neovim
" =====================================================
syntax clear
syntax case ignore   " make keywords case-insensitive

" ---------- Comments ----------
syntax match kerboComment "//.*$"
highlight kerboComment guifg=#565f89 ctermfg=59

" ---------- Keywords ----------
syntax keyword kerboKeyword set lock unlock when then until if else on off stage local
syntax keyword kerboKeyword for while break continue return
syntax keyword kerboKeyword and or not
highlight kerboKeyword guifg=#ff9e64 ctermfg=214

" ---------- Built-in Functions ----------
syntax keyword kerboFunc print wait to from detach node prograde retrograde burn is
syntax keyword kerboFunc throttle deploy retract orient target steer
syntax keyword kerboFunc save load launch land
highlight kerboFunc guifg=#9ece6a ctermfg=107

" ---------- Types / Units ----------
syntax keyword kerboType part resource vessel orbit maneuver fuel engine battery solar antenna
syntax keyword kerboType science signal probe rover satellite capsule module
highlight kerboType guifg=#7aa2f7 ctermfg=75

" ---------- Constants ----------
syntax keyword kerboConst true false 0 1 pi e
syntax keyword kerboConst high low max min
highlight kerboConst guifg=#bb9af7 ctermfg=177

" ---------- Numbers ----------
syntax match kerboNumber /\v\d+(\.\d+)?/
highlight kerboNumber guifg=#ff9e64 ctermfg=214

" ---------- Strings ----------
syntax region kerboString start=/"/ end=/"/
highlight kerboString guifg=#9ece6a ctermfg=107

" ---------- Operators ----------
syntax match kerboOperator "[+\-*/=<>!]+"
syntax match kerboOperator "&&\|\|\|==\|!=\|<=\|>=\|=>"
highlight kerboOperator guifg=#f7768e ctermfg=204

" ---------- Parentheses & Brackets ----------
syntax match kerboDelimiter "[\[\]{}()]"
highlight kerboDelimiter guifg=#c0caf5 ctermfg=117

" ---------- Special / Magic ----------
syntax keyword kerboMagic delta dV apoapsis periapsis inclination longitude
syntax keyword kerboMagic stageDelta burnTime orbitalPeriod
highlight kerboMagic guifg=#ff9e64 ctermfg=214

let b:current_syntax = "kerboscript"
