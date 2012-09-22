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
<sequance id="99">
</sequance>
</sequances>
</bass>
		public function Bass()
		{
		}
	}
}