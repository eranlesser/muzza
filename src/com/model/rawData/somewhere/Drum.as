package com.model.rawData.somewhere
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
<tap noteId="3" />
</drum>


</components>
<octaves>
<notes>
	<note id="C_5" value="1"  soundFile="somewhere/drums/tabla.mp3" animationIndex='5'    />
	<note id="C_6" value="2" soundFile="somewhere/drums/tabla1.mp3" animationIndex='4'  />
	<note id="C_7"  value="3" soundFile="somewhere/drums/tabla2.mp3" animationIndex='2' />
</notes>
</octaves>
<sequances>
	<sequance id="10">
<note id="C_5" location="1" soundLength="2"/><note id="C_5" location="5" soundLength="2"/><note id="C_5" location="9" soundLength="2"/><note id="C_5" location="17" soundLength="2"/><note id="C_5" location="25" soundLength="2"/><note id="C_5" location="33" soundLength="2"/><note id="C_5" location="37" soundLength="2"/><note id="C_5" location="41" soundLength="2"/><note id="C_5" location="49" soundLength="2"/><note id="C_5" location="55" soundLength="2"/><note id="C_5" location="57" soundLength="2"/><note id="C_5" location="61" soundLength="2"/><note id="C_5" location="65" soundLength="2"/><note id="C_5" location="69" soundLength="2"/><note id="C_5" location="73" soundLength="2"/><note id="C_5" location="81" soundLength="2"/><note id="C_5" location="89" soundLength="2"/><note id="C_5" location="97" soundLength="2"/><note id="C_5" location="101" soundLength="2"/><note id="C_5" location="105" soundLength="2"/><note id="C_5" location="113" soundLength="2"/><note id="C_5" location="119" soundLength="2"/><note id="C_5" location="121" soundLength="2"/><note id="C_5" location="129" soundLength="2"/><note id="C_5" location="133" soundLength="2"/><note id="C_5" location="137" soundLength="2"/><note id="C_5" location="145" soundLength="2"/><note id="C_5" location="153" soundLength="2"/><note id="C_5" location="161" soundLength="2"/><note id="C_5" location="165" soundLength="2"/><note id="C_5" location="169" soundLength="2"/><note id="C_5" location="177" soundLength="2"/><note id="C_5" location="185" soundLength="2"/><note id="C_5" location="189" soundLength="2"/><note id="C_5" location="193" soundLength="2"/><note id="C_5" location="197" soundLength="2"/><note id="C_5" location="201" soundLength="2"/><note id="C_5" location="209" soundLength="2"/><note id="C_5" location="217" soundLength="2"/><note id="C_5" location="225" soundLength="2"/><note id="C_5" location="229" soundLength="2"/><note id="C_5" location="233" soundLength="2"/><note id="C_5" location="241" soundLength="2"/><note id="C_5" location="249" soundLength="2"/><note id="C_5" location="257" soundLength="2"/><note id="C_5" location="261" soundLength="2"/><note id="C_5" location="265" soundLength="2"/><note id="C_5" location="273" soundLength="2"/><note id="C_5" location="281" soundLength="2"/><note id="C_5" location="289" soundLength="2"/><note id="C_5" location="293" soundLength="2"/><note id="C_5" location="297" soundLength="2"/><note id="C_5" location="305" soundLength="2"/><note id="C_5" location="311" soundLength="2"/><note id="C_5" location="313" soundLength="2"/><note id="C_5" location="317" soundLength="2"/><note id="C_5" location="321" soundLength="2"/><note id="C_5" location="325" soundLength="2"/><note id="C_5" location="329" soundLength="2"/><note id="C_5" location="337" soundLength="2"/><note id="C_5" location="345" soundLength="2"/><note id="C_5" location="353" soundLength="2"/><note id="C_5" location="357" soundLength="2"/><note id="C_5" location="361" soundLength="2"/><note id="C_5" location="369" soundLength="2"/><note id="C_5" location="377" soundLength="2"/><note id="C_5" location="385" soundLength="2"/><note id="C_5" location="389" soundLength="2"/><note id="C_5" location="393" soundLength="2"/><note id="C_5" location="401" soundLength="2"/><note id="C_5" location="409" soundLength="2"/>
		</sequance>
<sequance id="99">
<subSequance id="10" location="0" />
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