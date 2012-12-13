package com.model.rawData.ode
{
	public class Claps
	{
		public function Claps()
		{
		}
		
		public static var data:XML = 
<instrument type="pallet" palletType="groovee" thumbNail='claps' spriteSheet='agogo.png'>
<components />
<text>Claps</text>
<octaves>
<notes>
<note id="claps" x="890" />
<note id="1"  soundFile="claps/claps.mp3" animationIndex='1' value="1"   />
</notes>
</octaves>
			
<sequances>
<!--claps-->
<sequance id="50">
	<note id="claps" location="5" />
</sequance>
<sequance id="10">
	<note id="1" location="5" />	
</sequance>
<sequance id="99">
<subSequance id="10" location="0" />
</sequance>
</sequances>
</instrument>
	}
}