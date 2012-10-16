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
<drum image="DRUMS_4_IDLE.png" playImage="DRUMS_4_PRESSED.png" x='-60' y='70' >
<tap noteId="4" />
</drum>
</components>
<octaves>
<notes>
	<note id="1" value="1" soundFile="brazil/drums/pandero1.mp3" animationIndex='5'  />
	<note id="2" value="2" soundFile="brazil/drums/pandero2.mp3" animationIndex='4'  />
	<note id="4" value="4" soundFile="brazil/drums/surdo.mp3" animationIndex='1'  />
</notes>
</octaves>
<sequances>
<sequance id="1">
<note id="2" location="1" soundLength="1"/>
<note id="1" location="2" soundLength="1"/>
<note id="2" location="4" soundLength="1"/>
<note id="4" location="5" soundLength="1"/>
<note id="2" location="9" soundLength="1"/>
<note id="1" location="11" soundLength="1"/>
<note id="2" location="13" soundLength="1"/>
<note id="4" location="15" soundLength="1"/>
</sequance>

<sequance id="99">
	<subSequance id="1" location="48" />
	<subSequance id="1" location="64" />
	<subSequance id="1" location="80" />
	<subSequance id="1" location="96" />
	<subSequance id="1" location="112" />
	<subSequance id="1" location="128" />
	<subSequance id="1" location="144" />
	<subSequance id="1" location="160" />
	<subSequance id="1" location="176" />
	<subSequance id="1" location="192" />
	<subSequance id="1" location="208" />
	<subSequance id="1" location="224" />
	<subSequance id="1" location="240" />
	<subSequance id="1" location="256" />
	<subSequance id="1" location="272" />
	<subSequance id="1" location="286" />
	<subSequance id="1" location="302" />
	<subSequance id="1" location="318" />
</sequance>
	
</sequances>

</drum>
		public function Drum()
		{
		}
	}
}