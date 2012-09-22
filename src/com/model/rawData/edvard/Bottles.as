package com.model.rawData.edvard
{
	public class Bottles
	{
		public function Bottles()
		{
		}
		public static var data:XML = 
<bottles type="bottles" thumbNail='bottles.png' spriteSheet='bottlesSheet.png' >
<eyes swfSheet="bottlesEyes.png" x="0" y="0" width="440" height="460" >
<blink start="0" end="4" />
	<blink start="4" end="12" />
	<blink start="12" end="16" />
	<blink start="16" end="22" />
	<blink start="22" end="26" />
	<blink start="26" end="31" />
	<blink start="31" end="34" />
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
<octaves>
<notes>
	<note id="1"  soundFile="edvard/notes/bottle/B.mp3" animationIndex='1' value="1"   />
	<note id="2"  soundFile="edvard/notes/bottle/C.mp3" animationIndex='2'  value="2"  />
	<note id="3"  soundFile="edvard/notes/bottle/C+1.mp3" animationIndex='2'  value="3"  />
	<note id="4"  soundFile="edvard/notes/bottle/D.mp3" animationIndex='3'  value="4"/>
	<note id="5"  soundFile="edvard/notes/bottle/E.mp3" animationIndex='4'  value="5"/>
	<note id="6"  soundFile="edvard/notes/bottle/F.mp3" animationIndex='9'  value="6"/>
	<note id="7" soundFile="edvard/notes/bottle/F+1.mp3" animationIndex='7' value="7" />
	<note id="8" soundFile="edvard/notes/bottle/A.mp3" animationIndex='6' value="8" />
	<note id="9" soundFile="edvard/notes/bottle/BHO.mp3" animationIndex='5' value="9" />
</notes>
<notes>
	<note id="1"  soundFile="edvard/notes/bottle/F+1.mp3" animationIndex='1' value="1"   />
	<note id="2"  soundFile="edvard/notes/bottle/G+1.mp3" animationIndex='2'  value="2"  />
	<note id="3"  soundFile="edvard/notes/bottle/A+1.mp3" animationIndex='3'  value="3"/>
	<note id="4"  soundFile="edvard/notes/bottle/BHO.mp3" animationIndex='4'  value="4"/>
	<note id="5"  soundFile="edvard/notes/bottle/BHO.mp3" animationIndex='9'  value="5"/>
	<note id="6" soundFile="edvard/notes/bottle/C+1HO.mp3" animationIndex='7' value="6" />
	<note id="7" soundFile="edvard/notes/bottle/DHO.mp3" animationIndex='6' value="7" />
	<note id="8" soundFile="edvard/notes/bottle/DHO.mp3" animationIndex='5' value="8" />
	<note id="9" soundFile="edvard/notes/bottle/D+1.mp3" animationIndex='5' value="9" />
</notes>
</octaves>
<gestures>
</gestures>
<sequances>
	<sequance id="11">
		<note octave="0" id="1" location="1" soundLength="1"/>
		<note octave="0" id="3" location="5" soundLength="1"/>
		<note octave="0" id="4" location="9" soundLength="1"/>
		<note octave="0" id="5" location="13" soundLength="1"/>
		<note octave="0" id="7" location="17" soundLength="1"/>
		<note octave="0" id="4" location="21" soundLength="1"/>
		<note octave="0" id="7" location="25" soundLength="2"/>
	</sequance>
	<sequance id="12">
		<note octave="0" id="6" location="1" soundLength="1"/>
		<note octave="0" id="3" location="5" soundLength="1"/>
		<note octave="0" id="6" location="9" soundLength="2"/>
		<note octave="0" id="5" location="17" soundLength="1"/>
		<note octave="0" id="3" location="21" soundLength="1"/>
		<note octave="0" id="5" location="25" soundLength="2"/>
	</sequance>
	<sequance id="13">
		<note octave="0" id="1" location="1" soundLength="1"/>
		<note octave="0" id="3" location="5" soundLength="1"/>
		<note octave="0" id="4" location="9" soundLength="1"/>
		<note octave="0" id="5" location="13" soundLength="1"/>
		<note octave="0" id="7" location="17" soundLength="1"/>
		<note octave="0" id="4" location="21" soundLength="1"/>
		<note octave="0" id="7" location="25" soundLength="1"/>
	</sequance>
	<sequance id="14">	
		<note octave="0" id="9" location="1" soundLength="1"/>
		<note octave="0" id="8" location="5" soundLength="1"/>
		<note octave="0" id="7" location="9" soundLength="1"/>
		<note octave="0" id="4" location="13" soundLength="1"/>
		<note octave="0" id="7" location="17" soundLength="1"/>
		<note octave="0" id="8" location="21" soundLength="4"/>						
	</sequance>
	<sequance id="15">
		<subSequance id="11" location="0" />
		<subSequance id="12" location="32" />
		<subSequance id="13" location="64"/>
		<subSequance id="14" location="92"/>
	</sequance>
	<sequance id="20">	
		<note octave="0" id="9" location="1" soundLength="1"/>
		<note octave="0" id="7" location="5" soundLength="1"/>
		<note octave="0" id="1" location="9" soundLength="1"/>
		<note octave="0" id="7" location="13" soundLength="1"/>
		<note octave="0" id="9" location="17" soundLength="1"/>
		<note octave="0" id="1" location="21" soundLength="4"/>						
	</sequance>
	<sequance id="21">
		<subSequance id="11" location="0" />
		<subSequance id="12" location="32" />
		<subSequance id="13" location="64"/>
		<subSequance id="20" location="92"/>
	</sequance>


<!--     OCTAVE II        -->
	
	<sequance id="31">
		<note octave="1" id="1" location="1" soundLength="1"/>
		<note octave="1" id="2" location="5" soundLength="1"/>
		<note octave="1" id="3" location="9" soundLength="1"/>
		<note octave="1" id="4" location="13" soundLength="1"/>
		<note octave="1" id="6" location="17" soundLength="1"/>
		<note octave="1" id="3" location="21" soundLength="1"/>
		<note octave="1" id="6" location="25" soundLength="2"/>
	</sequance>
	<sequance id="32">
		<note octave="1" id="8" location="1" soundLength="1"/>
		<note octave="1" id="5" location="5" soundLength="1"/>
		<note octave="1" id="8" location="9" soundLength="2"/>
		<note octave="1" id="6" location="17" soundLength="1"/>
		<note octave="1" id="3" location="21" soundLength="1"/>
		<note octave="1" id="6" location="25" soundLength="2"/>
	</sequance>
	<sequance id="42">
		<note octave="1" id="9" location="1" soundLength="1"/>
		<note octave="1" id="5" location="5" soundLength="1"/>
		<note octave="1" id="9" location="9" soundLength="2"/>
		<note octave="1" id="6" location="17" soundLength="1"/>
		<note octave="1" id="3" location="21" soundLength="1"/>
		<note octave="1" id="6" location="25" soundLength="2"/>
	</sequance>
	<sequance id="33">
		<note octave="1" id="1" location="1" soundLength="1"/>
		<note octave="1" id="2" location="5" soundLength="1"/>
		<note octave="1" id="3" location="9" soundLength="1"/>
		<note octave="1" id="4" location="13" soundLength="1"/>
		<note octave="1" id="6" location="17" soundLength="1"/>
		<note octave="1" id="3" location="21" soundLength="1"/>
		<note octave="1" id="6" location="25" soundLength="1"/>
	</sequance>
	<sequance id="34">	
		<note octave="1" id="8" location="1" soundLength="1"/>
		<note octave="1" id="5" location="5" soundLength="1"/>
		<note octave="1" id="8" location="9" soundLength="1"/>
		<note octave="1" id="6" location="17" soundLength="4"/>
	</sequance>
	<sequance id="44">	
		<note octave="1" id="9" location="1" soundLength="1"/>
		<note octave="1" id="5" location="5" soundLength="1"/>
		<note octave="1" id="9" location="9" soundLength="1"/>
		<note octave="1" id="6" location="17" soundLength="4"/>
	</sequance>
	<sequance id="45">
		<subSequance id="31" location="0" />
		<subSequance id="32" location="32" />
		<subSequance id="33" location="64"/>
		<subSequance id="34" location="96"/>
	</sequance>
	<sequance id="46">
		<subSequance id="31" location="0" />
		<subSequance id="42" location="32" />
		<subSequance id="33" location="64"/>
		<subSequance id="44" location="96"/>
	</sequance>
		
			
			
			
			
			
<sequance id="99">
	<subSequance id="15" location="0" />
	<subSequance id="45" location="128" />
	<subSequance id="46" location="256" />
	<subSequance id="21" location="384" />
</sequance>
			
</sequances>
</bottles>
		
	}
}