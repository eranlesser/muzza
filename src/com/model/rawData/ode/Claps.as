package com.model.rawData.ode
{
	public class Claps
	{
		public function Claps()
		{
		}
		
		public static var data:XML = 
<instrument type="pallet" palletType="groovee" thumbNail='claps' rhythmOffset="13" rhythm="8" spriteSheet='agogo.png'>
<components />
<text>Claps</text>
<octaves>
<notes>
<note id="1"  soundFile="pallet/claps/claps.mp3" animationIndex='1' value="0"  x="896" />
</notes>
</octaves>
			
<sequances>
<!--claps-->
<sequance id="50">
	<note id="1" location="5" />
</sequance>

<sequance id="99">
<subSequance id="50" location="16" />
</sequance>
</sequances>
</instrument>
	}
}