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
		<components notesGap="80" leftPad="184">
		<bg image="bottles_frame.png" clickable="false"  y="10" />
		<bottle image="bottle_1_idle.png" playImage="bottle_1_SELECTED.png" x='-50' y='0' >
			<tap noteId="C_5" />
		</bottle>
		<bottle image="bottle_2_idle.png" playImage="bottle_2_SELECTED.png" x='30' y='0' >
			<tap noteId="D_5" />
		</bottle>
		<bottle image="bottle_3_idle.png" playImage="bottle_3_SELECTED.png" x='110' y='0' >
			<tap noteId="D#_5" />
		</bottle>
		<bottle image="bottle_4_idle.png" playImage="bottle_3_SELECTED.png" x='190' y='0' >
			<tap noteId="E_5" />
		</bottle>
		<bottle image="bottle_5_idle.png" playImage="bottle_4_SELECTED.png" x='270' y='0' >
			<tap noteId="F_5" />
		</bottle>
		<bottle image="bottle_6_idle.png" playImage="bottle_4_SELECTED.png" x='350' y='0' >
			<tap noteId="G_5" />
		</bottle>
		<bottle image="bottle_7_idle.png" playImage="bottle_5_SELECTED.png" x='430' y='0' >
			<tap noteId="G#_5" />
		</bottle>
		<bottle image="bottle_8_idle.png" playImage="bottle_6_SELECTED.png" x='510' y='0' >
			<tap noteId="A_5" />
		</bottle>
		<bottle image="bottle_9_idle.png" playImage="bottle_7_SELECTED.png" x='590' y='0' >
			<tap noteId="B_5" />
		</bottle>
		<bottle image="bottle_9_idle.png" playImage="bottle_8_SELECTED.png" x='670' y='0' >
			<tap noteId="C_6" />
		</bottle>
		<bottle image="bottle_9_idle.png" playImage="bottle_9_SELECTED.png" x='750' y='0' >
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
			<note id="C_6" soundFile="mozart/xilofon/do_up.mp3" animationIndex='8' value="1" />
			<note id="D_6" soundFile="mozart/xilofon/re_up.mp3" animationIndex='7' value="1" />
			
		</notes>
		</octaves>
		<sequances>
		<sequance id="10">
<note id="F_5" location="177" soundLength="8"/>
 <note id="E_5" location="185" soundLength="8"/>
 <note id="E_5" location="193" soundLength="8"/>
 <note id="F_5" location="205" soundLength="8"/>
 <note id="E_5" location="213" soundLength="8"/>
 <note id="E_5" location="221" soundLength="8"/>
 <note id="F_5" location="233" soundLength="8"/>
 <note id="E_5" location="241" soundLength="8"/>
 <note id="E_5" location="249" soundLength="16"/>
 <note id="C_6" location="265" soundLength="8"/>
 <note id="C_6" location="293" soundLength="8"/>
 <note id="B_5" location="301" soundLength="8"/>
 <note id="A_5" location="309" soundLength="8"/>
 <note id="A_5" location="321" soundLength="8"/>
 <note id="G_5" location="329" soundLength="8"/>
 <note id="F_5" location="337" soundLength="8"/>
 <note id="F_5" location="349" soundLength="8"/>
 <note id="E_5" location="357" soundLength="8"/>
 <note id="D_5" location="365" soundLength="8"/>
 <note id="D_5" location="377" soundLength="8"/>
 <note id="E_5" location="405" soundLength="8"/>
 <note id="D_5" location="413" soundLength="8"/>
 <note id="D_5" location="421" soundLength="8"/>
 <note id="E_5" location="433" soundLength="8"/>
 <note id="D_5" location="441" soundLength="8"/>
 <note id="D_5" location="449" soundLength="8"/>
 <note id="E_5" location="461" soundLength="8"/>
 <note id="D_5" location="469" soundLength="8"/>
 <note id="D_5" location="477" soundLength="16"/>
 <note id="B_5" location="493" soundLength="8"/>
 <note id="B_5" location="521" soundLength="8"/>
 <note id="A_5" location="529" soundLength="8"/>
 <note id="G#_5" location="537" soundLength="8"/>
 <note id="G#_5" location="549" soundLength="8"/>
 <note id="F_5" location="557" soundLength="8"/>
 <note id="E_5" location="565" soundLength="8"/>
 <note id="E_5" location="577" soundLength="8"/>
 <note id="D_5" location="585" soundLength="8"/>
 <note id="C_5" location="593" soundLength="8"/>
 <note id="C_6" location="637" soundLength="8"/>
 <note id="B_5" location="645" soundLength="8"/>
 <note id="B_5" location="653" soundLength="16"/>
 <note id="D_6" location="669" soundLength="16"/>
 <note id="G#_5" location="685" soundLength="16"/>
 <note id="B_5" location="701" soundLength="16"/>
 <note id="A_5" location="717" soundLength="16"/>
 <note id="E_5" location="733" soundLength="8"/>
 <note id="C_6" location="761" soundLength="8"/>
 <note id="B_5" location="769" soundLength="8"/>
 <note id="B_5" location="777" soundLength="16"/>
 <note id="D_6" location="793" soundLength="16"/>
 <note id="G#_5" location="809" soundLength="16"/>
 <note id="B_5" location="825" soundLength="16"/>
 <note id="A_5" location="841" soundLength="16"/>
 <note id="C_6" location="857" soundLength="16"/>
 <note id="B_5" location="873" soundLength="8"/>
 <note id="A_5" location="881" soundLength="8"/>
 <note id="G_5" location="889" soundLength="8"/>
 <note id="F_5" location="897" soundLength="8"/>
 <note id="E_5" location="905" soundLength="64"/>
 <note id="D#_5" location="969" soundLength="64"/>
 /*<note id="D#_5" location="1033" soundLength="8"/>
 <note id="E_5" location="1041" soundLength="8"/>
 <note id="F_5" location="1049" soundLength="8"/>
 <note id="E_5" location="1057" soundLength="8"/>
 <note id="D#_5" location="1065" soundLength="4"/>
 <note id="E_5" location="1073" soundLength="4"/>
 <note id="F_5" location="1077" soundLength="4"/>
 <note id="F_5" location="1081" soundLength="4"/>*/
		</sequance>
		
			
		<sequance id="99">
		<subSequance id="10" location="0" />
		</sequance>
		</sequances>
		</bottles>
		
	}
}