package com.model.rawData.motzart
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
		<components notesGap="80" leftPad="100">
		<bg image="bottles_frame_lg.png" clickable="false"  y="10" />
		<bottle image="bottle_1_idle.png" playImage="bottle_1_SELECTED.png" x='60' y='0' >
			<tap noteId="C_5" />
		</bottle>
		<bottle image="bottle_2_idle.png" playImage="bottle_2_SELECTED.png" x='140' y='0' >
			<tap noteId="D_5" />
		</bottle>
		<bottle image="bottle_3_idle.png" playImage="bottle_3_SELECTED.png" x='220' y='0' >
			<tap noteId="D#_5" />
		</bottle>
		<bottle image="bottle_4_idle.png" playImage="bottle_4_SELECTED.png" x='300' y='0' >
			<tap noteId="E_5" />
		</bottle>
		<bottle image="bottle_5_idle.png" playImage="bottle_5_SELECTED.png" x='380' y='0' >
			<tap noteId="F_5" />
		</bottle>
		<bottle image="bottle_6_idle.png" playImage="bottle_6_SELECTED.png" x='460' y='0' >
			<tap noteId="G_5" />
		</bottle>
		<bottle image="bottle_7_idle.png" playImage="bottle_7_SELECTED.png" x='540' y='0' >
			<tap noteId="G#_5" />
		</bottle>
		<bottle image="bottle_8_idle.png" playImage="bottle_8_SELECTED.png" x='620' y='0' >
			<tap noteId="A_5" />
		</bottle>
		<bottle image="bottle_9_idle.png" playImage="bottle_9_SELECTED.png" x='700' y='0' >
			<tap noteId="B_5" />
		</bottle>
		<bottle image="bottle_10_idle.png" playImage="bottle_10_SELECTED.png" x='780' y='0' >
			<tap noteId="C_6" />
		</bottle>
		<bottle image="bottle_11_idle.png" playImage="bottle_11_SELECTED.png" x='850' y='0' >
			<tap noteId="D_6" />
		</bottle>
			
		</components>
		
		<studio>
		
		
		</studio>
		<octaves>
		<notes>
			<note id="C_5"  soundFile="mozart/xilofon/do.mp3" animationIndex='1' value="1"   />
			<note id="D_5"  soundFile="mozart/xilofon/re.mp3" animationIndex='2' value="2"   />
			<note id="D#_5"  soundFile="mozart/xilofon/re_diez.mp3" animationIndex='3' value="3"   />
			<note id="E_5"  soundFile="mozart/xilofon/mi.mp3" animationIndex='3' value="4"   />
			<note id="F_5"  soundFile="mozart/xilofon/fa.mp3" animationIndex='4'  value="5"  />
			<note id="G_5"  soundFile="mozart/xilofon/sol.mp3" animationIndex='2'  value="6"  />
			<note id="G#_5"  soundFile="mozart/xilofon/sol_diez.mp3" animationIndex='3'  value="7"/>
			<note id="A_5"  soundFile="mozart/xilofon/la.mp3" animationIndex='4'  value="8"/>
			<note id="B_5"  soundFile="mozart/xilofon/ci.mp3" animationIndex='9'  value="9"/>
			<note id="C_6" soundFile="mozart/xilofon/do_up.mp3" animationIndex='8' value="10" />
			<note id="D_6" soundFile="mozart/xilofon/re_up.mp3" animationIndex='7' value="11" />
			
		</notes>
		</octaves>
		<sequances>
		<sequance id="10">

 <note id="F_5" location="177" soundLength="8"/>
 <note id="E_5" location="185" soundLength="8"/>
 <note id="E_5" location="193" soundLength="16"/>
 <note id="F_5" location="209" soundLength="8"/>
 <note id="E_5" location="217" soundLength="8"/>
 <note id="E_5" location="225" soundLength="16"/>
 <note id="F_5" location="241" soundLength="8"/>
 <note id="E_5" location="249" soundLength="8"/>
 <note id="E_5" location="257" soundLength="16"/>
 <note id="C_6" location="273" soundLength="32"/>
 <note id="C_6" location="305" soundLength="8"/>
 <note id="B_5" location="313" soundLength="8"/>
 <note id="A_5" location="321" soundLength="16"/>
 <note id="A_5" location="337" soundLength="8"/>
 <note id="G_5" location="345" soundLength="8"/>
 <note id="F_5" location="353" soundLength="16"/>
 <note id="F_5" location="369" soundLength="8"/>
 <note id="E_5" location="377" soundLength="8"/>
 <note id="D_5" location="385" soundLength="16"/>
 <note id="D_5" location="401" soundLength="32"/>
 <note id="E_5" location="433" soundLength="8"/>
 <note id="D_5" location="441" soundLength="8"/>
 <note id="D_5" location="449" soundLength="16"/>
 <note id="E_5" location="465" soundLength="8"/>
 <note id="D_5" location="473" soundLength="8"/>
 <note id="D_5" location="481" soundLength="16"/>
 <note id="E_5" location="497" soundLength="8"/>
 <note id="D_5" location="505" soundLength="8"/>
 <note id="D_5" location="513" soundLength="16"/>
 <note id="B_5" location="529" soundLength="32"/>
 <note id="B_5" location="561" soundLength="8"/>
 <note id="A_5" location="569" soundLength="8"/>
 <note id="G#_5" location="577" soundLength="16"/>
 <note id="G#_5" location="593" soundLength="8"/>
 <note id="F_5" location="601" soundLength="8"/>
 <note id="E_5" location="609" soundLength="16"/>
 <note id="E_5" location="625" soundLength="8"/>
 <note id="D_5" location="633" soundLength="8"/>
 <note id="C_5" location="641" soundLength="48"/>
 <note id="C_6" location="689" soundLength="8"/>
 <note id="B_5" location="697" soundLength="8"/>
 <note id="B_5" location="705" soundLength="16"/>
 <note id="D_6" location="721" soundLength="16"/>
 <note id="G#_5" location="737" soundLength="16"/>
 <note id="B_5" location="753" soundLength="16"/>
 <note id="A_5" location="769" soundLength="16"/>
 <note id="E_5" location="785" soundLength="32"/>
 <note id="C_6" location="817" soundLength="8"/>
 <note id="B_5" location="825" soundLength="8"/>
 <note id="B_5" location="833" soundLength="16"/>
 <note id="D_6" location="849" soundLength="16"/>
 <note id="G#_5" location="865" soundLength="16"/>
 <note id="B_5" location="881" soundLength="16"/>
 <note id="A_5" location="897" soundLength="16"/>
 <note id="C_6" location="913" soundLength="16"/>
 <note id="B_5" location="929" soundLength="8"/>
 <note id="A_5" location="937" soundLength="8"/>
 <note id="G_5" location="945" soundLength="8"/>
 <note id="F_5" location="953" soundLength="8"/>
 <note id="E_5" location="961" soundLength="64"/>
 <note id="D#_5" location="1025" soundLength="64"/>
 <note id="E_5" location="1089" soundLength="16"/>
 <note id="A_5" location="1105" soundLength="16"/>
 <note id="E_5" location="1121" soundLength="16"/>
 <note id="A_5" location="1137" soundLength="8"/>
 <note id="E_5" location="1145" soundLength="8"/>
 <note id="A_5" location="1153" soundLength="64"/>
		</sequance>
		
			
		<sequance id="99">
		<subSequance id="10" location="64" />
		</sequance>
		</sequances>
		</bottles>
		
	}
}