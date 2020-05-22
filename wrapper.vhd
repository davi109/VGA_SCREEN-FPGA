-- This is a wrapper made for calling Pixel_On_Text.vhd form verilog
-- Since I'm not familiar with mapping string and structure(point_2d) bewteen verilog and vhdl, this is a simple walkaround.
-- By using Pixel_On_Text2.vhd, this file may not be necessary anymore.
-- However, sometimes it's a bit more convenient to group all you text in one place.
-- I also include some sample code for acheiving dynamic text(a simple way).
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- note this line.The package is compiled to this directory by default.
-- so don't forget to include this directory. 
library work;
-- this line also is must.This includes the particular package into your program.
use work.commonPak.all;

entity wrapper is
Port (
	clk: in std_logic;
	sw_0: in string (1 to 3) := (others => NUL);
	sw_1: in string (1 to 3) := (others => NUL);
	sw_2: in string (1 to 3) := (others => NUL);
	sw_3: in string (1 to 3) := (others => NUL);
	sw_4: in string (1 to 3) := (others => NUL);
	sw_5: in string (1 to 3) := (others => NUL);
	sw_6: in string (1 to 3) := (others => NUL);
	sw_7: in string (1 to 3) := (others => NUL);
	sw_8: in string (1 to 3) := (others => NUL);
	sw_9: in string (1 to 3) := (others => NUL);
	bt_0: in string (1 to 3) := (others => NUL);
	bt_1: in string (1 to 3) := (others => NUL);
	xCoord: in std_logic_vector(14 downto 0);
	yCoord: in std_logic_vector(14 downto 0);
	pixOn: out std_logic
);
end wrapper;

architecture Behavioral of wrapper is
	
signal h : integer := to_integer(signed(xCoord));
signal v : integer := to_integer(signed(yCoord));

-- results
signal d1 : std_logic := '0';
signal d2 : std_logic := '0';
signal d3 : std_logic := '0';
signal d4 : std_logic := '0';
signal d5 : std_logic := '0';
signal d6 : std_logic := '0';
signal d7 : std_logic := '0';
signal d8 : std_logic := '0';
signal d9 : std_logic := '0';
signal d10 : std_logic := '0';
signal d11 : std_logic := '0';
signal d12 : std_logic := '0';

begin
	textElement1: entity work.Pixel_On_Text
	generic map (
		textLength => 13
	)
	port map(
		clk => clk,
		displayText => "SWITCH 0: " & sw_0,
		position => (10, 10),
		horzCoord => h,
		vertCoord => v,
		pixel => d1
	);

	textElement2: entity work.Pixel_On_Text
	generic map (
		textLength => 13
	)
	port map(
		clk => clk,
		displayText => "SWITCH 1: " & sw_1,
		position => (10, 35),
		horzCoord => h,
		vertCoord => v,
		pixel => d2
	);

	textElement3: entity work.Pixel_On_Text
	generic map (
		textLength => 13
	)
	port map(
		clk => clk,
		displayText => "SWITCH 2: " & sw_2,
		position => (10, 60),
		horzCoord => h,
		vertCoord => v,
		pixel => d3
	);

	textElement4: entity work.Pixel_On_Text
	generic map (
		textLength => 13
	)
	port map(
		clk => clk,
		displayText => "SWITCH 3: " & sw_3,
		position => (10, 85),
		horzCoord => h,
		vertCoord => v,
		pixel => d4
	);

	textElement5: entity work.Pixel_On_Text
	generic map (
		textLength => 13
	)
	port map(
		clk => clk,
		displayText => "SWITCH 4: " & sw_4,
		position => (10, 110),
		horzCoord => h,
		vertCoord => v,
		pixel => d5
	);

	textElement6: entity work.Pixel_On_Text
	generic map (
		textLength => 13
	)
	port map(
		clk => clk,
		displayText => "SWITCH 5: " & sw_5,
		position => (10, 135),
		horzCoord => h,
		vertCoord => v,
		pixel => d6
	);

	textElement7: entity work.Pixel_On_Text
	generic map (
		textLength => 13
	)
	port map(
		clk => clk,
		displayText => "SWITCH 6: " & sw_6,
		position => (10, 160),
		horzCoord => h,
		vertCoord => v,
		pixel => d7
	);

	textElement8: entity work.Pixel_On_Text
	generic map (
		textLength => 13
	)
	port map(
		clk => clk,
		displayText => "SWITCH 7: " & sw_7,
		position => (10, 185),
		horzCoord => h,
		vertCoord => v,
		pixel => d8
	);

	textElement9: entity work.Pixel_On_Text
	generic map (
		textLength => 13
	)
	port map(
		clk => clk,
		displayText => "SWITCH 8: " & sw_8,
		position => (10, 210),
		horzCoord => h,
		vertCoord => v,
		pixel => d9
	);

	textElement10: entity work.Pixel_On_Text
	generic map (
		textLength => 13
	)
	port map(
		clk => clk,
		displayText => "SWITCH 9: " & sw_9,
		position => (10, 235),
		horzCoord => h,
		vertCoord => v,
		pixel => d10
	);

	textElement11: entity work.Pixel_On_Text
	generic map (
		textLength => 13
	)
	port map(
		clk => clk,
		displayText => "BUTTON 0: " & bt_0,
		position => (10, 260),
		horzCoord => h,
		vertCoord => v,
		pixel => d11
	);

	textElement12: entity work.Pixel_On_Text
	generic map (
		textLength => 13
	)
	port map(
		clk => clk,
		displayText => "BUTTON 1: " & bt_1,
		position => (10, 285),
		horzCoord => h,
		vertCoord => v,
		pixel => d12
	);
		
	pixelInTextGroup: process(clk)
	begin
		if rising_edge(clk) then
			-- o pixel está ativado quando um dos textos corresponde
			pixOn <= d1 or d2 or d3 or d4 or d5 or d6 or d7 or d8 or d9 or d10 or d11 or d12;
		end if;
	end process;
end Behavioral;
