package com.model.rawData.tarab
{
public class Drum
{
public static var data:XML = 
<drum type="drums" thumbNail='drum.png' spriteSheet="drumsSheet.png" width="410" height="350">
<eyes swfSheet="drumsEyes.png" x="0" y="0" width="410" height="350" >
	<blink start="0" end="4" />
	<blink start="4" end="8" />
	<blink start="9" end="15" />
	<blink start="15" end="16" />
</eyes>							
<components notesGap="140" leftPad="280">
			
			<drum type="snare" image="DRUMS_1_IDLE.png" playImage="DRUMS_1_PRESSED.png" x='0' y='0'>
			<tap noteId="1" />
			</drum>
			<drum type="bass" image="DRUMS_2_IDLE.png" playImage="DRUMS_2_PRESSED.png"  x='140' y='0'>
			<tap noteId="2" />
			</drum>
			<drum type="crash" image="DRUMS_3_IDLE.png" playImage="DRUMS_3_PRESSED.png"  x='280' y='0'>
			<tap noteId="3" />
			</drum>
			<drum type="tom" image="DRUMS_4_IDLE.png" playImage="DRUMS_4_PRESSED.png"  x='420' y='0'>
			<tap noteId="4" />
			</drum>
			
			</components>
<notes>
	<note id="1" value="1" soundFile="tarab/drums/snare.mp3" animationIndex='5'  />
	<note id="2" value="2" soundFile="tarab/drums/bassDrum2.mp3" animationIndex='4'  />
	<note id="3"  value="3" soundFile="tarab/drums/haiat.mp3" animationIndex='2'  />
	<note id="4"  value="4" soundFile="tarab/drums/tam.mp3" animationIndex='1'  />
</notes>
<sequances>
<sequance id="99">
</sequance>
	
</sequances>

</drum>
		public function Drum()
		{
		}
	}
}