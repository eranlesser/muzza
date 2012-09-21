package com.model.rawData.brazil
{
	public class Bottles
	{
public static var data:XML = <bottles type="bottles" thumbNail='bottles.png' spriteSheet='bottlesSheet.png' >
<eyes swfSheet="bottlesEyes.png" x="0" y="0" width="410" height="460" >
	<blink start="0" end="4" />
	<blink start="4" end="8" />
	<blink start="9" end="13" />
	<blink start="13" end="17" />
	<blink start="18" end="22" />
</eyes>						
<components>
<bottle image="bottle_1_idle.png" playImage="bottle_1_SELECTED.png" x='0' y='0' >
	<tap noteId="1" />
</bottle>
<bottle image="bottle_2_idle.png" playImage="bottle_2_SELECTED.png" x='80' y='0' >
	<tap noteId="2" />
</bottle>
<bottle image="bottle_3_idle.png" playImage="bottle_3_SELECTED.png" x='160' y='0' >
	<tap noteId="3" />
</bottle>
<bottle image="bottle_4_idle.png" playImage="bottle_4_SELECTED.png" x='240' y='0' >
	<tap noteId="4" />
</bottle>
<bottle image="bottle_5_idle.png" playImage="bottle_5_SELECTED.png" x='320' y='0' >
	<tap noteId="5" />
</bottle>
<bottle image="bottle_6_idle.png" playImage="bottle_6_SELECTED.png" x='400' y='0' >
	<tap noteId="6" />
</bottle>
<bottle image="bottle_7_idle.png" playImage="bottle_7_SELECTED.png" x='470' y='0' >
	<tap noteId="7" />
</bottle>
<bottle image="bottle_8_idle.png" playImage="bottle_8_SELECTED.png" x='540' y='0' >
	<tap noteId="8" />
</bottle>
<bottle image="bottle_9_idle.png" playImage="bottle_9_SELECTED.png" x='620' y='0' >
	<tap noteId="9" />
</bottle>
</components>
<studio>
<background image="backgr_solo.jpg" />
<spotLight image="Spot_light_bottle.png" />
<upLight image="spot_light_floor_bottle.png" />

</studio>
<octaves>
<notes>
	<note id="1"  soundFile="brazil/bottle/sol_down.mp3" animationIndex='1' value="1"   />
	<note id="2"  soundFile="brazil/bottle/sol_diez.mp3" animationIndex='2'  value="2"/>
	<note id="3"  soundFile="brazil/bottle/la_down.mp3" animationIndex='3'  value="3"/>
	<note id="4"  soundFile="brazil/bottle/ci_down.mp3" animationIndex='4'  value="4"  />
	<note id="5" soundFile="brazil/bottle/do.mp3" animationIndex='5' value="5" />
	<note id="6"  soundFile="brazil/bottle/re.mp3" animationIndex='6'  value="6"/>
	<note id="7" soundFile="brazil/bottle/mi.mp3" animationIndex='7' value="7" />
<note id="8" soundFile="brazil/bottle/fa.mp3" animationIndex='6' value="8" />
	<note id="9" soundFile="brazil/bottle/sol.mp3" animationIndex='5' value="9" />
</notes>
</octaves>
<gestures>
</gestures>
<sequances>
<sequance id="99">
</sequance>
</sequances>
</bottles>
		
	}
}