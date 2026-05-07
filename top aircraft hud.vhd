library ieee ;
use ieee . std_logic_1164 .all;
use ieee . numeric_std .all;
entity top_aircraft_hud is
port (
clk100MHz : in std_logic ;
btnC : in std_logic ;
vgaRed : out std_logic_vector (3 downto 0);
vgaGreen : out std_logic_vector (3 downto 0);
vgaBlue : out std_logic_vector (3 downto 0);
Hsync : out std_logic ;
Vsync : out std_logic
);
end entity ;
architecture rtl of top_aircraft_hud is
signal rst : std_logic ;
signal pix_clk : std_logic := ’0’;
signal div_cnt : unsigned (1 downto 0) := ( others =>’0’);
signal de : std_logic ;
signal x, y : unsigned (9 downto 0);
signal rgb_bg : std_logic_vector (11 downto 0);
signal sym_on : std_logic ;
signal sym_rgb : std_logic_vector (11 downto 0);
signal rgb_out : std_logic_vector (11 downto 0);
begin
rst <= btnC ;
process ( clk100MHz )
begin
if rising_edge ( clk100MHz ) then
if rst =’1’ then
div_cnt <= ( others =>’0’);
pix_clk <= ’0’;
  else
div_cnt <= div_cnt + 1;
pix_clk <= div_cnt (1) ;
end if;
end if;
end process ;
U_TIMING : entity work . vga_timing
port map (
clk => pix_clk ,
rst => rst ,
hsync => Hsync ,
vsync => Vsync ,
de => de ,
x => x,
y => y
);
U_BG : entity work . hud_black_bg
port map (
clk => pix_clk ,
de => de ,
rgb => rgb_bg
);
U_SYM : entity work . hud_aircraft_symbology
port map (
clk => pix_clk ,
de => de ,
x => x,
y => y,
sym_on => sym_on ,
sym_rgb => sym_rgb
);
U_OVL : entity work . overlay_engine
port map (
clk => pix_clk ,
de => de ,
rgb_bg => rgb_bg ,
sym_on => sym_on ,
sym_rgb => sym_rgb ,
rgb_out => rgb_out
);
vgaRed <= rgb_out (11 downto 8);
vgaGreen <= rgb_out (7 downto 4);
vgaBlue <= rgb_out (3 downto 0);
end architecture ;
