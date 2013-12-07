package com.model.rawData.edvard
{
public class Drum
{
public static var data:XML = 
<drum type="drums" thumbNail='drum.png' spriteSheet="drumsSheet.png">
<eyes swfSheet="drumsEyes.png" x="0" y="0" width="410" height="350" >
	<blink start="0" end="4" />
	<blink start="4" end="8" />
	<blink start="9" end="15" />
	<blink start="15" end="16" />
</eyes>		
	
<components notesGap="140" leftPad="280">

<drum type="snare" image="DRUMS_1_IDLE.png" playImage="DRUMS_1_PRESSED.png" x='0' y='0'>
<tap noteId="C_5" />
</drum>
<drum type="bass" image="DRUMS_2_IDLE.png" playImage="DRUMS_2_PRESSED.png"  x='140' y='0'>
<tap noteId="B_4" />
</drum>
<drum type="crash" image="DRUMS_3_IDLE.png" playImage="DRUMS_3_PRESSED.png"  x='280' y='0'>
<tap noteId="E_5" />
</drum>
<drum type="tom" image="DRUMS_4_IDLE.png" playImage="DRUMS_4_PRESSED.png"  x='420' y='0'>
<tap noteId="D_5" />
</drum>

</components>
<notes>
	<note id="B_4" value="2"  soundFile="mountain/drums/b3.mp3" animationIndex='4'    />
	<note id="D_5" value="4" soundFile="mountain/drums/unused/clave/c4.mp3" animationIndex='1'  />
	<note id="C_5" value="1" soundFile="mountain/drums/c4.mp3" animationIndex='5' />
	<note id="E_5" value="3" soundFile="mountain/drums/e4.mp3" animationIndex='2' />
</notes>
<sequances>

	<!--SUBSEQUANCES-->

<!--SEQUANCES-->

<sequance id="10">

 <note id="B_4" location="1" soundLength="1"/>
 <note id="D_5" location="9" soundLength="1"/>
 <note id="C_5" location="17" soundLength="1"/>
 <note id="D_5" location="25" soundLength="1"/>
 <note id="B_4" location="33" soundLength="1"/>
 <note id="D_5" location="41" soundLength="1"/>
 <note id="C_5" location="49" soundLength="1"/>
 <note id="D_5" location="57" soundLength="1"/>
 <note id="B_4" location="65" soundLength="1"/>
 <note id="D_5" location="73" soundLength="1"/>
 <note id="C_5" location="81" soundLength="1"/>
 <note id="D_5" location="89" soundLength="1"/>
 <note id="B_4" location="97" soundLength="1"/>
 <note id="D_5" location="105" soundLength="1"/>
 <note id="C_5" location="113" soundLength="1"/>
 <note id="D_5" location="121" soundLength="1"/>
 <note id="B_4" location="129" soundLength="1"/>
 <note id="D_5" location="137" soundLength="1"/>
 <note id="C_5" location="145" soundLength="1"/>
 <note id="D_5" location="153" soundLength="1"/>
 <note id="B_4" location="161" soundLength="1"/>
 <note id="D_5" location="169" soundLength="1"/>
 <note id="C_5" location="177" soundLength="1"/>
 <note id="D_5" location="185" soundLength="1"/>
 <note id="B_4" location="193" soundLength="1"/>
 <note id="D_5" location="201" soundLength="1"/>
 <note id="C_5" location="209" soundLength="1"/>
 <note id="D_5" location="217" soundLength="1"/>
 <note id="B_4" location="225" soundLength="1"/>
 <note id="D_5" location="233" soundLength="1"/>
 <note id="C_5" location="241" soundLength="1"/>
 <note id="D_5" location="249" soundLength="1"/>
 <note id="B_4" location="257" soundLength="1"/>
 <note id="D_5" location="265" soundLength="1"/>
 <note id="C_5" location="273" soundLength="1"/>
 <note id="B_4" location="281" soundLength="1"/>
 <note id="B_4" location="289" soundLength="1"/>
 <note id="D_5" location="297" soundLength="1"/>
 <note id="C_5" location="305" soundLength="1"/>
 <note id="D_5" location="313" soundLength="1"/>
 <note id="B_4" location="321" soundLength="1"/>
 <note id="D_5" location="329" soundLength="1"/>
 <note id="C_5" location="337" soundLength="1"/>
 <note id="D_5" location="345" soundLength="1"/>
 <note id="B_4" location="353" soundLength="1"/>
 <note id="D_5" location="361" soundLength="1"/>
 <note id="D_5" location="365" soundLength="1"/>
 <note id="B_4" location="385" soundLength="1"/>
 <note id="D_5" location="393" soundLength="1"/>
 <note id="C_5" location="401" soundLength="1"/>
 <note id="D_5" location="409" soundLength="1"/>
 <note id="B_4" location="417" soundLength="1"/>
 <note id="D_5" location="425" soundLength="1"/>
 <note id="C_5" location="433" soundLength="1"/>
 <note id="D_5" location="441" soundLength="1"/>
 <note id="B_4" location="449" soundLength="1"/>
 <note id="D_5" location="457" soundLength="1"/>
 <note id="C_5" location="465" soundLength="1"/>
 <note id="D_5" location="473" soundLength="1"/>
 <note id="B_4" location="481" soundLength="1"/>
 <note id="D_5" location="489" soundLength="1"/>
 <note id="B_4" location="493" soundLength="1"/>
 <note id="C_5" location="497" soundLength="1"/>
 <note id="B_4" location="505" soundLength="1"/>
 <note id="B_4" location="513" soundLength="1"/>
 <note id="D_5" location="521" soundLength="1"/>
 <note id="C_5" location="529" soundLength="1"/>
 <note id="B_4" location="545" soundLength="1"/>
 <note id="C_5" location="561" soundLength="1"/>
 <note id="D_5" location="569" soundLength="1"/>
 <note id="B_4" location="577" soundLength="1"/>
 <note id="D_5" location="585" soundLength="1"/>
 <note id="C_5" location="593" soundLength="1"/>
 <note id="B_4" location="609" soundLength="1"/>
 <note id="D_5" location="617" soundLength="1"/>
 <note id="D_5" location="633" soundLength="1"/>
 <note id="E_5" location="637" soundLength="1"/>
 <note id="B_4" location="641" soundLength="1"/>
 <note id="D_5" location="649" soundLength="1"/>
 <note id="C_5" location="657" soundLength="1"/>
 <note id="D_5" location="665" soundLength="1"/>
 <note id="B_4" location="673" soundLength="1"/>
 <note id="D_5" location="681" soundLength="1"/>
 <note id="C_5" location="689" soundLength="1"/>
 <note id="D_5" location="697" soundLength="1"/>
 <note id="B_4" location="705" soundLength="1"/>
 <note id="D_5" location="713" soundLength="1"/>
 <note id="C_5" location="721" soundLength="1"/>
 <note id="D_5" location="729" soundLength="1"/>
 <note id="B_4" location="737" soundLength="1"/>
 <note id="D_5" location="745" soundLength="1"/>
 <note id="C_5" location="753" soundLength="1"/>
 <note id="D_5" location="761" soundLength="1"/>
 <note id="B_4" location="769" soundLength="1"/>
 <note id="D_5" location="777" soundLength="1"/>
 <note id="C_5" location="785" soundLength="1"/>
 <note id="B_4" location="793" soundLength="1"/>
 <note id="B_4" location="801" soundLength="1"/>
 <note id="D_5" location="809" soundLength="1"/>
 <note id="C_5" location="817" soundLength="1"/>
 <note id="D_5" location="825" soundLength="1"/>
 <note id="B_4" location="833" soundLength="1"/>
 <note id="D_5" location="841" soundLength="1"/>
 <note id="C_5" location="849" soundLength="1"/>
 <note id="D_5" location="857" soundLength="1"/>
 <note id="B_4" location="865" soundLength="1"/>
 <note id="D_5" location="873" soundLength="1"/>
 <note id="D_5" location="881" soundLength="1"/>
 <note id="B_4" location="897" soundLength="1"/>
 <note id="D_5" location="905" soundLength="1"/>
 <note id="C_5" location="913" soundLength="1"/>
 <note id="D_5" location="921" soundLength="1"/>
 <note id="B_4" location="929" soundLength="1"/>
 <note id="D_5" location="937" soundLength="1"/>
 <note id="C_5" location="945" soundLength="1"/>
 <note id="D_5" location="953" soundLength="1"/>
 <note id="B_4" location="961" soundLength="1"/>
 <note id="D_5" location="969" soundLength="1"/>
 <note id="C_5" location="977" soundLength="1"/>
 <note id="D_5" location="985" soundLength="1"/>
 <note id="B_4" location="993" soundLength="1"/>
 <note id="D_5" location="1001" soundLength="1"/>
 <note id="B_4" location="1005" soundLength="1"/>
 <note id="C_5" location="1009" soundLength="1"/>
 <note id="B_4" location="1017" soundLength="1"/>
 <note id="B_4" location="1025" soundLength="1"/>
 <note id="D_5" location="1033" soundLength="1"/>
 <note id="D_5" location="1049" soundLength="1"/>
 <note id="B_4" location="1057" soundLength="1"/>
 <note id="D_5" location="1065" soundLength="1"/>
 <note id="C_5" location="1073" soundLength="1"/>
 <note id="D_5" location="1081" soundLength="1"/>
 <note id="B_4" location="1089" soundLength="1"/>
 <note id="D_5" location="1097" soundLength="1"/>
 <note id="C_5" location="1105" soundLength="1"/>
 <note id="D_5" location="1113" soundLength="1"/>
 <note id="B_4" location="1121" soundLength="1"/>
 <note id="D_5" location="1129" soundLength="1"/>
 <note id="D_5" location="1133" soundLength="1"/>
 <note id="D_5" location="1145" soundLength="1"/>
 <note id="E_5" location="1149" soundLength="1"/>
 <note id="B_4" location="1153" soundLength="1"/>
 <note id="D_5" location="1161" soundLength="1"/>
 <note id="C_5" location="1169" soundLength="1"/>
 <note id="D_5" location="1177" soundLength="1"/>
 <note id="D_5" location="1181" soundLength="1"/>
 <note id="B_4" location="1185" soundLength="1"/>
 <note id="D_5" location="1193" soundLength="1"/>
 <note id="C_5" location="1201" soundLength="1"/>
 <note id="D_5" location="1209" soundLength="1"/>
 <note id="B_4" location="1217" soundLength="1"/>
 <note id="D_5" location="1225" soundLength="1"/>
 <note id="C_5" location="1233" soundLength="1"/>
 <note id="D_5" location="1241" soundLength="1"/>
 <note id="B_4" location="1249" soundLength="1"/>
 <note id="D_5" location="1257" soundLength="1"/>
 <note id="C_5" location="1265" soundLength="1"/>
 <note id="D_5" location="1273" soundLength="1"/>
</sequance>
<sequance id="99">
<subSequance id="10" location="64" />

</sequance>
</sequances>
<gestures>
	<gesture name='swipe' sequanceId='1' />
</gestures>
</drum>
		public function Drum()
		{
		}
	}
}