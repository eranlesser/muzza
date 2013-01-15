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
			<row><togi id="C_6"   sound="ode/drums/shaker.mp3"  selected="true" /></row>
			<row><togi id="C#_6"   sound="ode/drums/shaker.mp3" selected="true" /></row>
			<row><togi id="D_6"   sound="pallet/claps/claps.mp3" selected="true" /></row>
			<row><togi id="C#_7"   sound="ode/drums/shaker.mp3" selected="true" /></row>
			</data>
<components />
<text>Claps</text>
<octaves>
<notes>
<note id="22"  soundFile="pallet/claps/claps.mp3" animationIndex='2' value="1"  x="900" />
<note id="C_6"  soundFile="ode/drums/shaker.mp3" animationIndex='3' value="1"  x="900" />
<note id="C#_6"  soundFile="ode/drums/shaker.mp3" animationIndex='4' value="1"  x="900" />
<note id="C#_7"  soundFile="ode/drums/shaker.mp3" animationIndex='3' value="1"  x="900" />
<note id="D_6"  soundFile="pallet/claps/claps.mp3" animationIndex='2' value="1"  x="900" />
</notes>
</octaves>
			
<sequances>
<!--claps-->
<sequance id="50">
	<note id="22" location="5" soundLength="1" />
</sequance>
<sequance id="9">
<note id="C_6" location="0" soundLength="1" />
<note id="C#_6" location="4" soundLength="1" />
<note id="C#_7" location="8" soundLength="1" />
<note id="D_6" location="12" soundLength="1" />

</sequance>
<sequance id="99">
<subSequance id="9" location="1" />
<subSequance id="9" location="17" />
<subSequance id="9" location="33" />
<subSequance id="9" location="49" />
<subSequance id="9" location="65" />
<subSequance id="9" location="81" />
<subSequance id="9" location="97" />
<subSequance id="9" location="113" />
<subSequance id="9" location="129" />
<subSequance id="9" location="145" />
<subSequance id="9" location="161" />

</sequance>

<sequance id="10">
<subSequance id="50" location="16" />
</sequance>
</sequances>
</instrument>
	}
}