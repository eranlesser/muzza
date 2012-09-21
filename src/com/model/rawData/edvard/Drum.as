package com.model.rawData.edvard
{
	public class Drum
	{
		public static var data:XML = 
<drum type="drums" thumbNail='drum.png' spriteSheet="drumsSheet.png" >
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
<note id="1"  value="1" soundFile="edvard/notes/drums/SNARE.mp3" animationIndex='1'  />
<note id="2" value="2" soundFile="edvard/notes/drums/TOM.mp3" animationIndex='5'   />
<note id="3"  value="3" soundFile="edvard/notes/drums/CRASH.mp3" animationIndex='2'  />
<note id="4" value="4" soundFile="edvard/notes/drums/KICK.mp3" animationIndex='4'  />
</notes>
</octaves>
<sequances>
<sequance id="1" >
	<note id="2" location="1" soundLength="2"/>
	<note id="2" location="13" soundLength="1"/>
	<note id="2" location="17" soundLength="4"/>
	<note id="2" location="33" soundLength="2"/>
	<note id="2" location="45" soundLength="1"/>
	<note id="2" location="49" soundLength="4"/>
	<note id="2" location="65" soundLength="2"/>
	<note id="2" location="77" soundLength="1"/>
	<note id="2" location="81" soundLength="4"/>
	<note id="2" location="97" soundLength="2"/>
	<note id="2" location="109" soundLength="1"/>
	<note id="2" location="113" soundLength="4"/>
</sequance>
<sequance id="2" >
	<note id="2" location="1" soundLength="1"/>
	<note id="2" location="13" soundLength="1"/>
	<note id="2" location="17" soundLength="4"/>
	<note id="2" location="33" soundLength="1"/>
	<note id="4" location="41" soundLength="1"/>
	<note id="2" location="45" soundLength="1"/>
	<note id="2" location="49" soundLength="4"/>
	<note id="2" location="65" soundLength="1"/>
	<note id="4" location="73" soundLength="1"/>
	<note id="2" location="77" soundLength="1"/>
	<note id="2" location="81" soundLength="4"/>
	<note id="2" location="97" soundLength="2"/>
	<note id="3" location="113" soundLength="4"/>
</sequance>
			
<sequance id="3" >
	<note id="4" location="1" soundLength="1"/>
	<note id="2" location="9" soundLength="1"/>
	<note id="4" location="13" soundLength="1"/>
	<note id="4" location="17" soundLength="1"/>
	<note id="2" location="21" soundLength="1"/>
	<note id="3" location="25" soundLength="1"/>
	<note id="4" location="33" soundLength="1"/>
	<note id="2" location="41" soundLength="1"/>
	<note id="4" location="45" soundLength="1"/>
	<note id="4" location="49" soundLength="1"/>
	<note id="2" location="53" soundLength="1"/>
	<note id="1" location="57" soundLength="1"/>
	<note id="4" location="65" soundLength="1"/>
	<note id="2" location="73" soundLength="1"/>
	<note id="4" location="77" soundLength="1"/>
	<note id="4" location="81" soundLength="1"/>
	<note id="2" location="85" soundLength="1"/>
	<note id="3" location="89" soundLength="1"/>
	<note id="4" location="97" soundLength="1"/>
	<note id="2" location="105" soundLength="1"/>
	<note id="4" location="109" soundLength="1"/>
	<note id="4" location="113" soundLength="1"/>
	<note id="2" location="117" soundLength="1"/>
	<note id="1" location="121" soundLength="1"/>
</sequance>
<sequance id="99">
<subSequance id="3" location="0" />
<subSequance id="3" location="128" />
<subSequance id="3" location="256" />
<subSequance id="3" location="384" />
</sequance>	
</sequances>
<gestures>
	<gesture name='swipe' sequanceId='1' />
</gestures>
						
</drum>
public function Drum()
{
}
	}
}