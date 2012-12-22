package com.model.rawData.ode
{
	public class Claps
	{
		public function Claps()
		{
		}
		
		public static var data:XML = 
<instrument type="pallet" palletType="groovee" thumbNail='claps' rhythmOffset="13" rhythm="8" width="22" height="22" spriteSheet='agogo.png'>
<components />
<text>Claps</text>
<octaves>
<notes>
<note id="22"  soundFile="pallet/claps/claps.mp3" animationIndex='2' value="1"  x="896" />
</notes>
</octaves>
			
<sequances>
<!--claps-->
<sequance id="50">
	<note id="22" location="5" soundLength="1" />
</sequance>
<sequance id="10">


</sequance>

<sequance id="99">
<subSequance id="50" location="20" />
</sequance>
</sequances>
</instrument>
	}
}