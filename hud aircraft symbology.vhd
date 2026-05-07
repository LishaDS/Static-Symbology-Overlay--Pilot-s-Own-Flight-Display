library ieee ;
use ieee . std_logic_1164 .all;
use ieee . numeric_std .all;
entity hud_aircraft_symbology is
port (
clk : in std_logic ;
de : in std_logic ;
x : in unsigned (9 downto 0);
y : in unsigned (9 downto 0);
sym_on : out std_logic ;
sym_rgb : out std_logic_vector (11 downto 0)
);
end entity ;
architecture rtl of hud_aircraft_symbology is
constant HUD : std_logic_vector (11 downto 0) := x"0 F6 ";
constant CX : integer := 320;
constant CY : integer := 240;
function abs_i (v : integer ) return integer is
begin
if v < 0 then
return -v;
else
return v;
end if;
end function ;
function glyph (c : character ; row : integer ) return
std_logic_vector is
variable g : std_logic_vector (7 downto 0) := ( others =>’0’);
begin
case c is
when ’0’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "66"; when 2 => g:=x"6E";
when 3 => g:=x "76";
when 4 => g:=x "66"; when 5 => g:=x "66"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’1’ => case row is
when 0 => g:=x "18"; when 1 => g:=x "38"; when 2 => g:=x "18";
when 3 => g:=x "18";
when 4 => g:=x "18"; when 5 => g:=x "18"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’2’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "66"; when 2 => g:=x "06";
when 3 => g:=x"1C";
when 4 => g:=x "30"; when 5 => g:=x "60"; when 6 => g:=x"7E";
when others => g:=x "00"; end
case ;
when ’3’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "66"; when 2 => g:=x "06";
when 3 => g:=x"1C";
when 4 => g:=x "06"; when 5 => g:=x "66"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’4’ => case row is
when 0 => g:=x"0C"; when 1 => g:=x"1C"; when 2 => g:=x"3C";
when 3 => g:=x"6C";
when 4 => g:=x"7E"; when 5 => g:=x"0C"; when 6 => g:=x"0C";
when others => g:=x "00"; end
case ;
when ’5’ => case row is
when 0 => g:=x"7E"; when 1 => g:=x "60"; when 2 => g:=x"7C";
when 3 => g:=x "06";
when 4 => g:=x "06"; when 5 => g:=x "66"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’6’ => case row is
when 0 => g:=x"1C"; when 1 => g:=x "30"; when 2 => g:=x "60";
when 3 => g:=x"7C";
when 4 => g:=x "66"; when 5 => g:=x "66"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’7’ => case row is
when 0 => g:=x"7E"; when 1 => g:=x "66"; when 2 => g:=x "06";
when 3 => g:=x"0C";
when 4 => g:=x "18"; when 5 => g:=x "18"; when 6 => g:=x "18";
when others => g:=x "00"; end case ;
when ’8’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "66"; when 2 => g:=x "66";
when 3 => g:=x"3C";
when 4 => g:=x "66"; when 5 => g:=x "66"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’9’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "66"; when 2 => g:=x "66";
when 3 => g:=x"3E";
when 4 => g:=x "06"; when 5 => g:=x"0C"; when 6 => g:=x "38";
when others => g:=x "00"; end
case ;
when ’A’ => case row is
when 0 => g:=x "18"; when 1 => g:=x"3C"; when 2 => g:=x "66";
when 3 => g:=x "66";
when 4 => g:=x"7E"; when 5 => g:=x "66"; when 6 => g:=x "66";
when others => g:=x "00"; end
case ;
when ’C’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "66"; when 2 => g:=x "60";
when 3 => g:=x "60";
when 4 => g:=x "60"; when 5 => g:=x "66"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’D’ => case row is
when 0 => g:=x"7C"; when 1 => g:=x "66"; when 2 => g:=x "66";
when 3 => g:=x "66";
when 4 => g:=x "66"; when 5 => g:=x "66"; when 6 => g:=x"7C";
when others => g:=x "00"; end
case ;
when ’F’ => case row is
when 0 => g:=x"7E"; when 1 => g:=x "60"; when 2 => g:=x "60";
when 3 => g:=x"7C";
when 4 => g:=x "60"; when 5 => g:=x "60"; when 6 => g:=x "60";
when others => g:=x "00"; end case ;
when ’G’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "66"; when 2 => g:=x "60";
when 3 => g:=x"6E";
when 4 => g:=x "66"; when 5 => g:=x "66"; when 6 => g:=x"3E";
when others => g:=x "00"; end
case ;
when ’I’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "18"; when 2 => g:=x "18";
when 3 => g:=x "18";
when 4 => g:=x "18"; when 5 => g:=x "18"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’L’ => case row is
when 0 => g:=x "60"; when 1 => g:=x "60"; when 2 => g:=x "60";
when 3 => g:=x "60";
when 4 => g:=x "60"; when 5 => g:=x "60"; when 6 => g:=x"7E";
when others => g:=x "00"; end
case ;
when ’M’ => case row is
when 0 => g:=x "63"; when 1 => g:=x "77"; when 2 => g:=x"7F";
when 3 => g:=x"6B";
when 4 => g:=x "63"; when 5 => g:=x "63"; when 6 => g:=x "63";
when others => g:=x "00"; end case ;
when ’N’ => case row is
when 0 => g:=x "66"; when 1 => g:=x "76"; when 2 => g:=x"7E";
when 3 => g:=x"7E";
when 4 => g:=x"6E"; when 5 => g:=x "66"; when 6 => g:=x "66";
when others => g:=x "00"; end
case ;
when ’O’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "66"; when 2 => g:=x "66";
when 3 => g:=x "66";
when 4 => g:=x "66"; when 5 => g:=x "66"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’P’ => case row is
when 0 => g:=x"7C"; when 1 => g:=x "66"; when 2 => g:=x "66";
when 3 => g:=x"7C";
when 4 => g:=x "60"; when 5 => g:=x "60"; when 6 => g:=x "60";
when others => g:=x "00"; end case ;
  when ’R’ => case row is
when 0 => g:=x"7C"; when 1 => g:=x "66"; when 2 => g:=x "66";
when 3 => g:=x"7C";
when 4 => g:=x"6C"; when 5 => g:=x "66"; when 6 => g:=x "66";
when others => g:=x "00"; end
case ;
when ’S’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "66"; when 2 => g:=x "30";
when 3 => g:=x "18";
when 4 => g:=x"0C"; when 5 => g:=x "66"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’T’ => case row is
when 0 => g:=x"7E"; when 1 => g:=x"5A"; when 2 => g:=x "18";
when 3 => g:=x "18";
when 4 => g:=x "18"; when 5 => g:=x "18"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’V’ => case row is
when 0 => g:=x "66"; when 1 => g:=x "66"; when 2 => g:=x "66";
when 3 => g:=x "66";
when 4 => g:=x "66"; when 5 => g:=x"3C"; when 6 => g:=x "18";
when others => g:=x "00"; end
case ;
when ’X’ => case row is
when 0 => g:=x "66"; when 1 => g:=x "66"; when 2 => g:=x"3C";
when 3 => g:=x "18";
when 4 => g:=x"3C"; when 5 => g:=x "66"; when 6 => g:=x "66";
when others => g:=x "00"; end
case ;
when ’ ’ => g := x "00";
when ’.’ => case row is
when 5 => g:=x "18"; when 6 => g:=x "18"; when others => g:=x
"00"; end case ;
when ’-’ => case row is
when 3 => g:=x"7E"; when others => g:=x "00"; end case ;
when ’:’ => case row is
when 1 => g:=x "18"; when 2 => g:=x "18"; when 4 => g:=x "18";
when 5 => g:=x "18"; when others
=> g:=x "00"; end case ;
when others => g := x "00";
end case ;
return g;
end function ;
function text_on (str : string ; px , py , x0 , y0 : integer ) return
std_logic is
variable relx , rely : integer ;
variable chpos , col , row : integer ;
variable c : character ;
variable gg : std_logic_vector (7 downto 0);
begin
if px < x0 or py < y0 then return ’0’; end if;
relx := px - x0;
rely := py - y0;
if rely < 0 or rely >= 8 then return ’0’; end if;
chpos := relx / 8;
col := relx mod 8;
row := rely ;
if chpos < 0 or chpos >= str ’ length then return ’0’; end if;
c := str(str ’low + chpos );
gg := glyph (c, row );
if gg (7- col )=’1’ then return ’1’; else return ’0’; end if;
end function ;
signal xi , yi : integer range 0 to 1023;
signal on_all : std_logic ;
begin
xi <= to_integer (x);
yi <= to_integer (y);
on_all <= ’1’ when (de=’1’ and (
-- canopy frame
(yi = 36 and xi >= 36 and xi <= 604) or
(yi = 35 and xi >= 40 and xi <= 600) or
((( xi -320) *(xi -320) + (yi +260) *( yi +260) >= 525*525) and
((xi -320) *(xi -320) + (yi +260) *( yi +260) <= 527*527) and yi <=
80) or
(( xi = 38 or xi = 602) and yi >= 40 and yi <= 446) or
(( yi = 446) and (( xi >= 40 and xi <= 230) or (xi >= 410 and xi
<= 600) )) or
(( yi >= 430 and yi <= 446) and (xi = 230 or xi = 410) ) or
-- top center cross
(( xi = 320 or xi = 321) and yi >= 88 and yi <= 112) or
(( yi = 100 or yi = 101) and xi >= 308 and xi <= 332) or
-- upper brackets + 5 5
(( yi = 130) and (( xi >= 245 and xi <= 285) or (xi >= 355 and xi
<= 395) )) or
(( xi = 285 and yi >= 130 and yi <= 140) or (xi = 355 and yi >=
130 and yi <= 140) ) or
( text_on ("5" , xi , yi , 238 , 136) =’1’) or
( text_on ("5" , xi , yi , 389 , 136) =’1’) or
-- upper central pipper / crown
((( xi -320) *(xi -320) + (yi -214) *(yi -214) >= 9*9) and
((xi -320) *(xi -320) + (yi -214) *(yi -214) <= 11*11) ) or
(( yi = 214 or yi = 215) and xi >= 292 and xi <= 348) or
(( xi = 320 or xi = 321) and yi >= 186 and yi <= 214) or
(( yi = 184 and xi >= 315 and xi <= 325) ) or
(( yi = 182 and xi >= 310 and xi <= 330) ) or
(( yi = 180 and xi >= 305 and xi <= 335) ) or
(( yi = 182 and (xi = 300 or xi = 340) ) or
(yi = 186 and (xi = 296 or xi = 344) ) or
(yi = 190 and (xi = 292 or xi = 348) )) or
((( xi -370) *(xi -370) + (yi -214) *(yi -214) >= 5*5) and
((xi -370) *(xi -370) + (yi -214) *(yi -214) <= 7*7) ) or
((( xi -405) *(xi -405) + (yi -250) *(yi -250) >= 6*6) and
((xi -405) *(xi -405) + (yi -250) *(yi -250) <= 8*8) ) or
-- left speed scale
(( xi = 120 or xi = 121) and yi >= 214 and yi <= 342) or
  (( yi = 214 or yi = 215) and xi >= 15 and xi <= 280) or
(( yi = 214 or yi = 215) and xi >= 380 and xi <= 602) or
(( yi = 214 or yi = 230 or yi = 246 or yi = 262 or yi = 278 or
yi = 294 or yi = 310 or yi = 326 or yi =
342) and xi >= 112 and xi <= 121) or
( text_on ("50" , xi , yi , 76, 196) =’1’) or
( text_on ("40" , xi , yi , 76, 324) =’1’) or
( text_on ("480" , xi , yi , 26, 228) =’1’) or
((( yi = 218 or yi = 232) and xi >= 14 and xi <= 58) or
(( xi = 14 or xi = 58) and yi >= 218 and yi <= 232) or
(( xi >= 58 and xi <= 72) and yi = 225 + abs_i (xi -72) )) or
(( yi = 225 or yi = 226) and xi >= 121 and xi <= 141) or
(( xi = 145 or xi = 146) and yi >= 214 and yi <= 226) or
(( yi = 228 or yi = 229) and xi >= 121 and xi <= 140) or
(( yi = 258 + abs_i (xi -144) ) and xi >= 138 and xi <= 144) or
-- center lower triangle
(( xi = 205 or xi = 206 or xi = 219 or xi = 220) and yi >= 250
and yi <= 274) or
(( yi = 274 or yi = 275) and xi >= 205 and xi <= 220) or
-- lower center caret + scale
(( xi = 250 or xi = 251) and yi >= 334 and yi <= 346) or
(( xi = 318 or xi = 319 or xi = 320 or xi = 321) and yi >= 318
and yi <= 354) or
(( xi = 388 or xi = 389) and yi >= 334 and yi <= 346) or
(( yi = 320 + abs_i (xi -286) ) and xi >= 282 and xi <= 290) or
(( yi = 320 + abs_i (xi -354) ) and xi >= 350 and xi <= 358) or
( text_on ("06" , xi , yi , 236 , 340) =’1’) or
( text_on ("070" , xi , yi , 304 , 344) =’1’) or
((( yi = 342 or yi = 362) and xi >= 300 and xi <= 340) or
(( xi = 300 or xi = 340) and yi >= 342 and yi <= 362) ) or
( text_on ("08" , xi , yi , 388 , 340) =’1’) or
( text_on ("5" , xi , yi , 268 , 372) =’1’) or
( text_on ("5" , xi , yi , 386 , 372) =’1’) or
((( yi = 376 or yi = 377) and xi >= 272 and xi <= 292) or
(( xi = 292 or xi = 291) and yi >= 370 and yi <= 377) or
(( yi = 376 or yi = 377) and xi >= 348 and xi <= 368) or
(( xi = 348 or xi = 349) and yi >= 370 and yi <= 377) ) or
(( yi = 392 and (xi = 262 or xi = 278 or xi = 320 or xi = 362 or
xi = 378) ) or
(yi = 394 and (xi = 250 or xi = 390) ) or
(yi = 404 and (xi = 240 or xi = 400) ) or
(yi = 414 and (xi = 236 or xi = 404) ) or
(yi = 424 and (xi = 234 or xi = 406) ) or
(yi = 434 and (xi = 236 or xi = 404) ) or
(yi = 444 and (xi = 240 or xi = 400) ) or
(yi = 454 and (xi = 250 or xi = 390) )) or
(( xi = 320 or xi = 321) and yi >= 446 and yi <= 458) or
(( yi = 462 and xi >= 314 and xi <= 326) or
(yi = 463 and xi >= 316 and xi <= 324) or
(yi = 464 and xi >= 318 and xi <= 322) ) or
-- right altitude scale
(( xi = 510 or xi = 511) and yi >= 204 and yi <= 340) or
(( yi = 204 or yi = 220 or yi = 236 or yi = 252 or yi = 268 or
yi = 284 or yi = 300 or yi = 316 or yi =
  332) and xi >= 510 and xi <= 519) or
( text_on ("13 ,0" , xi , yi , 522 , 188) =’1’) or
( text_on ("12 ,0" , xi , yi , 522 , 284) =’1’) or
( text_on ("12.500" , xi , yi , 548 , 224) =’1’) or
((( yi = 218 or yi = 232) and xi >= 540 and xi <= 604) or
(( xi = 540 or xi = 604) and yi >= 218 and yi <= 232) or
(( xi >= 528 and xi <= 540) and yi = 225 + abs_i (xi -528) )) or
(( yi = 224 or yi = 225) and xi >= 480 and xi <= 510) or
(( yi = 268 - abs_i (xi -492) ) and xi >= 484 and xi <= 492) or
-- left text
( text_on ("1.0" , xi , yi , 120 , 150) =’1’) or
(( xi = 122 or xi = 123) and yi >= 104 and yi <= 124) or
(( yi = 114 or yi = 115) and xi >= 114 and xi <= 130) or
(( yi = 106 + abs_i (xi -122) ) and xi >= 116 and xi <= 128) or
( text_on (" SIM", xi , yi , 138 , 336) =’1’) or
( text_on ("0.88" , xi , yi , 136 , 364) =’1’) or
( text_on ("2.6" , xi , yi , 112 , 392) =’1’) or
( text_on (" NAV", xi , yi , 110 , 418) =’1’) or
-- right text block
( text_on ("R", xi , yi , 462 , 340) =’1’) or
( text_on ("11.850" , xi , yi , 486 , 340) =’1’) or
((( yi = 336 or yi = 350) and xi >= 478 and xi <= 548) or
(( xi = 478 or xi = 548) and yi >= 336 and yi <= 350) ) or
( text_on (" AL 200" , xi , yi , 470 , 366) =’1’) or
( text_on (" BO 18.7" ,xi , yi , 470 , 394) =’1’) or
( text_on (" OI 53" , xi , yi , 470 , 422) =’1’) or
( text_on ("018 >03" , xi , yi , 470 , 450) =’1’)
)) else ’0’;
process (clk )
begin
if rising_edge (clk ) then
sym_on <= on_all ;
sym_rgb <= HUD ;
end if;
end process ;
end architecture ;
