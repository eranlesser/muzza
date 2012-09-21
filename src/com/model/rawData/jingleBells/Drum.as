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
	<note id="1" value="1"  soundFile="jingleBells/drums/SNARE.mp3" animationIndex='5'    />
	<note id="2" value="2" soundFile="jingleBells/drums/KICK.mp3" animationIndex='4'  />
	<note id="3"  value="3" soundFile="jingleBells/drums/CRASH.mp3" animationIndex='2' />
	<note id="4"  value="4" soundFile="jingleBells/drums/TOM.mp3" animationIndex='1' />
</notes>
</octaves>
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