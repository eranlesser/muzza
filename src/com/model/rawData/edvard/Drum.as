package com.model.rawData.edvard
{
	public class Drum
	{
		public static var data:XML = 
<drum type="drums" thumbNail='drum.png' spriteSheet="drumsSheet.png" width="410" height="350" >
<bubble x="-100" y="42">
</bubble>
	<eyes swfSheet="drumsEyes.png" x="0" y="0" width="410" height="350" >
<blink start="0" end="4" />
<blink start="4" end="8" />
<blink start="9" end="15" />
<blink start="15" end="16" />
	</eyes>							
<components recordButtonX="12" recordButtonY="275">

<drum image="drum_2_0001.png" playImage="drum_2_0002.png" x='50' y='280' noteX='33' noteY='-10'>
<tap noteId="4" />
</drum>
<drum image="drum_1_0001.png" playImage="drum_1_0002.png" x='0' y='110' noteX='2' noteY='-5'>
<tap noteId="3" />
</drum>
<drum image="bottle_drum_0001.png" playImage="bottle_drum_0002.png" x='150' y='110' noteX='15' noteY='5'>
<tap noteId="2" />
</drum>
<drum image="metzila_0001.png" playImage="metzila_0002.png" x='80' y='0' noteX='100' noteY='0'>
<tap noteId="1" />
</drum>

</components>
<octaves>
<notes>
<note id="1" value="1" soundFile="edvard/notes/drums/CRASH.mp3" animationIndex='2'   />
<note id="2"  value="2" soundFile="edvard/notes/drums/KICK.mp3" animationIndex='4'  />
<note id="3"  value="3" soundFile="edvard/notes/drums/SNARE.mp3" animationIndex='5'  />
<note id="4" value="4" soundFile="edvard/notes/drums/TOM.mp3" animationIndex='1'  />
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