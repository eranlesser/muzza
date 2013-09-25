package com.model.rawData.motzart
{
	public class TurnTable
	{
		public function TurnTable()
		{
		}
		
		public static var data:XML = 
<instrument type="turnTable"  thumbNail='turnTable' >
<components />
<rawData>
	
	<chelo  x="22" y="6" >
		<powee id="C_5" image="iron1normal.png" imageTap="iron1tap.png" x="20"  sound="mozart/quicka/c4.mp3"   />
		<powee id="C#_6" image="iron2normal.png" imageTap="iron2tap.png" x="110"  sound="ode/scrach/chelo_2.mp3" />
		<powee id="D_6"   image="iron3normal.png" imageTap="iron3tap.png" x="220" sound="ode/scrach/chelo_3.mp3" />
		<powee id="D_6"   image="iron3normal.png" imageTap="iron3tap.png" x="220" sound="ode/scrach/chelo_3.mp3" />
	</chelo>
			
	
			
	<loopy image="DJnormal.png" imageTap="DJtap.png" x="740" y="138" >
		<notes>
			<quicka sound="quiqa_full.mp3" />
			<ganza sound="ganza_full.mp3" />
		</notes>
	</loopy>
</rawData>

			<notes>
			<note id="quicka"   soundFile="mozart/quicka/quiqa_full.mp3" animationIndex='1' value="1" x="133"  />
			<note id="ganza"   soundFile="mozart/quicka/ganza_full.mp3" animationIndex='2' value="2" x="238" />
			
			
			</notes>
			<gestures>
			</gestures>
			<sequances>

			
<sequance id="10">
 <note id="quicka" location="1" soundLength="4"/>
 <note id="ganza" location="1" soundLength="4"/>
</sequance>
<sequance id="99">
<subSequance id="10" location="64" />
<subSequance id="10" location="128" />
<subSequance id="10" location="192" />
<subSequance id="10" location="256" />
<subSequance id="10" location="320" />
<subSequance id="10" location="384" />
</sequance>
			</sequances>
			</instrument>
	}
}