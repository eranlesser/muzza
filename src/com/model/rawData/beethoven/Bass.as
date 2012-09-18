package com.model.rawData.beethoven
{
public class Bass
{
public static var data:XML = 
<bass type="bass" thumbNail='bass_flash.jpg' spriteSheet='bassSheet.png'  width="250" height="350">
<!--<bubble x="-155" y="22">-->
<bubble x="-800" y="22">
</bubble>
	<eyes swfSheet="bassBlink.png" x="0" y="0" width="250" height="350" >
		<blink start="0" end="5" />
	</eyes>	
<components recordButtonX="0" recordButtonY="580">
		
		<bass image="BASS_ICON_1_IDLE.png" playImage="BASS_ICON_1_PRESS.png" x='0' y='0'  noteX='15' noteY='5'>
			<tap noteId="1" />
		</bass>
		<bass image="BASS_ICON_2_IDLE.png" playImage="BASS_ICON_2_PRESS.png" x='128' y='0'  noteX='15' noteY='5'>
			<tap noteId="2" />
		</bass>
		<bass image="BASS_ICON_3_IDLE.png" playImage="BASS_ICON_3_PRESS.png" x='256' y='0'  noteX='15' noteY='5'>
			<tap noteId="3" />
		</bass>
		
		<bass image="BASS_ICON_4_IDLE.png" playImage="BASS_ICON_4_PRESS.png" x='384' y='0'  noteX='15' noteY='5'>
			<tap noteId="4" />
		</bass>
		<bass image="BASS_ICON_6_IDLE.png" playImage="BASS_ICON_6_PRESS.png" x='512' y='0'  noteX='15' noteY='5'>
			<tap noteId="6" />
		</bass>
		<bass image="BASS_ICON_5_IDLE.png" playImage="BASS_ICON_5_PRESS.png" x='640' y='0'  noteX='15' noteY='5'>
			<tap noteId="5" />
		</bass>
		<bass image="BASS_ICON_7_IDLE.png" playImage="BASS_ICON_7_PRESS.png" x='768' y='0'  noteX='15' noteY='5'>
			<tap noteId="7" />
		</bass>
		<bass image="BASS_ICON_8_IDLE.png" playImage="BASS_ICON_8_PRESS.png" x='896' y='0'  noteX='15' noteY='5'>
			<tap noteId="8" />
		</bass>
		
	</components>
<studio>
<background image="backgr_solo.jpg" />
<spotLight image="bass_spot_lights.png" />
</studio>
<octaves>
<notes>
<note id="1"   soundFile="beethoven/notes/BASS/E.mp3" animationIndex='1' value="1"  />
<note id="2"   soundFile="beethoven/notes/BASS/F+1.mp3" animationIndex='2' value="2"  />
<note id="3"   soundFile="beethoven/notes/BASS/G.mp3" animationIndex='3' value="3"  />
<note id="4"   soundFile="beethoven/notes/BASS/A.mp3" animationIndex='4' value="4"  />
<note id="5"   soundFile="beethoven/notes/BASS/B.mp3" animationIndex='5' value="6"   />
<note id="6"   soundFile="beethoven/notes/BASS/A+1.mp3" animationIndex='6' value="5" isFlatOrSharp="sharp" />
<note id="7"   soundFile="beethoven/notes/BASS/C.mp3" animationIndex='7' value="7"  />
<note id="8"   soundFile="beethoven/notes/BASS/DHO.mp3" animationIndex='8' value="8"  />
</notes>
</octaves>
<gestures>
</gestures>
<sequances>
<sequance id="11">
	<note id="8" location="1" soundLength="4"/>
	<note id="8" location="17" soundLength="1"/>
	<note id="8" location="21" soundLength="2"/>
	<note id="8" location="33" soundLength="4"/>
	<note id="8" location="49" soundLength="1"/>
	<note id="8" location="53" soundLength="2"/>
</sequance>
<sequance id="1">
	<subSequance id="11" location="64" />
</sequance>
<sequance id="2">
	<note id="8" location="1" soundLength="4"/>
	<note id="8" location="17" soundLength="1"/>
	<note id="8" location="21" soundLength="2"/>
	<note id="4" location="33" soundLength="4"/>
	<note id="4" location="49" soundLength="1"/>
	<note id="4" location="53" soundLength="1"/>
	<note id="3" location="57" soundLength="2"/>
	<note id="2" location="65" soundLength="4"/>
	<note id="1" location="81" soundLength="4"/>
	<note id="1" location="97" soundLength="4"/>
	<note id="4" location="113" soundLength="4"/>
</sequance>
<sequance id="3">
	<note id="8" location="1" soundLength="4"/>
	<note id="7" location="17" soundLength="1"/>
	<note id="7" location="21" soundLength="2"/>
	<note id="3" location="33" soundLength="4"/>
	<note id="3" location="49" soundLength="1"/>
	<note id="3" location="53" soundLength="2"/>
	<note id="4" location="65" soundLength="4"/>
	<note id="4" location="81" soundLength="1"/>
	<note id="4" location="85" soundLength="2"/>
	<note id="4" location="97" soundLength="4"/>
	<note id="8" location="113" soundLength="4"/>
	
		</sequance>
	<sequance id="4">
	<note id="4" location="1" soundLength="4"/>
	<note id="4" location="13" soundLength="1"/>
	<note id="4" location="17" soundLength="2"/>
	<note id="4" location="33" soundLength="4"/>
	<note id="4" location="45" soundLength="1"/>
	<note id="4" location="49" soundLength="2"/>
	<note id="4" location="65" soundLength="4"/>
	<note id="4" location="77" soundLength="1"/>
	<note id="5" location="81" soundLength="2"/>
	<note id="2" location="89" soundLength="2"/>
	<note id="6" location="97" soundLength="2"/>
	<note id="1" location="105" soundLength="2"/>
	<note id="4" location="113" soundLength="4"/>
	
		</sequance>
	<sequance id="5">
	<note id="8" location="1" soundLength="4"/>
	<note id="7" location="17" soundLength="1"/>
	<note id="7" location="21" soundLength="2"/>
	<note id="3" location="33" soundLength="4"/>
	<note id="3" location="49" soundLength="1"/>
	<note id="3" location="53" soundLength="2"/>
	<note id="4" location="65" soundLength="4"/>
	<note id="4" location="81" soundLength="1"/>
	<note id="4" location="85" soundLength="2"/>
	<note id="4" location="97" soundLength="2"/>
	<note id="8" location="113" soundLength="4"/>
	
		</sequance>
<sequance id="99">
<subSequance id="2" location="0" />
<subSequance id="3" location="128" />
<subSequance id="4" location="256" />
<subSequance id="5" location="384" />
</sequance>
</sequances>
</bass>
		public function Bass()
		{
		}
	}
}