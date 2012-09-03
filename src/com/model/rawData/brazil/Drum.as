package com.model.rawData.brazil
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

<drum image="drum_2_0001.png" playImage="drum_2_0002.png" x='100' y='280' noteX='33' noteY='-10'>
<tap noteId="1" />
</drum>
<drum image="drum_1_0001.png" playImage="drum_1_0002.png" x='0' y='110' noteX='2' noteY='-5'>
<tap noteId="3" />
</drum>
<drum image="bottle_drum_0001.png" playImage="bottle_drum_0002.png" x='150' y='110' noteX='15' noteY='5'>
<tap noteId="4" />
</drum>
<drum image="metzila_0001.png" playImage="metzila_0002.png" x='80' y='0' noteX='100' noteY='0'>
<tap noteId="2" />
</drum>
</components>
<octaves>
<notes>
	<note id="1" value="1" soundFile="brazil/drums/tom.mp3" animationIndex='1'  />
	<note id="2" value="2" soundFile="brazil/drums/haiat.mp3" animationIndex='2'  />
	<note id="4"  value="3" soundFile="brazil/drums/kick.mp3" animationIndex='4'  />
	<note id="3"  value="4" soundFile="brazil/drums/snare.mp3" animationIndex='5'  />
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