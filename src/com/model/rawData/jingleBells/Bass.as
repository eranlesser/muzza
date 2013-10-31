package com.model.rawData.jingleBells
{
	public class Bass
	{
		public static var data:XML = 
<bass type="bass" thumbNail='bass_flash.jpg' spriteSheet='bassSheet.png'  width="250" height="350">
	<eyes swfSheet="bassBlink.png" x="0" y="0" width="250" height="350" >
		<blink start="0" end="5" />
	</eyes>	
<components>
		
		<bass image="BASS_ICON_3_IDLE.png" playImage="BASS_ICON_3_PRESS.png" x='0' y='0'  noteX='15' noteY='5'>
			<tap noteId="1" />
		</bass>
		<bass image="BASS_ICON_4_IDLE.png" playImage="BASS_ICON_4_PRESS.png" x='140' y='0'  noteX='15' noteY='5'>
			<tap noteId="2" />
		</bass>
		<bass image="BASS_ICON_5_IDLE.png" playImage="BASS_ICON_5_PRESS.png" x='280' y='0'  noteX='15' noteY='5'>
			<tap noteId="3" />
		</bass>
		<bass image="BASS_ICON_6_IDLE.png" playImage="BASS_ICON_6_PRESS.png" x='420' y='0'  noteX='15' noteY='5'>
			<tap noteId="4" />
		</bass>
		<bass image="BASS_ICON_7_IDLE.png" playImage="BASS_ICON_7_PRESS.png" x='560' y='0'  noteX='15' noteY='5'>
			<tap noteId="5" />
		</bass>
		<bass image="BASS_ICON_8_IDLE.png" playImage="BASS_ICON_8_PRESS.png" x='700' y='0'  noteX='15' noteY='5'>
			<tap noteId="6" />
		</bass>
	</components>
	<studio>
	<background image="backgr_solo.jpg" />
	<spotlite image="bass_spot_lights.png" />
	</studio>
<octaves>
	<notes>
	<note id="1"   soundFile="jingleBells/bass/B.mp3" animationIndex='3' value="1"  />
	<note id="2"   soundFile="jingleBells/bass/AHO.mp3" animationIndex='4' value="2"  />
	<note id="3"   soundFile="jingleBells/bass/G+1.mp3" animationIndex='5' value="3" isFlatOrSharp="sharp" />
	<note id="4"   soundFile="jingleBells/bass/E.mp3" animationIndex='6' value="4"  />
	<note id="5"   soundFile="jingleBells/bass/D.mp3" animationIndex='7' value="5"   />
	<note id="6"   soundFile="jingleBells/bass/ALO.mp3" animationIndex='8' value="6"  />
	</notes>
</octaves>
	<gestures>
	</gestures>
	<sequances>
	<sequance id="1">
		<note id="2" location="65" soundLength="2"/>
		<note id="4" location="73" soundLength="2"/>
		<note id="2" location="81" soundLength="2"/>
		<note id="4" location="89" soundLength="2"/>
		<note id="2" location="97" soundLength="2"/>
		<note id="4" location="105" soundLength="2"/>
		<note id="2" location="113" soundLength="4"/>
	</sequance>
	<sequance id="2">
		<note id="2" location="1" soundLength="2"/>
		<note id="4" location="9" soundLength="2"/>
		<note id="2" location="17" soundLength="2"/>
		<note id="4" location="25" soundLength="2"/>
		<note id="2" location="33" soundLength="2"/>
		<note id="5" location="41" soundLength="2"/>
		<note id="2" location="49" soundLength="2"/>
		<note id="4" location="57" soundLength="2"/>
		<note id="5" location="65" soundLength="2"/>
		<note id="5" location="73" soundLength="2"/>
		<note id="2" location="81" soundLength="2"/>
		<note id="2" location="89" soundLength="2"/>
		<note id="1" location="97" soundLength="2"/>
		<note id="1" location="105" soundLength="2"/>
		<note id="4" location="113" soundLength="4"/>
	</sequance>
	<sequance id="3">
		<note id="2" location="1" soundLength="2"/>
		<note id="4" location="9" soundLength="2"/>
		<note id="2" location="17" soundLength="2"/>
		<note id="4" location="25" soundLength="2"/>
		<note id="2" location="33" soundLength="2"/>
		<note id="5" location="41" soundLength="2"/>
		<note id="2" location="49" soundLength="2"/>
		<note id="4" location="57" soundLength="2"/>
		<note id="5" location="65" soundLength="2"/>
		<note id="5" location="73" soundLength="2"/>
		<note id="2" location="81" soundLength="2"/>
		<note id="2" location="89" soundLength="2"/>
		<note id="4" location="97" soundLength="2"/>
		<note id="4" location="105" soundLength="2"/>
		<note id="2" location="113" soundLength="4"/>
	</sequance>
<sequance id="99">
	<subSequance id="2" location="0" />
	<subSequance id="3" location="128" />
	<subSequance id="3" location="256" />
	<subSequance id="3" location="384" />
	<subSequance id="2" location="512" />
</sequance>
	</sequances>
</bass>
		public function Bass()
		{
		}
	}
}