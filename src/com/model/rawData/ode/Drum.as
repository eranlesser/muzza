package com.model.rawData.ode
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
<note id="C_6" location="0" soundLength="4"/>
<note id="C#_6" location="8" soundLength="4"/>
<note id="D_6" location="16" soundLength="4"/>
<note id="C#_6" location="24" soundLength="4"/>
<note id="C_6" location="32" soundLength="4"/>
<note id="C_6" location="40" soundLength="4"/>
<note id="D_6" location="48" soundLength="4"/>
<note id="C#_6" location="56" soundLength="4"/>
<note id="C_6" location="64" soundLength="4"/>
<note id="C#_6" location="72" soundLength="4"/>
<note id="D_6" location="80" soundLength="4"/>
<note id="C#_6" location="88" soundLength="4"/>
<note id="C_6" location="96" soundLength="4"/>
<note id="C_6" location="104" soundLength="4"/>
<note id="D_6" location="112" soundLength="4"/>
<note id="C_6" location="128" soundLength="4"/>
<note id="C#_6" location="136" soundLength="4"/>
<note id="D_6" location="144" soundLength="4"/>
<note id="C#_6" location="152" soundLength="4"/>
<note id="C_6" location="160" soundLength="4"/>
<note id="C_6" location="168" soundLength="4"/>
<note id="D_6" location="176" soundLength="4"/>
<note id="C#_6" location="184" soundLength="4"/>
<note id="C_6" location="192" soundLength="4"/>
<note id="C#_6" location="200" soundLength="4"/>
<note id="D_6" location="208" soundLength="4"/>
<note id="C#_6" location="216" soundLength="4"/>
<note id="C_6" location="224" soundLength="4"/>
<note id="C_6" location="232" soundLength="4"/>
<note id="D_6" location="240" soundLength="4"/>
<note id="C_6" location="256" soundLength="4"/>
<note id="C#_6" location="264" soundLength="4"/>
<note id="D_6" location="272" soundLength="4"/>
<note id="C#_6" location="280" soundLength="4"/>
<note id="C_6" location="288" soundLength="4"/>
<note id="C_6" location="296" soundLength="4"/>
<note id="D_6" location="304" soundLength="4"/>
<note id="C#_6" location="312" soundLength="4"/>
<note id="C_6" location="320" soundLength="4"/>
<note id="C#_6" location="328" soundLength="4"/>
<note id="D_6" location="336" soundLength="4"/>
<note id="C#_6" location="344" soundLength="4"/>
<note id="C_6" location="352" soundLength="4"/>
<note id="C_6" location="360" soundLength="4"/>
<note id="D_6" location="368" soundLength="4"/>
<note id="C_6" location="384" soundLength="4"/>
<note id="C#_6" location="392" soundLength="4"/>
<note id="D_6" location="400" soundLength="4"/>
<note id="C#_6" location="408" soundLength="4"/>
<note id="C_6" location="416" soundLength="4"/>
<note id="C_6" location="424" soundLength="4"/>
<note id="D_6" location="432" soundLength="4"/>
<note id="C#_6" location="440" soundLength="4"/>
<note id="C_6" location="448" soundLength="4"/>
<note id="C#_6" location="456" soundLength="4"/>
<note id="D_6" location="464" soundLength="4"/>
<note id="C#_6" location="472" soundLength="4"/>
<note id="C_6" location="480" soundLength="4"/>
<note id="C_6" location="488" soundLength="4"/>
<note id="D_6" location="496" soundLength="4"/>



</sequance>
<sequance id="99">
<subSequance id="10" location="133" />

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