package com.model.rawData.ode
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
	
<components notesGap="140" leftPad="50">

<drum image="DRUMS_1_IDLE.png" playImage="DRUMS_1_PRESSED.png" x='0' y='0'>
<tap noteId="D_6" />
</drum>
<drum image="DRUMS_2_IDLE.png" playImage="DRUMS_2_PRESSED.png"  x='140' y='0'>
<tap noteId="C_6" />
</drum>
<drum image="DRUMS_3_IDLE.png" playImage="DRUMS_3_PRESSED.png"  x='280' y='0'>
<tap noteId="C#_6" />
</drum>

</components>
<pallet type="scratchee" sound="claps/claps.mp3" x='380' y='0' />
<octaves>
<notes>
	<note id="D_6" value="1"  soundFile="ode/drums/claps.mp3" animationIndex='5'    />
	<note id="C_6" value="2" soundFile="ode/drums/bd.mp3" animationIndex='4'  />
	<note id="C#_6"  value="3" soundFile="ode/drums/shaker.mp3" animationIndex='2' />
</notes>
</octaves>
<sequances>

	<!--SUBSEQUANCES-->
<sequance id="11">
	<note id="2" location="1" soundLength="2"/>
	<note id="1" location="9" soundLength="2"/>
	<note id="2" location="17" soundLength="1"/>
	<note id="2" location="21" soundLength="1"/>
	<note id="1" location="25" soundLength="2"/>
</sequance>
<!--SEQUANCES-->
<sequance id="1">
	<note id="3" location="1" soundLength="2"/>
	<note id="1" location="9" soundLength="2"/>
	<note id="2" location="17" soundLength="1"/>
	<note id="2" location="21" soundLength="1"/>
	<note id="1" location="25" soundLength="2"/>
	<subSequance id="11" location="32" />
</sequance>
<sequance id="2">
	<subSequance id="11" location="64" />
	<note id="2" location="97" soundLength="2"/>
	<note id="1" location="105" soundLength="2"/>
	<note id="2" location="113" soundLength="1"/>
	<note id="1" location="117" soundLength="1"/>
	<note id="1" location="121" soundLength="2"/>
</sequance>
<sequance id="3">
	<note id="3" location="1" soundLength="2"/>
	<note id="1" location="9" soundLength="2"/>
	<note id="2" location="17" soundLength="1"/>
	<note id="2" location="21" soundLength="1"/>
	<note id="1" location="25" soundLength="2"/>
	<subSequance id="11" location="32" />
	<subSequance id="11" location="64" />
	<note id="2" location="97" soundLength="2"/>
	<note id="1" location="105" soundLength="2"/>
	<note id="2" location="113" soundLength="1"/>
	<note id="1" location="117" soundLength="1"/>
	<note id="1" location="121" soundLength="2"/>
</sequance>
<sequance id="10">
<note id="C_6" location="1" soundLength="1"/><note id="C#_6" location="3" soundLength="1"/><note id="D_6" location="5" soundLength="1"/><note id="C_6" location="9" soundLength="1"/><note id="C_6" location="11" soundLength="1"/><note id="C_6" location="12" soundLength="1"/><note id="D_6" location="13" soundLength="1"/><note id="C_6" location="17" soundLength="1"/><note id="C#_6" location="19" soundLength="1"/><note id="D_6" location="21" soundLength="1"/><note id="C#_6" location="22" soundLength="1"/><note id="C#_6" location="23" soundLength="1"/><note id="C_6" location="24" soundLength="1"/><note id="C_6" location="26" soundLength="1"/><note id="C_6" location="27" soundLength="1"/><note id="D_6" location="29" soundLength="1"/><note id="C#_6" location="30" soundLength="1"/><note id="C#_6" location="31" soundLength="1"/><note id="C_6" location="33" soundLength="1"/><note id="C#_6" location="35" soundLength="1"/><note id="D_6" location="37" soundLength="1"/><note id="C#_6" location="38" soundLength="1"/><note id="C#_6" location="39" soundLength="1"/><note id="C_6" location="40" soundLength="1"/><note id="C_6" location="42" soundLength="1"/><note id="C_6" location="43" soundLength="1"/><note id="D_6" location="45" soundLength="1"/><note id="C#_6" location="46" soundLength="1"/><note id="C#_6" location="47" soundLength="1"/><note id="C_6" location="49" soundLength="1"/><note id="C#_6" location="51" soundLength="1"/><note id="D_6" location="53" soundLength="1"/><note id="C#_6" location="54" soundLength="1"/><note id="C#_6" location="55" soundLength="1"/><note id="C_6" location="56" soundLength="1"/><note id="C_6" location="58" soundLength="1"/><note id="C_6" location="59" soundLength="1"/><note id="D_6" location="61" soundLength="1"/><note id="C#_6" location="62" soundLength="1"/><note id="C#_6" location="63" soundLength="1"/><note id="C_6" location="65" soundLength="1"/><note id="C#_6" location="67" soundLength="1"/><note id="D_6" location="69" soundLength="1"/><note id="C#_6" location="70" soundLength="1"/><note id="C#_6" location="71" soundLength="1"/><note id="C_6" location="72" soundLength="1"/><note id="C_6" location="74" soundLength="1"/><note id="C_6" location="75" soundLength="1"/><note id="D_6" location="77" soundLength="1"/><note id="C#_6" location="79" soundLength="1"/><note id="C_6" location="81" soundLength="1"/><note id="C_6" location="83" soundLength="1"/><note id="D_6" location="85" soundLength="1"/><note id="C#_6" location="86" soundLength="1"/><note id="C#_6" location="87" soundLength="1"/><note id="C_6" location="88" soundLength="1"/><note id="C_6" location="91" soundLength="1"/><note id="D_6" location="93" soundLength="1"/><note id="C#_6" location="94" soundLength="1"/><note id="C#_6" location="95" soundLength="1"/><note id="C_6" location="97" soundLength="1"/><note id="C_6" location="99" soundLength="1"/><note id="D_6" location="101" soundLength="1"/><note id="C#_6" location="102" soundLength="1"/><note id="C#_6" location="103" soundLength="1"/><note id="C_6" location="104" soundLength="1"/><note id="C_6" location="106" soundLength="1"/><note id="C_6" location="107" soundLength="1"/><note id="D_6" location="109" soundLength="1"/><note id="C_6" location="113" soundLength="1"/><note id="C#_6" location="115" soundLength="1"/><note id="D_6" location="117" soundLength="1"/><note id="C#_6" location="118" soundLength="1"/><note id="C#_6" location="119" soundLength="1"/><note id="C_6" location="120" soundLength="1"/><note id="C_6" location="122" soundLength="1"/><note id="C_6" location="123" soundLength="1"/><note id="D_6" location="125" soundLength="1"/><note id="C#_6" location="126" soundLength="1"/><note id="C#_6" location="127" soundLength="1"/><note id="C_6" location="129" soundLength="1"/><note id="C_6" location="131" soundLength="1"/><note id="D_6" location="133" soundLength="1"/><note id="C#_6" location="134" soundLength="1"/><note id="C#_6" location="135" soundLength="1"/><note id="C_6" location="136" soundLength="1"/><note id="C_6" location="138" soundLength="1"/><note id="C_6" location="139" soundLength="1"/><note id="D_6" location="141" soundLength="1"/>
</sequance>
<sequance id="99">
<subSequance id="10" location="16" />

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