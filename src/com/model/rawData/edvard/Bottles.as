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
<components notesGap="80" leftPad="139">
<bg image="bottles_frame.png" clickable="false"  y="10" />
	<bottle image="bottle_1_idle.png" playImage="bottle_1_SELECTED.png" x='50' y='0' >
		<tap noteId="A_2" />
	</bottle>
	<bottle image="bottle_2_idle.png" playImage="bottle_2_SELECTED.png" x='130' y='0' >
		<tap noteId="Bbemol_2" />
	</bottle>
	<bottle image="bottle_3_idle.png" playImage="bottle_3_SELECTED.png" x='210' y='0' >
		<tap noteId="C_3" />
	</bottle>
	<bottle image="bottle_4_idle.png" playImage="bottle_4_SELECTED.png" x='290' y='0' >
		<tap noteId="D_3" />
	</bottle>
	<bottle image="bottle_5_idle.png" playImage="bottle_5_SELECTED.png" x='370' y='0' >
		<tap noteId="D#_3" />
	</bottle>
	<bottle image="bottle_6_idle.png" playImage="bottle_6_SELECTED.png" x='450' y='0' >
		<tap noteId="E_3" />
	</bottle>
	<bottle image="bottle_7_idle.png" playImage="bottle_7_SELECTED.png" x='530' y='0'>
		<tap noteId="G_3" />
	</bottle>
	<bottle image="bottle_8_idle.png" playImage="bottle_8_SELECTED.png" x='610' y='0' >
		<tap noteId="A_3" />
	</bottle>
	<bottle image="bottle_9_idle.png" playImage="bottle_9_SELECTED.png" x='690' y='0' >
		<tap noteId="C_4" />
	</bottle>

<bottle image="bottle_1_idle.png" playImage="bottle_1_SELECTED.png" x='50' y='-22' octave="2">
	<tap noteId="A_2R" />
</bottle>
<bottle image="bottle_2_idle.png" playImage="bottle_2_SELECTED.png" x='130' y='-22' octave="2">
	<tap noteId="E_3R" />
</bottle>
<bottle image="bottle_3_idle.png" playImage="bottle_3_SELECTED.png" x='210' y='-22' octave="2" >
	<tap noteId="F_3" />
</bottle>
<bottle image="bottle_4_idle.png" playImage="bottle_4_SELECTED.png" x='290' y='-22' octave="2">
	<tap noteId="F#_3" />
</bottle>
<bottle image="bottle_5_idle.png" playImage="bottle_5_SELECTED.png" x='370' y='-22' octave="2">
	<tap noteId="G_3R" />
</bottle>
<bottle image="bottle_6_idle.png" playImage="bottle_6_SELECTED.png" x='450' y='-22' octave="2">
	<tap noteId="G#_4" />
</bottle>
<bottle image="bottle_7_idle.png" playImage="bottle_7_SELECTED.png" x='530' y='-22' octave="2">
	<tap noteId="A_4" />
</bottle>
<bottle image="bottle_8_idle.png" playImage="bottle_8_SELECTED.png" x='610' y='-22' octave="2">
	<tap noteId="B_4" />
</bottle>
<bottle image="bottle_9_idle.png" playImage="bottle_9_SELECTED.png" x='690' y='-22' octave="2">
	<tap noteId="C_4" />
</bottle>
</components>

<studio>


</studio>
<notes>

			<note id="A_2"  soundFile="mountain/xilofon/la_down.mp3" animationIndex='1'  value="1"  />
			<note id="Bbemol_2"  soundFile="mountain/xilofon/ci_down.mp3" animationIndex='2'  value="2"/>
			<note id="C_3"  soundFile="mountain/xilofon/do.mp3" animationIndex='3'  value="3"/>
			<note id="D_3" soundFile="mountain/xilofon/re.mp3" animationIndex='4' value="4" />
			<note id="D#_3" soundFile="mountain/xilofon/re_diez.mp3" animationIndex='9' value="5" />
			<note id="E_3" soundFile="mountain/xilofon/mi.mp3" animationIndex='8' value="6" />
			<note id="G_3"  soundFile="mountain/xilofon/sol.mp3" animationIndex='7'  value="7"  />
			<note id="A_3"  soundFile="mountain/xilofon/la.mp3" animationIndex='6'  value="8"/>	
			<!--<note id="A#_2"  soundFile="mountain/xilofon/la_diez_down.mp3" animationIndex='2'  value="2"/>-->
	
	<note id="A_2R" soundFile="mountain/xilofon/la_down.mp3" animationIndex='1' value="1" />
	<note id="E_3R" soundFile="mountain/xilofon/mi.mp3" animationIndex='2' value="2" />
	<note id="F_3" soundFile="mountain/xilofon/fa.mp3" animationIndex='3' value="3" />
	<note id="F#_3"  soundFile="mountain/xilofon/fa_diez.mp3" animationIndex='4' value="4"   />
	<note id="G_3R"  soundFile="mountain/xilofon/sol.mp3" animationIndex='9' value="5"   />
	<note id="G#_4"  soundFile="mountain/xilofon/sol_diez_up.mp3" animationIndex='8'  value="6"/>
	<note id="A_4"  soundFile="mountain/xilofon/la.mp3" animationIndex='7'  value="7"/>	
	<note id="B_4"  soundFile="mountain/xilofon/ci.mp3" animationIndex='6'  value="8"/>
	<note id="C_4" soundFile="mountain/xilofon/do_up.mp3" animationIndex='5' value="9" />
	<note id="octave+"  x="953" value="20"  />
</notes>
<sequances>
<sequance id="10">

		
		 <note id="A_2" location="129" soundLength="4"/>
		 <note id="Bbemol_2" location="137" soundLength="4"/>
		 <note id="C_3" location="145" soundLength="4"/>
		 <note id="D_3" location="153" soundLength="4"/>
		 <note id="E_3" location="161" soundLength="4"/>
		 <note id="C_3" location="169" soundLength="4"/>
		 <note id="E_3" location="177" soundLength="8"/>
		 <note id="D#_3" location="193" soundLength="4"/>
		 <note id="Bbemol_2" location="201" soundLength="4"/>
		 <note id="D#_3" location="209" soundLength="8"/>
		 <note id="D_3" location="225" soundLength="4"/>
		 <note id="Bbemol_2" location="233" soundLength="4"/>
		 <note id="D_3" location="241" soundLength="8"/>
		 <note id="A_2" location="257" soundLength="4"/>
		 <note id="Bbemol_2" location="265" soundLength="4"/>
		 <note id="C_3" location="273" soundLength="4"/>
		 <note id="D_3" location="281" soundLength="4"/>
		 <note id="E_3" location="289" soundLength="4"/>
		 <note id="C_3" location="297" soundLength="4"/>
		 <note id="E_3" location="305" soundLength="4"/>
		 <note id="A_3" location="313" soundLength="4"/>
		 <note id="G_3" location="321" soundLength="4"/>
		 <note id="E_3" location="329" soundLength="4"/>
		 <note id="C_3" location="337" soundLength="4"/>
		 <note id="E_3" location="345" soundLength="4"/>
		 <note id="G_3" location="353" soundLength="24"/>
		
		 <note id="A_2" location="385" soundLength="4"/>
		 <note id="Bbemol_2" location="393" soundLength="4"/>
		 <note id="C_3" location="401" soundLength="4"/>
		 <note id="D_3" location="409" soundLength="4"/>
		 <note id="E_3" location="417" soundLength="4"/>
		 <note id="C_3" location="425" soundLength="4"/>
		 <note id="E_3" location="433" soundLength="8"/>
		 <note id="D#_3" location="449" soundLength="4"/>
		 <note id="Bbemol_2" location="457" soundLength="4"/>
		 <note id="D#_3" location="465" soundLength="8"/>
		 <note id="D_3" location="481" soundLength="4"/>
		 <note id="Bbemol_2" location="489" soundLength="4"/>
		 <note id="D_3" location="497" soundLength="8"/>
		 <note id="A_2" location="513" soundLength="4"/>
		 <note id="Bbemol_2" location="521" soundLength="4"/>
		 <note id="C_3" location="529" soundLength="4"/>
		 <note id="D_3" location="537" soundLength="4"/>
		 <note id="E_3" location="545" soundLength="4"/>
		 <note id="C_3" location="553" soundLength="4"/>
		 <note id="E_3" location="561" soundLength="4"/>
		 <note id="A_3" location="569" soundLength="4"/>
		 <note id="G_3" location="577" soundLength="4"/>
		 <note id="E_3" location="585" soundLength="4"/>
		 <note id="C_3" location="593" soundLength="4"/>
		 <note id="E_3" location="601" soundLength="4"/>
		 <note id="G_3" location="609" soundLength="24"/>

<note id="octave+" location="625" soundLength="24" mandatory="true"/>
	<!-- OCATAVE -->
	
 <note id="E_3R" location="641" soundLength="4"/>
 <note id="F#_3" location="649" soundLength="4"/>
 <note id="G#_4" location="657" soundLength="4"/>
 <note id="A_4" location="665" soundLength="4"/>
 <note id="B_4" location="673" soundLength="4"/>
 <note id="G#_4" location="681" soundLength="4"/>
 <note id="B_4" location="689" soundLength="8"/>
 <note id="C_4" location="705" soundLength="4"/>
 <note id="G#_4" location="713" soundLength="4"/>
 <note id="C_4" location="721" soundLength="8"/>
 <note id="B_4" location="737" soundLength="4"/>
 <note id="G#_4" location="745" soundLength="4"/>
 <note id="B_4" location="753" soundLength="8"/>
 <note id="E_3R" location="769" soundLength="4"/>
 <note id="F#_3" location="777" soundLength="4"/>
 <note id="G#_4" location="785" soundLength="4"/>
 <note id="A_4" location="793" soundLength="4"/>
 <note id="B_4" location="801" soundLength="4"/>
 <note id="G#_4" location="809" soundLength="4"/>
 <note id="B_4" location="817" soundLength="8"/>
 <note id="C_4" location="833" soundLength="4"/>
 <note id="G#_4" location="841" soundLength="4"/>
 <note id="C_4" location="849" soundLength="8"/>
 <note id="B_4" location="865" soundLength="16"/>
 <note id="E_3R" location="897" soundLength="4"/>
 <note id="F#_3" location="905" soundLength="4"/>
 <note id="G#_4" location="913" soundLength="4"/>
 <note id="A_4" location="921" soundLength="4"/>
 <note id="B_4" location="929" soundLength="4"/>
 <note id="G#_4" location="937" soundLength="4"/>
 <note id="B_4" location="945" soundLength="8"/>
 <note id="C_4" location="961" soundLength="4"/>
 <note id="G#_4" location="969" soundLength="4"/>
 <note id="C_4" location="977" soundLength="8"/>
 <note id="B_4" location="993" soundLength="4"/>
 <note id="G#_4" location="1001" soundLength="4"/>
 <note id="B_4" location="1009" soundLength="8"/>
 <note id="E_3R" location="1025" soundLength="4"/>
 <note id="F#_3" location="1033" soundLength="4"/>
 <note id="G#_4" location="1041" soundLength="4"/>
 <note id="A_4" location="1049" soundLength="4"/>
 <note id="B_4" location="1057" soundLength="4"/>
 <note id="G#_4" location="1065" soundLength="4"/>
 <note id="B_4" location="1073" soundLength="8"/>
 <note id="C_4" location="1089" soundLength="4"/>
 <note id="G#_4" location="1097" soundLength="4"/>
 <note id="C_4" location="1105" soundLength="8"/>
 <note id="B_4" location="1121" soundLength="16"/>
 <note id="F#_3" location="1169" soundLength="4"/>
 <note id="F_3" location="1173" soundLength="4"/>
 <note id="F#_3" location="1177" soundLength="4"/>
 <note id="F#_3" location="1201" soundLength="4"/>
 <note id="F_3" location="1205" soundLength="4"/>
 <note id="F#_3" location="1209" soundLength="4"/>
 <note id="F#_3" location="1233" soundLength="4"/>
 <note id="F_3" location="1237" soundLength="4"/>
 <note id="F#_3" location="1241" soundLength="4"/>
 <note id="G_3R" location="1265" soundLength="4"/>
 <note id="F#_3" location="1269" soundLength="4"/>
 <note id="G_3R" location="1273" soundLength="4"/>
 <note id="A_2R" location="1281" soundLength="4"/>
</sequance>

	
<sequance id="99">
<subSequance id="10" location="64" />
</sequance>
</sequances>
</bottles>
		
	}
}