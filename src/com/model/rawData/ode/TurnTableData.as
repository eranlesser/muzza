package com.model.rawData.ode
{
	public class TurnTableData
	{
		public function TurnTableData()
		{
		}
		
		public static var data:XML = 
<instrument type="turnTable"  thumbNail='turnTable' spriteSheet='ganza.png'>
<components />
<rawData>
	<vinyl image="Vinyl.png" x="500" y="150" >
		<notes>
			<up noteId="E_5" />
			<down noteId="D_5" />
		</notes>
	</vinyl>
	<chelo image="notes_sheet_v.png" x="-33" y="-23" >
		<powee id="C_6"   sound="pallet/chelo/chelo_1.mp3"   />
		<powee id="C#_6"   sound="pallet/chelo/chelo_2.mp3" />
		<powee id="D_6"   sound="pallet/chelo/chelo_3.mp3" />
	</chelo>
	<hey x="750" y="-20" noteId="G" sound="ode/scrach/sol.mp3">
		<text>Hey</text>
	</hey>
</rawData>

			<octaves>
			<notes>
			
			<note id="D_5"   soundFile="ode/scrach/re.mp3" animationIndex='3' value="2" x="670"  />
			<note id="E_5"   soundFile="ode/scrach/mi.mp3" animationIndex='4' value="1" x="670"  />
			<note id="G"   soundFile="ode/scrach/sol.mp3" animationIndex='5' value="7" x="900"  />
			
			<note id="C_6"   soundFile="ode/chelo/chelo_1.mp3" animationIndex='1' value="7" x="150"  />
			<note id="C#_6"   soundFile="ode/chelo/chelo_2.mp3" animationIndex='2' value="8" x="240" />
			<note id="D_6"   soundFile="ode/chelo/chelo_4.mp3" animationIndex='3' value="9" x="330" />
			</notes>
			</octaves>
			<gestures>
			</gestures>
			<sequances>

			
<sequance id="10">
<note id="D_5" location="160" soundLength="1"/><note id="E_5" location="168" soundLength="1"/>
<note id="D_5" location="172" soundLength="1"/><note id="E_5" location="176" soundLength="1"/>
<note id="D_5" location="184" soundLength="1"/>
<note id="E_5" location="416" soundLength="1"/><note id="D_5" location="424" soundLength="1"/>
<note id="E_5" location="428" soundLength="1"/><note id="D_5" location="432" soundLength="1"/>
<note id="E_5" location="436" soundLength="1"/><note id="D_5" location="444" soundLength="1"/>
			
<note id="C_6" location="68" soundLength="1"/>
<note id="C#_6" location="116" soundLength="1"/>
<note id="C_6" location="132" soundLength="1"/>
<note id="G" location="189" soundLength="1"/>
<note id="C_6" location="196" soundLength="1"/>
<note id="C#_6" location="244" soundLength="1"/>
<note id="C_6" location="260" soundLength="1"/>
<note id="C#_6" location="324" soundLength="1"/>
<note id="D_6" location="372" soundLength="1"/>
<note id="C#_6" location="388" soundLength="1"/>
<note id="G" location="445" soundLength="1"/>
<note id="C_6" location="452" soundLength="1"/>
<note id="C#_6" location="500" soundLength="1"/>
<note id="C_6" location="516" soundLength="1"/>
</sequance>
<sequance id="11">
<note id="C_5" location="160" soundLength="1"/><note id="C#_5" location="172" soundLength="1"/>
<note id="D_5" location="176" soundLength="1"/><note id="E_5" location="180" soundLength="1"/>
<note id="G" location="189" soundLength="1"/>
<note id="C_5" location="416" soundLength="1"/><note id="C#_5" location="424" soundLength="1"/>
<note id="D_5" location="428" soundLength="1"/><note id="E_5" location="432" soundLength="1"/>
<note id="E_5" location="436" soundLength="1"/><note id="G" location="445" soundLength="1"/>
</sequance>
<sequance id="99">
<subSequance id="10" location="64" />
</sequance>
			</sequances>
			</instrument>
	}
}