-- VHDL netlist generated by SCUBA Diamond (64-bit) 3.5.0.102
-- Module  Version: 5.8
--/mt/lattice/diamond/3.5_x64/ispfpga/bin/lin64/scuba -w -n ddr_out -lang vhdl -synth synplify -bus_exp 7 -bb -arch xo2c00 -type iol -mode out -io_type LVDS25 -width 1 -freq_in 150 -gear 1 -clk sclk -del -1 

-- Mon Oct 26 12:41:19 2015

library IEEE;
use IEEE.std_logic_1164.all;
-- synopsys translate_off
library MACHXO2;
use MACHXO2.components.all;
-- synopsys translate_on

entity ddr_out is
    port (
        clkop: in  std_logic; 
        clkos: in  std_logic; 
        clkout: out  std_logic; 
        reset: in  std_logic; 
        sclk: out  std_logic; 
        dataout: in  std_logic_vector(1 downto 0); 
        dout: out  std_logic_vector(0 downto 0));
end ddr_out;

architecture Structure of ddr_out is

    -- internal signal declarations
    signal db0: std_logic;
    signal da0: std_logic;
    signal buf_clkout: std_logic;
    signal scuba_vlo: std_logic;
    signal scuba_vhi: std_logic;
    signal buf_douto0: std_logic;

    -- local component declarations
    component VHI
        port (Z: out  std_logic);
    end component;
    component VLO
        port (Z: out  std_logic);
    end component;
    component OB
        port (I: in  std_logic; O: out  std_logic);
    end component;
    component ODDRXE
        port (D0: in  std_logic; D1: in  std_logic; SCLK: in  std_logic; 
            RST: in  std_logic; Q: out  std_logic);
    end component;
    attribute IO_TYPE : string; 
    attribute IO_TYPE of Inst4_OB : label is "LVDS25";
    attribute IO_TYPE of Inst1_OB0 : label is "LVDS25";
    attribute syn_keep : boolean;
    attribute NGD_DRC_MASK : integer;
    attribute NGD_DRC_MASK of Structure : architecture is 1;

begin
    -- component instantiation statements
    Inst4_OB: OB
        port map (I=>buf_clkout, O=>clkout);

    Inst3_ODDRXE0: ODDRXE
        port map (D0=>da0, D1=>db0, SCLK=>clkop, RST=>reset, 
            Q=>buf_douto0);

    scuba_vlo_inst: VLO
        port map (Z=>scuba_vlo);

    scuba_vhi_inst: VHI
        port map (Z=>scuba_vhi);

    Inst2_ODDRXE: ODDRXE
        port map (D0=>scuba_vhi, D1=>scuba_vlo, SCLK=>clkos, RST=>reset, 
            Q=>buf_clkout);

    Inst1_OB0: OB
        port map (I=>buf_douto0, O=>dout(0));

    sclk <= clkop;
    db0 <= dataout(1);
    da0 <= dataout(0);
end Structure;

-- synopsys translate_off
library MACHXO2;
configuration Structure_CON of ddr_out is
    for Structure
        for all:VHI use entity MACHXO2.VHI(V); end for;
        for all:VLO use entity MACHXO2.VLO(V); end for;
        for all:OB use entity MACHXO2.OB(V); end for;
        for all:ODDRXE use entity MACHXO2.ODDRXE(V); end for;
    end for;
end Structure_CON;

-- synopsys translate_on