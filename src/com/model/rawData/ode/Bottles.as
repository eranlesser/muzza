package com.model.rawData.ode
{
	public class Bottles
	{
public static var data:XML = <bottles type="bottles" thumbNail='bottles.png' spriteSheet='bottlesSheet.png' >
<eyes swfSheet="bottlesEyes.png" x="0" y="0" width="440" height="460" >
	<blink start="0" end="4" />
	<blink start="4" end="12" />
	<blink start="12" end="16" />
	<blink start="16" end="22" />
	<blink start="22" end="26" />
	<blink start="26" end="31" />
	
</eyes>						
<components notesGap="80" leftPad="80">
<bg image="bottles_frame.png" clickable="false"  y="10" />
<bottle image="bottle_1_idle.png" playImage="bottle_1_SELECTED.png" x='50' y='0' >
	<tap noteId="A_3" />
</bottle>
<bottle image="bottle_2_idle.png" playImage="bottle_2_SELECTED.png" x='130' y='0' >
	<tap noteId="D_4" />
</bottle>
<bottle image="bottle_3_idle.png" playImage="bottle_3_SELECTED.png" x='210' y='0' >
	<tap noteId="E_4" />
</bottle>
<bottle image="bottle_4_idle.png" playImage="bottle_4_SELECTED.png" x='290' y='0' >
	<tap noteId="F#_4" />
</bottle>
<bottle image="bottle_5_idle.png" playImage="bottle_5_SELECTED.png" x='370' y='0' >
	<tap noteId="G_4" />
</bottle>
<bottle image="bottle_6_idle.png" playImage="bottle_6_SELECTED.png" x='450' y='0' >
	<tap noteId="A_4" />
</bottle>
<bottle image="bottle_7_idle.png" playImage="bottle_7_SELECTED.png" x='530' y='0' >
	<tap noteId="7" />
</bottle>
<bottle image="bottle_8_idle.png" playImage="bottle_8_SELECTED.png" x='610' y='0' >
	<tap noteId="8" />
</bottle>
<bottle image="bottle_9_idle.png" playImage="bottle_9_SELECTED.png" x='690' y='0' >
	<tap noteId="9" />
</bottle>
	
</components>

<studio>


</studio>
<octaves>
<notes>
	<note id="A_3"  soundFile="ode/xilofon/la_down.mp3" animationIndex='1' value="1"   />
	<note id="D_4"  soundFile="ode/xilofon/re.mp3" animationIndex='2'  value="2"  />
	<note id="E_4"  soundFile="ode/xilofon/mi.mp3" animationIndex='3'  value="3"/>
	<note id="F#_4"  soundFile="ode/xilofon/fa_diez.mp3" animationIndex='4'  value="4"/>
	<note id="G_4"  soundFile="ode/xilofon/sol.mp3" animationIndex='9'  value="5"/>
	<note id="A_4" soundFile="ode/xilofon/la.mp3" animationIndex='8' value="6" />
	<note id="7" soundFile="brazil/bottle/ci.mp3" animationIndex='7' value="7" />
	<note id="8" soundFile="brazil/bottle/do_up.mp3" animationIndex='6' value="8" />
	<note id="9" soundFile="brazil/bottle/do_up.mp3" animationIndex='5' value="9" />
	
</notes>
</octaves>
<gestures>
</gestures>
<sequances>
<sequance id="1">
	<note id="4" location="1" soundLength="2"/>
	<note id="4" location="9" soundLength="2"/>
	<note id="5" location="17" soundLength="2"/>
	<note id="6" location="25" soundLength="2"/>
	<note id="6" location="33" soundLength="2"/>
	<note id="5" location="41" soundLength="2"/>
	<note id="4" location="49" soundLength="2"/>
	<note id="3" location="57" soundLength="2"/>
</sequance>
<sequance id="2">
	<note id="2" location="65" soundLength="2"/>
	<note id="2" location="73" soundLength="2"/>
	<note id="3" location="81" soundLength="2"/>
	<note id="4" location="89" soundLength="2"/>
	<note id="4" location="97" soundLength="4"/>
	<note id="3" location="113" soundLength="4"/>
</sequance>
<sequance id="3">
	<note id="4" location="1" soundLength="2"/>
	<note id="4" location="9" soundLength="2"/>
	<note id="5" location="17" soundLength="2"/>
	<note id="6" location="25" soundLength="2"/>
	<note id="6" location="33" soundLength="2"/>
	<note id="5" location="41" soundLength="2"/>
	<note id="4" location="49" soundLength="2"/>
	<note id="3" location="57" soundLength="2"/>

	<note id="2" location="65" soundLength="2"/>
	<note id="2" location="73" soundLength="2"/>
	<note id="3" location="81" soundLength="2"/>
	<note id="4" location="89" soundLength="2"/>
	<note id="3" location="97" soundLength="4"/>
	<note id="2" location="113" soundLength="4"/>
</sequance>
<sequance id="4">
	<note id="3" location="1" soundLength="2"/>
	<note id="3" location="9" soundLength="2"/>
	<note id="4" location="17" soundLength="2"/>
	<note id="2" location="25" soundLength="2"/>
	<note id="3" location="33" soundLength="2"/>
	<note id="4" location="41" soundLength="1"/>
	<note id="5" location="45" soundLength="1"/>
	<note id="4" location="49" soundLength="2"/>
	<note id="2" location="57" soundLength="4"/>

	<note id="3" location="65" soundLength="2"/>
	<note id="4" location="73" soundLength="1"/>
	<note id="5" location="77" soundLength="1"/>
	<note id="4" location="81" soundLength="2"/>
	<note id="3" location="89" soundLength="2"/>
	<note id="2" location="97" soundLength="2"/>
	<note id="3" location="105" soundLength="2"/>
	<note id="1" location="113" soundLength="4"/>
</sequance>
<sequance id="5">
	<note id="4" location="1" soundLength="2"/>
	<note id="4" location="9" soundLength="2"/>
	<note id="6" location="33" soundLength="2"/>
	<note id="5" location="41" soundLength="2"/>
	<note id="4" location="49" soundLength="2"/>
	<note id="5" location="17" soundLength="2"/>
	<note id="6" location="25" soundLength="2"/>
	<note id="3" location="57" soundLength="2"/>
	<note id="2" location="65" soundLength="2"/>
	<note id="2" location="73" soundLength="2"/>
	<note id="3" location="81" soundLength="2"/>
	<note id="4" location="89" soundLength="2"/>
	<note id="4" location="97" soundLength="4"/>
	<note id="3" location="113" soundLength="4"/>
</sequance>
<sequance id="10">
<note id="F#_4" location="9" soundLength="1"/>
<note id="A_4" location="12" soundLength="1"/>
<note id="F#_4" location="17" soundLength="2"/><note id="F#_4" location="19" soundLength="2"/>
<note id="G_4" location="21" soundLength="2"/><note id="A_4" location="23" soundLength="2"/>
<note id="A_4" location="25" soundLength="2"/><note id="G_4" location="27" soundLength="2"/>
<note id="F#_4" location="29" soundLength="2"/><note id="E_4" location="31" soundLength="2"/>
<note id="D_4" location="33" soundLength="2"/><note id="D_4" location="35" soundLength="2"/>
<note id="E_4" location="37" soundLength="2"/><note id="F#_4" location="39" soundLength="2"/>
<note id="F#_4" location="41" soundLength="2"/><note id="E_4" location="43" soundLength="2"/>
<note id="E_4" location="45" soundLength="4"/><note id="F#_4" location="49" soundLength="2"/>
<note id="F#_4" location="51" soundLength="2"/><note id="G_4" location="53" soundLength="2"/>
<note id="A_4" location="55" soundLength="2"/><note id="A_4" location="57" soundLength="2"/>
<note id="G_4" location="59" soundLength="2"/><note id="F#_4" location="61" soundLength="2"/>
<note id="E_4" location="63" soundLength="2"/><note id="D_4" location="65" soundLength="2"/>
<note id="D_4" location="67" soundLength="2"/><note id="E_4" location="69" soundLength="2"/>
<note id="F#_4" location="71" soundLength="2"/><note id="E_4" location="73" soundLength="2"/>
<note id="D_4" location="75" soundLength="2"/><note id="D_4" location="77" soundLength="2"/>
	
<note id="E_4" location="81" soundLength="2"/><note id="E_4" location="83" soundLength="2"/>
<note id="F#_4" location="85" soundLength="2"/><note id="D_4" location="87" soundLength="2"/>
<note id="E_4" location="89" soundLength="2"/><note id="F#_4" location="91" soundLength="1"/>
<note id="G_4" location="92" soundLength="1"/><note id="F#_4" location="93" soundLength="2"/>
<note id="D_4" location="95" soundLength="2"/><note id="E_4" location="97" soundLength="2"/>
<note id="F#_4" location="99" soundLength="1"/><note id="G_4" location="100" soundLength="1"/>
<note id="F#_4" location="101" soundLength="2"/><note id="E_4" location="103" soundLength="2"/>
<note id="D_4" location="105" soundLength="2"/><note id="E_4" location="107" soundLength="2"/>
<note id="A_3" location="109" soundLength="4"/><note id="F#_4" location="113" soundLength="2"/>
<note id="F#_4" location="115" soundLength="2"/><note id="G_4" location="117" soundLength="2"/>
<note id="A_4" location="119" soundLength="2"/><note id="A_4" location="121" soundLength="2"/>
<note id="G_4" location="123" soundLength="2"/><note id="F#_4" location="125" soundLength="2"/>
<note id="E_4" location="127" soundLength="2"/><note id="D_4" location="129" soundLength="2"/>
<note id="D_4" location="131" soundLength="2"/><note id="E_4" location="133" soundLength="2"/>
<note id="F#_4" location="135" soundLength="2"/><note id="E_4" location="137" soundLength="2"/>
<note id="D_4" location="139" soundLength="2"/><note id="D_4" location="141" soundLength="4"/>
</sequance>

	
<sequance id="99">
<subSequance id="10" location="32" />
</sequance>
</sequances>
</bottles>
		
	}
}