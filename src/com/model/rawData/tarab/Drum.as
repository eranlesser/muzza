package com.model.rawData.tarab
{
public class Drum
{
public static var data:XML = 
<drum type="drums" thumbNail='drum.png' spriteSheet="drumsSheet.png" width="410" height="350">
<bubble x="-100" y="42">
</bubble>
<eyes swfSheet="drumsEyes.png" x="0" y="0" width="410" height="350" >
	<blink start="0" end="4" />
	<blink start="4" end="8" />
	<blink start="9" end="15" />
	<blink start="15" end="16" />
</eyes>							
<components recordButtonX="520" recordButtonY="115">

<drum image="DRUMS_2_IDLE.png" playImage="DRUMS_2_PRESSED.png" x='100' y='280' noteX='33' noteY='-10'>
<tap noteId="1" />
</drum>
<drum image="DRUMS_2_IDLE.png" playImage="DRUMS_2_PRESSED.png" x='0' y='110' noteX='2' noteY='-5'>
<tap noteId="3" />
</drum>
<drum image="bottle_drum_0001.png" playImage="DRUMS_1_PRESSED.png" x='150' y='110' noteX='15' noteY='5'>
<tap noteId="4" />
</drum>
<drum image="metzila_0001.png" playImage="metzila_0002.png" x='80' y='0' noteX='100' noteY='0'>
<tap noteId="2" />
</drum>
</components>
<octaves>
<notes>
	<note id="1" value="1" soundFile="tarab/drums/tam.mp3" animationIndex='1'  />
	<note id="2" value="2" soundFile="tarab/drums/haiat.mp3" animationIndex='2'  />
	<note id="4"  value="3" soundFile="tarab/drums/bassDrum2.mp3" animationIndex='4'  />
	<note id="3"  value="4" soundFile="tarab/drums/snare.mp3" animationIndex='5'  />
</notes>
</octaves>
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