package com.model.rawData.edvard
{
	public class Bottles
	{
public static var data:XML = <bottles type="bottles" thumbNail='bottles.png' spriteSheet='bottlesSheet.png' >
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
<!--<bottle image="bottle_1_idle.png" playImage="bottle_1_SELECTED.png" x='50' y='0' >
	<tap noteId="G_2" />
</bottle>-->
<bottle image="bottle_1_idle.png" playImage="bottle_1_SELECTED.png" x='50' y='0' >
	<tap noteId="A_2" />
</bottle>
<bottle image="bottle_2_idle.png" playImage="bottle_2_SELECTED.png" x='130' y='0' >
	<tap noteId="A#_2" />
</bottle>
<bottle image="bottle_3_idle.png" playImage="bottle_3_SELECTED.png" x='210' y='0' >
	<tap noteId="B_2" />
</bottle>
<bottle image="bottle_4_idle.png" playImage="bottle_4_SELECTED.png" x='290' y='0' >
	<tap noteId="C_3" />
</bottle>
<bottle image="bottle_5_idle.png" playImage="bottle_5_SELECTED.png" x='370' y='0' >
	<tap noteId="D_3" />
</bottle>
<bottle image="bottle_6_idle.png" playImage="bottle_6_SELECTED.png" x='450' y='0' >
	<tap noteId="D#_3" />
</bottle>
<bottle image="bottle_7_idle.png" playImage="bottle_7_SELECTED.png" x='530' y='0'>
	<tap noteId="E_3" />
</bottle>
<bottle image="bottle_8_idle.png" playImage="bottle_8_SELECTED.png" x='610' y='0' >
	<tap noteId="G_3" />
</bottle>
<bottle image="bottle_9_idle.png" playImage="bottle_9_SELECTED.png" x='690' y='0' >
	<tap noteId="A_3" />
</bottle>

<bottle image="bottle_1_idle.png" playImage="bottle_1_SELECTED.png" x='50' y='-22' octave="2" >
	<tap noteId="A_2b" />
</bottle>
<bottle image="bottle_2_idle.png" playImage="bottle_1_SELECTED.png" x='130' y='-22' octave="2">
	<tap noteId="E_3b" />
</bottle>	
<bottle image="bottle_3_idle.png" playImage="bottle_2_SELECTED.png" x='210' y='-22' octave="2" >
	<tap noteId="F_3" />
</bottle>
<bottle image="bottle_4_idle.png" playImage="bottle_3_SELECTED.png" x='290' y='-22' octave="2">
	<tap noteId="F#_3" />
</bottle>
<bottle image="bottle_5_idle.png" playImage="bottle_4_SELECTED.png" x='370' y='-22' octave="2">
	<tap noteId="G_3b" />
</bottle>
<bottle image="bottle_6_idle.png" playImage="bottle_5_SELECTED.png" x='450' y='-22' octave="2">
	<tap noteId="G#_3" />
</bottle>
<bottle image="bottle_7_idle.png" playImage="bottle_6_SELECTED.png" x='530' y='-22' octave="2">
	<tap noteId="A_3b" />
</bottle>
<bottle image="bottle_8_idle.png" playImage="bottle_7_SELECTED.png" x='610' y='-22' octave="2">
	<tap noteId="B_3" />
</bottle>
<bottle image="bottle_9_idle.png" playImage="bottle_8_SELECTED.png" x='690' y='-22' octave="2">
	<tap noteId="C_4" />
</bottle>
</components>

<studio>


</studio>
<notes>
	
	<!--<note unused="true" id="G_2"  soundFile="mountain/xilofon/sol_down.mp3" animationIndex='0' value="1"   />-->
	<note id="A_2"  soundFile="mountain/xilofon/la_down.mp3" animationIndex='1'  value="1"  />
	<note id="A#_2"  soundFile="mountain/xilofon/la_diez_down.mp3" animationIndex='2'  value="2"/>
	<note id="B_2"  soundFile="mountain/xilofon/ci_down.mp3" animationIndex='3'  value="3"/>
	<note id="C_3"  soundFile="mountain/xilofon/do.mp3" animationIndex='4'  value="4"/>
	<note id="D_3" soundFile="mountain/xilofon/re.mp3" animationIndex='9' value="5" />
	<note id="D#_3" soundFile="mountain/xilofon/re_diez.mp3" animationIndex='8' value="6" />
	<note id="E_3" soundFile="mountain/xilofon/mi.mp3" animationIndex='7' value="7" />
	<note id="G_3"  soundFile="mountain/xilofon/sol.mp3" animationIndex='6'  value="8"  />
	<note id="A_3"  soundFile="mountain/xilofon/la.mp3" animationIndex='5'  value="9"/>	

	<note id="A_2b"  soundFile="mountain/xilofon/la_down.mp3" animationIndex='1'  value="1"  />
	<note id="E_3b" soundFile="mountain/xilofon/mi.mp3" animationIndex='2' value="2" />
	<note id="F_3" soundFile="mountain/xilofon/fa.mp3" animationIndex='3' value="3" />
	<note id="F#_3"  soundFile="mountain/xilofon/fa_diez.mp3" animationIndex='4' value="4"   />
	<note id="G_3b"  soundFile="mountain/xilofon/sol.mp3" animationIndex='9' value="5"   />
	<note id="G#_3"  soundFile="mountain/xilofon/sol_diez_up.mp3" animationIndex='8'  value="6"/>
	<note id="A_3b"  soundFile="mountain/xilofon/la.mp3" animationIndex='7'  value="7"/>	
	<note id="B_3"  soundFile="mountain/xilofon/ci.mp3" animationIndex='6'  value="8"/>
	<note id="C_4" soundFile="mountain/xilofon/do_up.mp3" animationIndex='5' value="9" />
	
	<note id="octave+"  x="150" value="10"  />
</notes>
<sequances>
<sequance id="10">


 <note id="A_2" location="177" soundLength="4"/>
 <note id="B_2" location="185" soundLength="4"/>
 <note id="C_3" location="193" soundLength="4"/>
 <note id="D_3" location="201" soundLength="4"/>
 <note id="E_3" location="209" soundLength="4"/>
 <note id="C_3" location="217" soundLength="4"/>
 <note id="E_3" location="225" soundLength="8"/>
 <note id="D#_3" location="241" soundLength="4"/>
 <note id="B_2" location="249" soundLength="4"/>
 <note id="D#_3" location="257" soundLength="8"/>
 <note id="D_3" location="273" soundLength="4"/>
 <note id="A#_2" location="281" soundLength="4"/>
 <note id="D_3" location="289" soundLength="8"/>
 <note id="A_2" location="305" soundLength="4"/>
 <note id="B_2" location="313" soundLength="4"/>
 <note id="C_3" location="321" soundLength="4"/>
 <note id="D_3" location="329" soundLength="4"/>
 <note id="E_3" location="337" soundLength="4"/>
 <note id="C_3" location="345" soundLength="4"/>
 <note id="E_3" location="353" soundLength="4"/>
 <note id="A_3" location="361" soundLength="4"/>
 <note id="G_3" location="369" soundLength="4"/>
 <note id="E_3" location="377" soundLength="4"/>
 <note id="C_3" location="385" soundLength="4"/>
 <note id="E_3" location="393" soundLength="4"/>
 <note id="G_3" location="401" soundLength="24"/>
 <note id="A_2" location="429" soundLength="4"/>
 <note id="B_2" location="437" soundLength="4"/>
 <note id="C_3" location="445" soundLength="4"/>
 <note id="D_3" location="453" soundLength="4"/>
 <note id="E_3" location="461" soundLength="4"/>
 <note id="C_3" location="469" soundLength="4"/>
 <note id="E_3" location="477" soundLength="8"/>
 <note id="D#_3" location="493" soundLength="4"/>
 <note id="B_2" location="501" soundLength="4"/>
 <note id="D#_3" location="509" soundLength="8"/>
 <note id="D_3" location="525" soundLength="4"/>
 <note id="A#_2" location="533" soundLength="4"/>
 <note id="D_3" location="541" soundLength="8"/>
 <note id="A_2" location="557" soundLength="4"/>
 <note id="B_2" location="565" soundLength="4"/>
 <note id="C_3" location="573" soundLength="4"/>
 <note id="D_3" location="581" soundLength="4"/>
 <note id="E_3" location="589" soundLength="4"/>
 <note id="C_3" location="597" soundLength="4"/>
 <note id="E_3" location="605" soundLength="4"/>
 <note id="A_3" location="613" soundLength="4"/>
 <note id="G_3" location="621" soundLength="4"/>
 <note id="E_3" location="629" soundLength="4"/>
 <note id="C_3" location="637" soundLength="4"/>
 <note id="E_3" location="645" soundLength="4"/>
 <note id="G_3" location="653" soundLength="24"/>

<note id="octave+" location="677" />

 <note id="E_3b" location="681" soundLength="4"/>
 <note id="F#_3" location="689" soundLength="4"/>
 <note id="G#_3" location="697" soundLength="4"/>
 <note id="A_3b" location="705" soundLength="4"/>
 <note id="B_3" location="713" soundLength="4"/>
 <note id="G#_3" location="721" soundLength="4"/>
 <note id="B_3" location="729" soundLength="8"/>
 <note id="C_4" location="745" soundLength="4"/>
 <note id="G#_3" location="753" soundLength="4"/>
 <note id="C_4" location="761" soundLength="8"/>
 <note id="B_3" location="777" soundLength="4"/>
 <note id="G#_3" location="785" soundLength="4"/>
 <note id="B_3" location="793" soundLength="8"/>
 <note id="E_3b" location="809" soundLength="4"/>
 <note id="F#_3" location="817" soundLength="4"/>
 <note id="G#_3" location="825" soundLength="4"/>
 <note id="A_3b" location="833" soundLength="4"/>
 <note id="B_3" location="841" soundLength="4"/>
 <note id="G#_3" location="849" soundLength="4"/>
 <note id="B_3" location="857" soundLength="8"/>
 <note id="C_4" location="873" soundLength="4"/>
 <note id="G#_3" location="881" soundLength="4"/>
 <note id="C_4" location="889" soundLength="8"/>
 <note id="B_3" location="905" soundLength="16"/>
 <note id="E_3b" location="937" soundLength="4"/>
 <note id="F#_3" location="945" soundLength="4"/>
 <note id="G#_3" location="953" soundLength="4"/>
 <note id="A_3b" location="961" soundLength="4"/>
 <note id="B_3" location="969" soundLength="4"/>
 <note id="G#_3" location="977" soundLength="4"/>
 <note id="B_3" location="985" soundLength="8"/>
 <note id="C_4" location="1001" soundLength="4"/>
 <note id="G#_3" location="1009" soundLength="4"/>
 <note id="C_4" location="1017" soundLength="8"/>
 <note id="B_3" location="1033" soundLength="4"/>
 <note id="G#_3" location="1041" soundLength="4"/>
 <note id="B_3" location="1049" soundLength="8"/>
 <note id="E_3b" location="1065" soundLength="4"/>
 <note id="F#_3" location="1073" soundLength="4"/>
 <note id="G#_3" location="1081" soundLength="4"/>
 <note id="A_3b" location="1089" soundLength="4"/>
 <note id="B_3" location="1097" soundLength="4"/>
 <note id="G#_3" location="1105" soundLength="4"/>
 <note id="B_3" location="1113" soundLength="8"/>
 <note id="C_4" location="1129" soundLength="4"/>
 <note id="G#_3" location="1137" soundLength="4"/>
 <note id="C_4" location="1145" soundLength="8"/>
 <note id="B_3" location="1161" soundLength="16"/>
 <note id="F#_3" location="1209" soundLength="4"/>
 <note id="F#_3" location="1213" soundLength="4"/>
 <note id="F_3" location="1217" soundLength="4"/>
 <note id="F_3" location="1221" soundLength="4"/>
 <note id="F#_3" location="1225" soundLength="4"/>
 <note id="F#_3" location="1229" soundLength="4"/>
 <note id="F#_3" location="1253" soundLength="4"/>
 <note id="F#_3" location="1257" soundLength="4"/>
 <note id="F_3" location="1261" soundLength="4"/>
 <note id="F_3" location="1265" soundLength="4"/>
 <note id="F#_3" location="1269" soundLength="4"/>
 <note id="F#_3" location="1273" soundLength="4"/>
 <note id="F#_3" location="1297" soundLength="4"/>
 <note id="F#_3" location="1301" soundLength="4"/>
 <note id="F_3" location="1305" soundLength="4"/>
 <note id="F_3" location="1309" soundLength="4"/>
 <note id="F#_3" location="1313" soundLength="4"/>
 <note id="F#_3" location="1317" soundLength="4"/>
 <note id="G_3b" location="1341" soundLength="4"/>
 <note id="G_3b" location="1345" soundLength="4"/>
 <note id="F#_3" location="1349" soundLength="4"/>
 <note id="F#_3" location="1353" soundLength="4"/>
 <note id="G_3b" location="1357" soundLength="4"/>
 <note id="G_3b" location="1361" soundLength="4"/>
 <note id="A_2b" location="1369" soundLength="4"/>
</sequance>

	
<sequance id="99">
<subSequance id="10" location="80" />
</sequance>
</sequances>
</bottles>
		
	}
}