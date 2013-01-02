package com.model.rawData.ode
{
	public class Claps
	{
		public function Claps()
		{
		}
		
		public static var data:XML = 
<instrument type="pallet" palletType="groovee" thumbNail='claps' rhythmOffset="13" rhythm="8" width="22" height="22" spriteSheet='agogo.png'>
<data>
			<row><togi id="C_6"   sound="ode/drums/bd.mp3"  selected="true" /></row>
			<row><togi id="C#_6"   sound="ode/drums/shaker.mp3" selected="true" /></row>
			<row><togi id="C#_7"   sound="ode/drums/bd.mp3" selected="true" /></row>
			<row><togi id="D_6"   sound="pallet/claps/claps.mp3" selected="true" /></row>
			</data>
<components />
<text>Claps</text>
<octaves>
<notes>
<note id="22"  soundFile="pallet/claps/claps.mp3" animationIndex='2' value="1"  x="900" />
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