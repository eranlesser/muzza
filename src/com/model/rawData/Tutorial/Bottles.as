package com.model.rawData.Tutorial
{
	public class Bottles
	{
public static var data:XML = <bottles type="bottles" thumbNail='bottles.png' spriteSheet='bottlesSheet.png'  width="410" height="460" >
<eyes swfSheet="bottlesEyes.png" x="0" y="0" width="410" height="460" >
	<blink start="0" end="4" />
	<blink start="4" end="8" />
	<blink start="9" end="13" />
	<blink start="13" end="17" />
	<blink start="18" end="22" />
</eyes>						
<components recordButtonX="250" recordButtonY="250">
<bottle image="studio_bottle_1_idle.png" playImage="studio_bottle_1_press.png" x='0' y='0' noteX='30' noteY='82'>
	<tap noteId="1" />
</bottle>
<bottle image="studio_bottle_1_idle.png" playImage="studio_bottle_1_press.png" x='80' y='0' noteX='30' noteY='82'>
	<tap noteId="2" />
</bottle>
<bottle image="studio_bottle_1_idle.png" playImage="studio_bottle_1_press.png" x='160' y='0' noteX='30' noteY='82'>
	<tap noteId="3" />
</bottle>

</components>
<studio>
<background image="backgr_solo.jpg" />
<spotLight image="Spot_light_bottle.png" />
<upLight image="spot_light_floor_bottle.png" />

</studio>
<octaves>
<notes>
	<note id="1"  soundFile="beethoven/notes/BOTTLE/ALO.mp3" animationIndex='1' value="1"   />
	<note id="2"  soundFile="beethoven/notes/BOTTLE/D.mp3" animationIndex='2'  value="2"  />
	<note id="3"  soundFile="beethoven/notes/BOTTLE/E.mp3" animationIndex='3'  value="3"/>
	<note id="4"  soundFile="beethoven/notes/BOTTLE/F+1.mp3" animationIndex='4'  value="4"/>
	<note id="5"  soundFile="beethoven/notes/BOTTLE/G.mp3" animationIndex='9'  value="5"/>
	<note id="6" soundFile="beethoven/notes/BOTTLE/A.mp3" animationIndex='8' value="6" />
	<note id="7" soundFile="edvard/notes/bottle/BHO.mp3" animationIndex='7' value="7" />
	<note id="8" soundFile="edvard/notes/bottle/C+1HO.mp3" animationIndex='6' value="8" />
	<note id="9" soundFile="edvard/notes/bottle/DHO.mp3" animationIndex='5' value="9" />
</notes>
</octaves>
<gestures>
</gestures>
<sequances>
<sequance id="1">
	<note id="1" location="1" soundLength="2"/>
	<note id="1" location="9" soundLength="2"/>
	<note id="2" location="17" soundLength="2"/>
	<note id="2" location="25" soundLength="2"/>
	<note id="3" location="33" soundLength="2"/>
	<note id="3" location="41" soundLength="2"/>
	<note id="1" location="49" soundLength="4"/>
</sequance>

<sequance id="99">
<subSequance id="1" location="0" />
</sequance>
</sequances>
</bottles>
		
	}
}