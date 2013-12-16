package com.model.rawData.jingleBells
{
	public class Bottles
	{
		public function Bottles()
		{
		}
		public static var data:XML = 
<bottles type="bottles" thumbNail='bottles.png' spriteSheet='bottlesSheet.png'  width="410" height="460">
<eyes swfSheet="bottlesEyes.png" x="0" y="0" width="440" height="460" >
	<blink start="0" end="4" />
	<blink start="4" end="12" />
	<blink start="12" end="16" />
	<blink start="16" end="22" />
	<blink start="22" end="26" />
	<blink start="26" end="31" />
	
</eyes>						
<components notesGap="80" leftPad="179">
<bg image="bottles_frame.png" clickable="false"  y="10" />
<bottle image="bottle_1_idle.png" playImage="bottle_1_SELECTED.png" x='50' y='0' >
			<tap noteId="A_4" />
		</bottle>
		<bottle image="bottle_2_idle.png" playImage="bottle_2_SELECTED.png" x='130' y='0' >
			<tap noteId="B_4" />
		</bottle>
		<bottle image="bottle_3_idle.png" playImage="bottle_3_SELECTED.png" x='210' y='0' >
			<tap noteId="C#_5" />
		</bottle>
		<bottle image="bottle_4_idle.png" playImage="bottle_4_SELECTED.png" x='290' y='0' >
			<tap noteId="D_5" />
		</bottle>
		<bottle image="bottle_5_idle.png" playImage="bottle_5_SELECTED.png" x='370' y='0' >
			<tap noteId="E_5" />
		</bottle>
		<bottle image="bottle_6_idle.png" playImage="bottle_6_SELECTED.png" x='450' y='0' >
			<tap noteId="F#_5" />
		</bottle>
		<bottle image="bottle_7_idle.png" playImage="bottle_7_SELECTED.png" x='530' y='0'>
			<tap noteId="G_5" />
		</bottle>
		<bottle image="bottle_8_idle.png" playImage="bottle_8_SELECTED.png" x='610' y='0' >
			<tap noteId="A_5" />
		</bottle>
		<bottle image="bottle_9_idle.png" playImage="bottle_9_SELECTED.png" x='690' y='0' >
			<tap noteId="B_5" />
		</bottle>
</components>
<notes>
	<note id="A_4"  soundFile="jingleBells/bottle/la_down.mp3" animationIndex='3'  value="1"/>
	<note id="B_4"  soundFile="jingleBells/bottle/ci_down.mp3" animationIndex='8'  value="2"/>
	<note id="C#_5"  soundFile="jingleBells/bottle/ci_diez.mp3" animationIndex='2'  value="3"  />
	<note id="D_5" soundFile="jingleBells/bottle/re.mp3" animationIndex='7' value="4" />
	<note id="E_5" soundFile="jingleBells/bottle/mi.mp3" animationIndex='7' value="5" />
	<note id="F#_5"  soundFile="jingleBells/bottle/fa_diez.mp3" animationIndex='4'  value="6"/>
	<note id="G_5" soundFile="jingleBells/bottle/sol.mp3" animationIndex='7' value="7" />
	<note id="A_5" soundFile="jingleBells/bottle/la.mp3" animationIndex='7' value="8" />
	<note id="B_5"  soundFile="jingleBells/bottle/ci.mp3" animationIndex='1' value="9"    />

</notes>
<gestures>
</gestures>
<sequances>

			
<sequance id="10">


 <note id="F#_5" location="1" soundLength="4"/>
 <note id="A_5" location="9" soundLength="4"/>
 <note id="D_5" location="17" soundLength="4"/>
 <note id="E_5" location="25" soundLength="4"/>
 <note id="F#_5" location="33" soundLength="4"/>
 <note id="F#_5" location="65" soundLength="4"/>
 <note id="F#_5" location="73" soundLength="4"/>
 <note id="F#_5" location="81" soundLength="8"/>
 <note id="F#_5" location="97" soundLength="4"/>
 <note id="F#_5" location="105" soundLength="4"/>
 <note id="F#_5" location="113" soundLength="8"/>
 <note id="F#_5" location="129" soundLength="4"/>
 <note id="A_5" location="137" soundLength="4"/>
 <note id="D_5" location="145" soundLength="4"/>
 <note id="E_5" location="153" soundLength="4"/>
 <note id="F#_5" location="161" soundLength="4"/>
 <note id="G_5" location="193" soundLength="4"/>
 <note id="G_5" location="201" soundLength="4"/>
 <note id="G_5" location="209" soundLength="12"/>
 <note id="G_5" location="225" soundLength="4"/>
 <note id="F#_5" location="233" soundLength="4"/>
 <note id="F#_5" location="241" soundLength="8"/>
 <note id="F#_5" location="257" soundLength="4"/>
 <note id="E_5" location="265" soundLength="4"/>
 <note id="E_5" location="273" soundLength="4"/>
 <note id="F#_5" location="281" soundLength="4"/>
 <note id="E_5" location="289" soundLength="12"/>
 <note id="F#_5" location="321" soundLength="4"/>
 <note id="F#_5" location="329" soundLength="4"/>
 <note id="F#_5" location="337" soundLength="8"/>
 <note id="F#_5" location="353" soundLength="4"/>
 <note id="F#_5" location="361" soundLength="4"/>
 <note id="F#_5" location="369" soundLength="8"/>
 <note id="F#_5" location="385" soundLength="4"/>
 <note id="A_5" location="393" soundLength="4"/>
 <note id="D_5" location="401" soundLength="4"/>
 <note id="E_5" location="409" soundLength="4"/>
 <note id="F#_5" location="417" soundLength="4"/>
 <note id="G_5" location="449" soundLength="4"/>
 <note id="G_5" location="457" soundLength="4"/>
 <note id="G_5" location="465" soundLength="12"/>
 <note id="G_5" location="481" soundLength="4"/>
 <note id="F#_5" location="489" soundLength="4"/>
 <note id="F#_5" location="497" soundLength="8"/>
 <note id="A_5" location="513" soundLength="4"/>
 <note id="A_5" location="521" soundLength="4"/>
 <note id="G_5" location="529" soundLength="4"/>
 <note id="E_5" location="537" soundLength="4"/>
 <note id="D_5" location="545" soundLength="12"/>
 <note id="A_4" location="577" soundLength="8"/>
 <note id="F#_5" location="585" soundLength="8"/>
 <note id="E_5" location="593" soundLength="8"/>
 <note id="D_5" location="601" soundLength="8"/>
 <note id="A_4" location="609" soundLength="8"/>
 <note id="A_4" location="641" soundLength="8"/>
 <note id="F#_5" location="649" soundLength="8"/>
 <note id="E_5" location="657" soundLength="8"/>
 <note id="D_5" location="665" soundLength="8"/>
 <note id="B_4" location="673" soundLength="8"/>
 <note id="B_4" location="705" soundLength="8"/>
 <note id="G_5" location="713" soundLength="8"/>
 <note id="F#_5" location="721" soundLength="8"/>
 <note id="E_5" location="729" soundLength="8"/>
 <note id="C#_5" location="737" soundLength="8"/>
 <note id="A_5" location="769" soundLength="8"/>
 <note id="A_5" location="777" soundLength="8"/>
 <note id="G_5" location="785" soundLength="8"/>
 <note id="E_5" location="793" soundLength="8"/>
 <note id="F#_5" location="801" soundLength="8"/>
 <note id="A_4" location="833" soundLength="8"/>
 <note id="F#_5" location="841" soundLength="8"/>
 <note id="E_5" location="849" soundLength="8"/>
 <note id="D_5" location="857" soundLength="8"/>
 <note id="A_4" location="865" soundLength="8"/>
 <note id="A_4" location="897" soundLength="8"/>
 <note id="F#_5" location="905" soundLength="8"/>
 <note id="E_5" location="913" soundLength="8"/>
 <note id="D_5" location="921" soundLength="8"/>
 <note id="B_4" location="929" soundLength="8"/>
 <note id="B_4" location="961" soundLength="8"/>
 <note id="G_5" location="969" soundLength="8"/>
 <note id="F#_5" location="977" soundLength="8"/>
 <note id="E_5" location="985" soundLength="8"/>
 <note id="A_5" location="993" soundLength="8"/>
 <note id="A_5" location="1009" soundLength="8"/>
 <note id="A_5" location="1017" soundLength="8"/>
 <note id="B_5" location="1025" soundLength="8"/>
 <note id="A_5" location="1033" soundLength="8"/>
 <note id="G_5" location="1041" soundLength="8"/>
 <note id="E_5" location="1049" soundLength="8"/>
 <note id="D_5" location="1057" soundLength="8"/>
 <note id="F#_5" location="1089" soundLength="4"/>
 <note id="F#_5" location="1097" soundLength="4"/>
 <note id="F#_5" location="1105" soundLength="8"/>
 <note id="F#_5" location="1121" soundLength="4"/>
 <note id="F#_5" location="1129" soundLength="4"/>
 <note id="F#_5" location="1137" soundLength="8"/>
 <note id="F#_5" location="1153" soundLength="4"/>
 <note id="A_5" location="1161" soundLength="4"/>
 <note id="D_5" location="1169" soundLength="4"/>
 <note id="E_5" location="1177" soundLength="4"/>
 <note id="F#_5" location="1185" soundLength="4"/>
 <note id="G_5" location="1217" soundLength="4"/>
 <note id="G_5" location="1225" soundLength="4"/>
 <note id="G_5" location="1233" soundLength="12"/>
 <note id="G_5" location="1249" soundLength="4"/>
 <note id="F#_5" location="1257" soundLength="4"/>
 <note id="F#_5" location="1265" soundLength="8"/>
 <note id="F#_5" location="1281" soundLength="4"/>
 <note id="E_5" location="1289" soundLength="4"/>
 <note id="E_5" location="1297" soundLength="4"/>
 <note id="F#_5" location="1305" soundLength="4"/>
 <note id="E_5" location="1313" soundLength="12"/>
 <note id="F#_5" location="1345" soundLength="4"/>
 <note id="F#_5" location="1353" soundLength="4"/>
 <note id="F#_5" location="1361" soundLength="8"/>
 <note id="F#_5" location="1377" soundLength="4"/>
 <note id="F#_5" location="1385" soundLength="4"/>
 <note id="F#_5" location="1393" soundLength="8"/>
 <note id="F#_5" location="1409" soundLength="4"/>
 <note id="A_5" location="1417" soundLength="4"/>
 <note id="D_5" location="1425" soundLength="4"/>
 <note id="E_5" location="1433" soundLength="4"/>
 <note id="F#_5" location="1441" soundLength="4"/>
 <note id="G_5" location="1473" soundLength="4"/>
 <note id="G_5" location="1481" soundLength="4"/>
 <note id="G_5" location="1489" soundLength="12"/>
 <note id="G_5" location="1505" soundLength="4"/>
 <note id="F#_5" location="1513" soundLength="4"/>
 <note id="F#_5" location="1521" soundLength="8"/>
 <note id="A_5" location="1537" soundLength="4"/>
 <note id="A_5" location="1545" soundLength="4"/>
 <note id="G_5" location="1553" soundLength="4"/>
 <note id="E_5" location="1561" soundLength="4"/>
 <note id="D_5" location="1569" soundLength="12"/>			</sequance>
<sequance id="99">
	
	
	<subSequance id="10" location="64" />
</sequance>

</sequances>
</bottles>
		
	}
}