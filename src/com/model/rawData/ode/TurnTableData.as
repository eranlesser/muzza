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
	
	<chelo  x="22" y="77" >
		<powee id="C_6" image="iron1normal.png" imageTap="iron1tap.png" x="20"  sound="pallet/chelo/chelo_1.mp3"   />
		<powee id="C#_6" image="iron2normal.png" imageTap="iron2tap.png" x="110"  sound="pallet/chelo/chelo_2.mp3" />
		<powee id="D_6"   image="iron3normal.png" imageTap="iron3tap.png" x="220" sound="pallet/chelo/chelo_3.mp3" />
	</chelo>
			
	<hey x="380" y="120" noteId="G" sound="ode/scrach/sol.mp3">
		<text>Hey</text>
	</hey>
			
	<vinyl image="DJnormal.png" imageTap="DJtap.png" x="740" y="208" >
		<notes>
			<up noteId="E_5" />
			<down noteId="D_5" />
		</notes>
	</vinyl>
</rawData>

			<octaves>
			<notes>
			
			<note id="D_5"   soundFile="ode/scrach/re.mp3" animationIndex='3' value="2" x="740"  />
			<note id="E_5"   soundFile="ode/scrach/mi.mp3" animationIndex='4' value="1" x="740"  />
			<note id="G"   soundFile="ode/scrach/sol.mp3" animationIndex='5' value="7" x="380"  />
			
			<note id="C_6"   soundFile="ode/chelo/chelo_1.mp3" animationIndex='1' value="7" x="54"  />
			<note id="C#_6"   soundFile="ode/chelo/chelo_2.mp3" animationIndex='2' value="8" x="142" />
			<note id="D_6"   soundFile="ode/chelo/chelo_4.mp3" animationIndex='3' value="9" x="252" />
			</notes>
			</octaves>
			<gestures>
			</gestures>
			<sequances>

			
<sequance id="10">
<note id="D_5" location="160" soundLength="1"/><note id="E_5" location="168" soundLength="1"/>
<note id="D_5" location="172" soundLength="1"/><note id="E_5" location="176" soundLength="1"/>
<note id="D_5" location="180" soundLength="1"/>
<note id="E_5" location="416" soundLength="1"/><note id="D_5" location="424" soundLength="1"/>
<note id="E_5" location="428" soundLength="1"/><note id="D_5" location="432" soundLength="1"/>
<note id="E_5" location="440" soundLength="1"/>
			
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