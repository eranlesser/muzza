package com.model.rawData.brazil
{
public class Bass
{
public static var data:XML = 
<bass type="bass" thumbNail='bass_flash.jpg' spriteSheet='bassSheet.png'>
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
		<bass image="BASS_5_IDLE.png" playImage="BASS_5_SELECTED.png" x='360' y='0' >
			<tap noteId="5" />
		</bass>
		<bass image="BASS_6_IDLE.png" playImage="BASS_6_SELECTED.png" x='480' y='0'  >
			<tap noteId="6" />
		</bass>
		
	</components>
<studio>
<background image="backgr_solo.jpg" />
<spotLight image="bass_spot_lights.png" />
</studio>
<octaves>
<notes>
<note id="1"   soundFile="brazil/bass/sol.mp3" animationIndex='1' value="1"  />
<note id="2"   soundFile="brazil/bass/la.mp3" animationIndex='2' value="2"  />
<note id="3"   soundFile="brazil/bass/ci.mp3" animationIndex='3' value="3"   />
<note id="4"   soundFile="brazil/bass/do.mp3" animationIndex='4' value="4"  />
<note id="5"   soundFile="brazil/bass/re.mp3" animationIndex='5' value="5"  />
<note id="6"   soundFile="brazil/bass/mi.mp3" animationIndex='6' value="6"  />
</notes>
</octaves>
<gestures>
</gestures>
<sequances>
<sequance id="1">
	<note id="4" location="1" soundLength="1"/>
	<note id="1" location="5" soundLength="1"/>
	<note id="4" location="9" soundLength="1"/>
	<note id="1" location="13" soundLength="1"/>
</sequance>
<sequance id="2">
	<note id="5" location="1" soundLength="1"/>
	<note id="2" location="5" soundLength="1"/>
	<note id="5" location="9" soundLength="1"/>
	<note id="2" location="13" soundLength="1"/>
</sequance>
<sequance id="3">
	<note id="1" location="1" soundLength="1"/>
	<note id="5" location="5" soundLength="1"/>
	<note id="1" location="9" soundLength="1"/>
	<note id="5" location="13" soundLength="1"/>
</sequance>
<sequance id="4">
	<note id="1" location="1" soundLength="1"/>
	<note id="5" location="5" soundLength="1"/>
	<note id="1" location="9" soundLength="1"/>
	<note id="3" location="13" soundLength="1"/>
</sequance>
<sequance id="5">
	<note id="5" location="1" soundLength="1"/>
	<note id="2" location="5" soundLength="1"/>
	<note id="1" location="9" soundLength="1"/>
	<note id="5" location="13" soundLength="1"/>
</sequance>
<sequance id="6">
	<note id="4" location="1" soundLength="1"/>
	<note id="1" location="5" soundLength="1"/>
	<note id="4" location="9" soundLength="1"/>
	<note id="1" location="27" soundLength="1"/>
	<note id="6" location="13" soundLength="1"/>
</sequance>
<sequance id="7">
	<note id="1" location="1" soundLength="1"/>
	<note id="5" location="5" soundLength="1"/>
	<note id="1" location="9" soundLength="1"/>
	<note id="5" location="11" soundLength="1"/>
	<note id="6" location="13" soundLength="1"/>
</sequance>
<sequance id="8">
	<note id="4" location="1" soundLength="1"/>
	<note id="1" location="5" soundLength="1"/>
	<note id="4" location="9" soundLength="1"/>
	<note id="1" location="11" soundLength="1"/>
	<note id="4" location="13" soundLength="1"/>
</sequance>
<sequance id="99">
	<subSequance id="1" location="0" />
	<subSequance id="1" location="16" />
	<subSequance id="1" location="32" />
	<subSequance id="1" location="48" />
	<subSequance id="2" location="64" />
	<subSequance id="3" location="80" />
	<subSequance id="3" location="96" />
	<subSequance id="4" location="112" />
	<subSequance id="1" location="128" />
	<subSequance id="5" location="144" />
	<subSequance id="1" location="160" />
	<subSequance id="6" location="176" />
	<subSequance id="2" location="192" />
	<subSequance id="7" location="208" />
	<subSequance id="3" location="224" />
	<subSequance id="4" location="240" />
	<subSequance id="8" location="256" />
	<subSequance id="5" location="272" />
	<subSequance id="1" location="286" />
	<subSequance id="1" location="302" />
</sequance>
</sequances>
</bass>
		public function Bass()
		{
		}
	}
}