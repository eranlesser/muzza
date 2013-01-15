package com.model.rawData.ode
{
	public class Scratch
	{
		public function Scratch()
		{
		}
		
		public static var data:XML = 
			<instrument type="pallet" palletType="scratch" thumbNail='scratch' width="22" height="22" spriteSheet='ganza.png'>
<components />
			<text>Scrach</text>
			<octaves>
			<notes>
			
			<note id="C_5"   soundFile="ode/scrach/do.mp3" animationIndex='1' value="0" x="0"  />
			<note id="C#_5"   soundFile="ode/scrach/do_diez.mp3" animationIndex='2' value="0" x="0"  />
			<note id="D_5"   soundFile="ode/scrach/re.mp3" animationIndex='3' value="0" x="0"  />
			<note id="E_5"   soundFile="ode/scrach/mi.mp3" animationIndex='4' value="0" x="0"  />
			<note id="G"   soundFile="ode/scrach/sol.mp3" animationIndex='5' value="0" x="0"  />
			</notes>
			</octaves>
			<gestures>
			</gestures>
			<sequances>

			
<sequance id="10">
<note id="C_5" location="40" soundLength="1"/><note id="C#_5" location="43" soundLength="1"/>
<note id="D_5" location="44" soundLength="1"/><note id="E_5" location="45" soundLength="1"/><note id="G" location="47" soundLength="1"/>
<note id="C_5" location="104" soundLength="1"/><note id="C#_5" location="106" soundLength="1"/>
<note id="D_5" location="107" soundLength="1"/><note id="E_5" location="108" soundLength="1"/>
<note id="E_5" location="109" soundLength="1"/><note id="G" location="111" soundLength="1"/>
</sequance>
<sequance id="99">
<subSequance id="10" location="32" />
</sequance>
			</sequances>
			</instrument>
	}
}