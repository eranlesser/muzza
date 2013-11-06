package com.model.rawData.jingleBells
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
<components>

<drum image="drum_2_0001.png" playImage="drum_2_0002.png" x='50' y='280'  noteX='33' noteY='-10'>
	<tap noteId="4" />
</drum>
<drum image="drum_1_0001.png" playImage="drum_1_0002.png" x='0' y='110' noteX='2' noteY='-5' >
	<tap noteId="3" />
</drum>
<drum image="bottle_drum_0001.png" playImage="bottle_drum_0002.png" x='150' y='110' noteX='15' noteY='5'>
	<tap noteId="2" />
</drum>
<drum image="metzila_0001.png" playImage="metzila_0002.png" x='80' y='0' noteX='100' noteY='0'>
	<tap noteId="1" />
</drum>
			
</components>
<notes>
<note id="1" value="1" soundFile="jingleBells/drums/CRASH.mp3" animationIndex='2'  />
<note id="2"  value="2" soundFile="jingleBells/drums/KICK.mp3" animationIndex='4'  />
<note id="3"  value="3" soundFile="jingleBells/drums/SNARE.mp3" animationIndex='5'  />
<note id="4" value="4" soundFile="edvard/notes/drums/TOM.mp3" animationIndex='1'  />
</notes>
<sequances>
<sequance id="1">
<note id="2" location="1" soundLength="2"/>
<note id="1" location="5" soundLength="2"/>
</sequance>
<sequance id="2">
<subSequance id="1" location="0"/>
<subSequance id="1" location="8"/>
<subSequance id="1" location="16"/>
<subSequance id="1" location="24"/>
<subSequance id="1" location="32"/>
<subSequance id="1" location="40"/>
<subSequance id="1" location="48"/>
<subSequance id="1" location="56"/>
<subSequance id="1" location="64"/>
<subSequance id="1" location="72"/>
<subSequance id="1" location="80"/>
<subSequance id="1" location="88"/>
<subSequance id="1" location="96"/>
<subSequance id="1" location="104"/>
<subSequance id="1" location="112"/>
<subSequance id="1" location="120"/>
</sequance>
<sequance id="3">
<note id="3" location="1" soundLength="2"/>
<note id="1" location="5" soundLength="2"/>
</sequance>
<sequance id="4">
<subSequance id="1" location="0"/>
<subSequance id="1" location="8"/>
<subSequance id="1" location="16"/>
<subSequance id="3" location="24"/>
<subSequance id="1" location="32"/>
<subSequance id="1" location="40"/>
<subSequance id="1" location="48"/>
<subSequance id="3" location="56"/>
<subSequance id="1" location="64"/>
<subSequance id="1" location="72"/>
<subSequance id="1" location="80"/>
<subSequance id="3" location="88"/>
<subSequance id="1" location="96"/>
<subSequance id="1" location="104"/>
<subSequance id="1" location="112"/>
<subSequance id="3" location="120"/>
</sequance>
<sequance id="99">
	<subSequance id="2" location="0" />
	<subSequance id="2" location="128" />
	<subSequance id="4" location="256" />
	<subSequance id="2" location="384" />
	<subSequance id="2" location="512" />
</sequance>
</sequances>
<gestures>
</gestures>

</drum>
		public function Drum()
		{
		}
	}
}