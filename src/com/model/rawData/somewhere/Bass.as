package com.model.rawData.somewhere
{
public class Bass
{
public static var data:XML = 
<bass type="bass" thumbNail='bass_flash.jpg' spriteSheet='bassSheet.png' >
<!--<bubble x="-155" y="22">-->
<bubble x="-800" y="22">
</bubble>
	<eyes swfSheet="bassBlink.png" x="0" y="0" width="250" height="350" >
		<blink start="0" end="5" />
	</eyes>	
<components recordButtonX="0" recordButtonY="580">
		
		<bass image="BASS_1_IDLE.png" playImage="BASS_1_SELECTED.png" x='0' y='0'  >
			<tap noteId="1" />
		</bass>
		<bass image="BASS_2_IDLE.png" playImage="BASS_2_SELECTED.png" x='120' y='0' >
			<tap noteId="2" />
		</bass>
		<bass image="BASS_3_IDLE.png" playImage="BASS_3_SELECTED.png" x='240' y='0'  >
			<tap noteId="3" />
		</bass>
		
		<bass image="BASS_4_IDLE.png" playImage="BASS_4_SELECTED.png" x='360' y='0' >
			<tap noteId="4" />
		</bass>
		<bass image="BASS_5_IDLE.png" playImage="BASS_5_SELECTED.png" x='480' y='0'  >
			<tap noteId="5" />
		</bass>
		<bass image="BASS_6_IDLE.png" playImage="BASS_6_SELECTED.png" x='600' y='0'  >
			<tap noteId="6" />
		</bass>
		<bass image="BASS_7_IDLE.png" playImage="BASS_7_SELECTED.png" x='720' y='0'  >
			<tap noteId="7" />
		</bass>
		
	</components>
<studio>
<background image="backgr_solo.jpg" />
<spotLight image="bass_spot_lights.png" />
</studio>
<octaves>
<notes>
<note id="F_3"   soundFile="somewhere/bass/fa_low.mp3" animationIndex='1' value="1"  />
<note id="G_3"   soundFile="somewhere/bass/sol.mp3" animationIndex='2' value="2"  />
<note id="A_3"   soundFile="somewhere/bass/la.mp3" animationIndex='3' value="3"  />
<note id="C#_4"   soundFile="somewhere/bass/do.mp3" animationIndex='4' value="4"  />
<note id="C_4"   soundFile="somewhere/bass/do.mp3" animationIndex='4' value="4"  />
<note id="D_4"   soundFile="somewhere/bass/re.mp3" animationIndex='5' value="5"   />
<note id="E_4"   soundFile="somewhere/bass/mi.mp3" animationIndex='6' value="6" />
<note id="F_4"   soundFile="somewhere/bass/fa.mp3" animationIndex='7' value="7"  />
<note id="F#_3"   soundFile="somewhere/bass/fa.mp3" animationIndex='7' value="7"  />
</notes>
</octaves>
<gestures>
</gestures>
<sequances>
	<sequance id="10">
<note id="C_4" location="1" soundLength="2"/><note id="A_3" location="9" soundLength="2"/><note id="E_4" location="17" soundLength="2"/><note id="G_3" location="25" soundLength="2"/><note id="F_3" location="33" soundLength="2"/><note id="E_4" location="41" soundLength="2"/><note id="A_3" location="49" soundLength="2"/><note id="C#_4" location="61" soundLength="2"/><note id="D_4" location="65" soundLength="2"/><note id="F_3" location="73" soundLength="2"/><note id="C_4" location="81" soundLength="2"/><note id="A_3" location="89" soundLength="2"/><note id="D_4" location="97" soundLength="2"/><note id="F_3" location="101" soundLength="2"/><note id="G_3" location="105" soundLength="2"/><note id="C_4" location="113" soundLength="2"/><note id="D_4" location="121" soundLength="2"/><note id="G_3" location="125" soundLength="2"/><note id="C_4" location="129" soundLength="2"/><note id="D_4" location="145" soundLength="2"/><note id="G_3" location="153" soundLength="2"/><note id="E_4" location="161" soundLength="2"/><note id="A_3" location="169" soundLength="2"/><note id="D_4" location="177" soundLength="2"/><note id="G_3" location="185" soundLength="2"/><note id="C_4" location="193" soundLength="2"/><note id="F#_3" location="209" soundLength="2"/><note id="E_4" location="224" soundLength="2"/><note id="C_4" location="232" soundLength="2"/><note id="D_4" location="240" soundLength="2"/><note id="G_3" location="248" soundLength="2"/><note id="C_4" location="255" soundLength="2"/><note id="A_3" location="262" soundLength="2"/><note id="E_4" location="269" soundLength="2"/><note id="G_3" location="277" soundLength="2"/><note id="C_4" location="281" soundLength="2"/><note id="F_4" location="285" soundLength="2"/><note id="E_4" location="293" soundLength="2"/><note id="A_3" location="301" soundLength="2"/><note id="C#_4" location="313" soundLength="1"/><note id="F_3" location="317" soundLength="2"/><note id="F_3" location="325" soundLength="2"/><note id="C_4" location="333" soundLength="2"/><note id="A_3" location="341" soundLength="2"/><note id="D_4" location="349" soundLength="2"/><note id="F_3" location="353" soundLength="2"/><note id="G_3" location="357" soundLength="2"/><note id="C_4" location="365" soundLength="2"/><note id="F_3" location="381" soundLength="2"/><note id="F_3" location="389" soundLength="2"/><note id="C_4" location="397" soundLength="2"/><note id="A_3" location="405" soundLength="1"/><note id="D_4" location="413" soundLength="2"/><note id="F_3" location="417" soundLength="2"/><note id="G_3" location="420" soundLength="4"/><note id="C_4" location="428" soundLength="2"/>
	
		</sequance>
<sequance id="99">
<subSequance id="10" location="0" />
</sequance>
</sequances>
</bass>
		public function Bass()
		{
		}
	}
}