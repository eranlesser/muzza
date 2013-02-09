package com.model.rawData.ode
{
	public class TurnTableData
	{
		public function TurnTableData()
		{
		}
		
		public static var data:XML = 
<instrument type="turnTable"  thumbNail='turnTable' spriteSheet='ganza.png'>
	
<rawData>
	<vinyl image="Vinyl.png" x="500" y="150" >
		<notes>
			<up noteId="E_5" />
			<down noteId="D_5" />
		</notes>
	</vinyl>
	<chelo image="notes_sheet_v.png" x="-20" y="-20" >
		<powee id="C_6"   sound="pallet/chelo/chelo_1.mp3"   />
		<powee id="C#_6"   sound="pallet/chelo/chelo_2.mp3" />
		<powee id="D_6"   sound="pallet/chelo/chelo_3.mp3" />
	</chelo>
</rawData>

			<octaves>
			<notes>
			
			<note id="C_5"   soundFile="ode/scrach/do.mp3" animationIndex='1' value="1" x="0"  />
			<note id="C#_5"   soundFile="ode/scrach/do_diez.mp3" animationIndex='2' value="2" x="0"  />
			<note id="D_5"   soundFile="ode/scrach/re.mp3" animationIndex='3' value="3" x="0"  />
			<note id="E_5"   soundFile="ode/scrach/mi.mp3" animationIndex='4' value="4" x="0"  />
			<note id="G"   soundFile="ode/scrach/sol.mp3" animationIndex='5' value="5" x="0"  />
			
			<note id="C_6"   soundFile="ode/chelo/chelo_1.mp3" animationIndex='1' value="8" x="60"  />
			<note id="C#_6"   soundFile="ode/chelo/chelo_2.mp3" animationIndex='2' value="8" x="140" />
			<note id="D_6"   soundFile="ode/chelo/chelo_4.mp3" animationIndex='3' value="8" x="220" />
			</notes>
			</octaves>
			<gestures>
			</gestures>
			<sequances>

			
<sequance id="10">
<note id="E_5" location="160" soundLength="1"/><note id="D_5" location="172" soundLength="1"/>
<note id="E_5" location="176" soundLength="1"/><note id="D_5" location="180" soundLength="1"/><note id="E_5" location="188" soundLength="1"/>
<note id="C_5" location="416" soundLength="1"/><note id="E_5" location="424" soundLength="1"/>
<note id="D_5" location="428" soundLength="1"/><note id="E_5" location="432" soundLength="1"/>
<note id="E_5" location="436" soundLength="1"/><note id="D_5" location="444" soundLength="1"/>
			
<note id="C_6" location="68" soundLength="1"/>
<note id="C#_6" location="116" soundLength="1"/>
<note id="C_6" location="132" soundLength="1"/>
<note id="C_6" location="196" soundLength="1"/>
<note id="C#_6" location="244" soundLength="1"/>
<note id="C_6" location="260" soundLength="1"/>
<note id="C#_6" location="324" soundLength="1"/>
<note id="D_6" location="372" soundLength="1"/>
<note id="C#_6" location="388" soundLength="1"/>
<note id="C_6" location="452" soundLength="1"/>
<note id="C#_6" location="500" soundLength="1"/>
<note id="C_6" location="516" soundLength="1"/>
</sequance>
<sequance id="11">
<note id="C_5" location="160" soundLength="1"/><note id="C#_5" location="172" soundLength="1"/>
<note id="D_5" location="176" soundLength="1"/><note id="E_5" location="180" soundLength="1"/><note id="G" location="188" soundLength="1"/>
<note id="C_5" location="416" soundLength="1"/><note id="C#_5" location="424" soundLength="1"/>
<note id="D_5" location="428" soundLength="1"/><note id="E_5" location="432" soundLength="1"/>
<note id="E_5" location="436" soundLength="1"/><note id="G" location="444" soundLength="1"/>
</sequance>
<sequance id="99">
<subSequance id="10" location="128" />
</sequance>
			</sequances>
			</instrument>
	}
}