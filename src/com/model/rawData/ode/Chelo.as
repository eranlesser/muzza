package com.model.rawData.ode
{
	public class Chelo
	{
		public function Chelo()
		{
		}
		
		public static var data:XML = 
			<instrument type="pallet" palletType='chelo' thumbNail='chelo' spriteSheet='quika.png'>
			<data>
			<powee id="C_6"   sound="pallet/chelo/chelo_1.mp3"   />
			<powee id="C#_6"   sound="pallet/chelo/chelo_2.mp3" />
			<powee id="D_6"   sound="pallet/chelo/chelo_3.mp3" />
			</data>
<components />
			<text>Chelo</text>
			<octaves>
			<notes>
			<note id="C_6"   soundFile="ode/chelo/chelo_1.mp3" animationIndex='1' value="0" x="755"  />
			<note id="C#_6"   soundFile="ode/chelo/chelo_2.mp3" animationIndex='2' value="0" x="835" />
			<note id="D_6"   soundFile="ode/chelo/chelo_3.mp3" animationIndex='3' value="0" x="915" />
			
			</notes>
			</octaves>
			<gestures>
			</gestures>
			<sequances>

			
<sequance id="10">
<note id="C_6" location="17" soundLength="1"/>
<note id="C#_6" location="29" soundLength="1"/>
<note id="C_6" location="33" soundLength="1"/>
<note id="C_6" location="49" soundLength="1"/>
<note id="C#_6" location="61" soundLength="1"/>
<note id="C_6" location="65" soundLength="1"/>
<note id="C#_6" location="81" soundLength="1"/>
<note id="D_6" location="93" soundLength="1"/>
<note id="C#_6" location="97" soundLength="1"/>
<note id="C_6" location="113" soundLength="1"/>
<note id="C#_6" location="125" soundLength="1"/>
<note id="C_6" location="129" soundLength="1"/>	
</sequance>
<sequance id="99">
<subSequance id="10" location="16" />
</sequance>
			</sequances>
			</instrument>
	}
}