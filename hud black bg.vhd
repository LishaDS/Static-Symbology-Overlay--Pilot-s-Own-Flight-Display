library ieee ;
use ieee . std_logic_1164 .all;
entity hud_black_bg is
port (
clk : in std_logic ;
de : in std_logic ;
rgb : out std_logic_vector (11 downto 0)
);
end entity ;
architecture rtl of hud_black_bg is
begin
process (clk )
begin
if rising_edge (clk ) then
  rgb <= x "000";
end if;
end process ;
end architecture ;
