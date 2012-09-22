package com.model.rawData.brazil
{
public class Drum
{
public static var data:XML = 
<drum type="drums" thumbNail='drum.png' spriteSheet="drumsSheet.png">
<bubble x="-100" y="42">
</bubble>
<eyes swfSheet="drumsEyes.png" x="0" y="0" width="410" height="350" >
	<blink start="0" end="4" />
	<blink start="4" end="8" />
	<blink start="9" end="15" />
	<blink start="15" end="16" />
</eyes>							
<components>

<drum image="DRUMS_1_IDLE.png" playImage="DRUMS_1_PRESSED.png" x='150' y='80'>
<tap noteId="1" />
</drum>
<drum image="DRUMS_2_IDLE.png" playImage="DRUMS_2_PRESSED.png"  x='60' y='160'>
<tap noteId="2" />
</drum>
<drum image="DRUMS_3_IDLE.png" playImage="DRUMS_3_PRESSED.png"  x='40' y='-10'>
<tap noteId="3" />
</drum>
<drum image="DRUMS_4_IDLE.png" playImage="DRUMS_4_PRESSED.png" x='-60' y='70' >
<tap noteId="4" />
</drum>
</components>
<octaves>
<notes>
	<note id="1" value="1" soundFile="brazil/drums/snare.mp3" animationIndex='5'  />
	<note id="2" value="2" soundFile="brazil/drums/kick.mp3" animationIndex='4'  />
	<note id="3" value="3" soundFile="brazil/drums/haiat.mp3" animationIndex='2'  />
	<note id="4" value="4" soundFile="brazil/drums/tom.mp3" animationIndex='1'  />
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