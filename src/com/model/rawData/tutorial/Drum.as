package com.model.rawData.tutorial
{
public class Drum
{
public static var data:XML = 
<drum type="drums" thumbNail='drum.png' spriteSheet="drumsSheet.png">
<eyes swfSheet="drumsEyes.png" x="0" y="0" width="410" height="350" >
	<blink start="0" end="4" />
	<blink start="4" end="8" />
	<blink start="9" end="15" />
	<blink start="15" end="16" />
</eyes>		
	
<components notesGap="140" leftPad="350">

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
<notes>
	<note id="D_6" value="1"  soundFile="ode/drums/snar.mp3" animationIndex='5'    />
	<note id="C_6" value="2" soundFile="ode/drums/bd.mp3" animationIndex='4'  />
	<note id="C#_6" value="3" soundFile="ode/drums/shaker.mp3" animationIndex='2' />
</notes>
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
  <note id="C_6" location="4" soundLength="4"/>
  <note id="C#_6" location="12" soundLength="4"/>
  <note id="D_6" location="20" soundLength="4"/>
  <note id="C_6" location="36" soundLength="4"/>
  <note id="D_6" location="52" soundLength="4"/>
  <note id="C_6" location="68" soundLength="4"/>
  <note id="C#_6" location="76" soundLength="4"/>
  <note id="D_6" location="84" soundLength="4"/>
  <note id="C#_6" location="92" soundLength="4"/>
  <note id="C_6" location="100" soundLength="4"/>
  <note id="C_6" location="108" soundLength="4"/>
  <note id="D_6" location="116" soundLength="4"/>
  <note id="C#_6" location="124" soundLength="4"/>
  <note id="C_6" location="132" soundLength="4"/>
  <note id="C#_6" location="140" soundLength="4"/>
  <note id="D_6" location="148" soundLength="4"/>
  <note id="C#_6" location="156" soundLength="4"/>
  <note id="C_6" location="164" soundLength="4"/>
  
</sequance>
<sequance id="99">
<subSequance id="10" location="64" />

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