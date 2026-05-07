library ieee ;
use ieee . std_logic_1164 .all;
entity overlay_engine is
port (
clk : in std_logic ;
de : in std_logic ;
rgb_bg : in std_logic_vector (11 downto 0);
sym_on : in std_logic ;
sym_rgb : in std_logic_vector (11 downto 0);
rgb_out : out std_logic_vector (11 downto 0)
);
end entity ;
  architecture rtl of overlay_engine is
begin
process (clk )
begin
if rising_edge (clk ) then
if de=’1’ then
if sym_on =’1’ then
rgb_out <= sym_rgb ;
else
rgb_out <= rgb_bg ;
end if;
else
rgb_out <= ( others =>’0’);
end if;
end if;
end process ;
end architecture ;
  
