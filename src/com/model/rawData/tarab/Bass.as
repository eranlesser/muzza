package com.model.rawData.tarab
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
		
		<bass image="BASS_1_IDLE.png" playImage="BASS_1_SELECTED.png" x='0' y='0'  noteX='15' noteY='5'>
			<tap noteId="1" />
		</bass>
		<bass image="BASS_2_IDLE.png" playImage="BASS_2_SELECTED.png" x='128' y='0'  noteX='15' noteY='5'>
			<tap noteId="2" />
		</bass>
		<bass image="BASS_7_IDLE.png" playImage="BASS_3_SELECTED.png" x='256' y='0'  noteX='15' noteY='5'>
			<tap noteId="3" />
		</bass>
		
		<bass image="BASS_4_IDLE.png" playImage="BASS_4_SELECTED.png" x='384' y='0'  noteX='15' noteY='5'>
			<tap noteId="4" />
		</bass>
		<bass image="BASS_6_IDLE.png" playImage="BASS_6_SELECTED.png" x='512' y='0'  noteX='15' noteY='5'>
			<tap noteId="5" />
		</bass>
		<bass image="BASS_5_IDLE.png" playImage="BASS_5_SELECTED.png" x='640' y='0'  noteX='15' noteY='5'>
			<tap noteId="6" />
		</bass>
		
		
	</components>
<studio>
<background image="backgr_solo.jpg" />
<spotLight image="bass_spot_lights.png" />
</studio>
<notes>
<note id="1"   soundFile="tarab/bass/bas_sol.mp3" animationIndex='1' value="1"  />
<note id="2"   soundFile="tarab/bass/bas_la.mp3" animationIndex='2' value="2"  />
<note id="3"   soundFile="tarab/bass/bas_sib.mp3" animationIndex='3' value="3"   />
<note id="4"   soundFile="tarab/bass/bas_do.mp3" animationIndex='4' value="4"  />
<note id="5"   soundFile="tarab/bass/bas_re.mp3" animationIndex='5' value="5"  />
<note id="6"   soundFile="tarab/bass/bas_mib.mp3" animationIndex='6' value="6"  />
</notes>
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