package com.model.rawData.ode
{
public class Bass
{
public static var data:XML = 
<bass type="bass" thumbNail='bass_flash.jpg' spriteSheet='bassSheet.png' >
<!--<bubble x="-155" y="22">-->
<bubble x="-800" y="22">
</bubble>
	<eyes swfSheet="bassBlink.png" x="0" y="0" width="250" height="350" >
		<blink start="0" end="5" />
	</eyes>	
<components recordButtonX="0" recordButtonY="580" notesGap="110" leftPad="318">
		<bass image="BASS_1_IDLE.png" playImage="BASS_1_SELECTED.png" x='0' y='0'  >
			<tap noteId="1" />
		</bass>
		
		<bass image="BASS_3_IDLE.png" playImage="BASS_3_SELECTED.png" x='110' y='0'  >
			<tap noteId="2" />
		</bass>
		
		<bass image="BASS_4_IDLE.png" playImage="BASS_4_SELECTED.png" x='220' y='0' >
			<tap noteId="3" />
		</bass>
		<bass image="BASS_5_IDLE.png" playImage="BASS_5_SELECTED.png" x='330' y='0'  >
			<tap noteId="4" />
		</bass>
		<bass image="BASS_6_IDLE.png" playImage="BASS_6_SELECTED.png" x='440' y='0'  >
			<tap noteId="5" />
		</bass>
		<bass image="BASS_7_IDLE.png" playImage="BASS_7_SELECTED.png" x='550' y='0'  >
			<tap noteId="6" />
		</bass>
		
	</components>
<studio>
<background image="backgr_solo.jpg" />
<spotLight image="bass_spot_lights.png" />
</studio>
<octaves>
<notes>
<note id="1"   soundFile="ode/bass/re.mp3" animationIndex='8' value="1"  />
<note id="2"   soundFile="ode/bass/fa.mp3" animationIndex='1' value="2"  />
<note id="3"   soundFile="ode/bass/fa_diez.mp3" animationIndex='2' value="3"  />
<note id="4"   soundFile="ode/bass/sol.mp3" animationIndex='3' value="4"  />
<note id="5"   soundFile="ode/bass/la.mp3" animationIndex='4' value="5"  />
<note id="6"   soundFile="ode/bass/ci.mp3" animationIndex='6' value="6" />
</notes>
</octaves>
<gestures>
</gestures>
<sequances>
<sequance id="11">
	<note id="2" location="1" soundLength="4"/>
	<note id="2" location="17" soundLength="1"/>
	<note id="2" location="21" soundLength="2"/>
	<note id="2" location="33" soundLength="4"/>
	<note id="2" location="49" soundLength="1"/>
	<note id="2" location="53" soundLength="2"/>
</sequance>
<sequance id="1">
	<subSequance id="11" location="64" />
</sequance>
<sequance id="2">
	<note id="2" location="1" soundLength="4"/>
	<note id="2" location="17" soundLength="1"/>
	<note id="2" location="21" soundLength="2"/>
	<note id="4" location="33" soundLength="4"/>
	<note id="4" location="49" soundLength="1"/>
	<note id="4" location="53" soundLength="1"/>
	<note id="3" location="57" soundLength="2"/>
	<note id="2" location="65" soundLength="4"/>
	<note id="1" location="81" soundLength="4"/>
	<note id="1" location="97" soundLength="4"/>
	<note id="4" location="113" soundLength="4"/>
</sequance>
<sequance id="3">
	<note id="2" location="1" soundLength="4"/>
	<note id="6" location="17" soundLength="1"/>
	<note id="6" location="21" soundLength="2"/>
	<note id="3" location="33" soundLength="4"/>
	<note id="3" location="49" soundLength="1"/>
	<note id="3" location="53" soundLength="2"/>
	<note id="4" location="65" soundLength="4"/>
	<note id="4" location="81" soundLength="1"/>
	<note id="4" location="85" soundLength="2"/>
	<note id="4" location="97" soundLength="4"/>
	<note id="2" location="113" soundLength="4"/>
	
		</sequance>
	<sequance id="4">
	<note id="4" location="1" soundLength="4"/>
	<note id="4" location="13" soundLength="1"/>
	<note id="4" location="17" soundLength="2"/>
	<note id="4" location="33" soundLength="4"/>
	<note id="4" location="45" soundLength="1"/>
	<note id="4" location="49" soundLength="2"/>
	<note id="4" location="65" soundLength="4"/>
	<note id="4" location="77" soundLength="1"/>
	<note id="5" location="81" soundLength="2"/>
	<note id="2" location="89" soundLength="2"/>
	<note id="6" location="97" soundLength="2"/>
	<note id="1" location="105" soundLength="2"/>
	<note id="4" location="113" soundLength="4"/>
	
		</sequance>
	<sequance id="5">
	<note id="2" location="1" soundLength="4"/>
	<note id="6" location="17" soundLength="1"/>
	<note id="6" location="21" soundLength="2"/>
	<note id="3" location="33" soundLength="4"/>
	<note id="3" location="49" soundLength="1"/>
	<note id="3" location="53" soundLength="2"/>
	<note id="4" location="65" soundLength="4"/>
	<note id="4" location="81" soundLength="1"/>
	<note id="4" location="85" soundLength="2"/>
	<note id="4" location="97" soundLength="2"/>
	<note id="2" location="113" soundLength="4"/>
	
		</sequance>
<sequance id="10">
<note id="1" location="17" soundLength="4"/>
<note id="3" location="21" soundLength="2"/>
<note id="6" location="23" soundLength="2"/>
<note id="5" location="25" soundLength="4"/>
<note id="3" location="29" soundLength="4"/>
<note id="1" location="33" soundLength="4"/>
<note id="3" location="37" soundLength="2"/>
<note id="1" location="39" soundLength="2"/>
<note id="5" location="41" soundLength="4"/>
<note id="4" location="45" soundLength="2"/>
<note id="5" location="47" soundLength="2"/>
<note id="1" location="49" soundLength="4"/>
<note id="3" location="53" soundLength="2"/>
<note id="6" location="55" soundLength="2"/>
<note id="5" location="57" soundLength="4"/>
<note id="4" location="61" soundLength="2"/>
<note id="3" location="63" soundLength="2"/>
<note id="1" location="65" soundLength="4"/>
<note id="2" location="69" soundLength="2"/>
<note id="3" location="71" soundLength="2"/>
<note id="5" location="73" soundLength="4"/>
<note id="1" location="77" soundLength="4"/>
<note id="5" location="81" soundLength="4"/>
<note id="5" location="87" soundLength="2"/>
<note id="5" location="89" soundLength="2"/>
<note id="5" location="95" soundLength="2"/>
<note id="5" location="97" soundLength="2"/>
<note id="5" location="103" soundLength="2"/>
<note id="6" location="105" soundLength="2"/>
<note id="2" location="107" soundLength="2"/>
<note id="5" location="109" soundLength="1"/>
<note id="4" location="110" soundLength="1"/>
<note id="3" location="111" soundLength="1"/>
<note id="2" location="112" soundLength="1"/>
<note id="1" location="113" soundLength="4"/>
<note id="3" location="117" soundLength="2"/>
<note id="6" location="119" soundLength="4"/>
<note id="5" location="121" soundLength="2"/>
<note id="4" location="125" soundLength="2"/>
<note id="3" location="127" soundLength="2"/>
<note id="1" location="129" soundLength="4"/>
<note id="2" location="133" soundLength="2"/>
<note id="3" location="135" soundLength="2"/>
<note id="5" location="137" soundLength="2"/>
<note id="2" location="139" soundLength="2"/>
<note id="1" location="141" soundLength="4"/>

</sequance>
<sequance id="99">
<subSequance id="10" location="32" />

</sequance>
</sequances>
</bass>
		public function Bass()
		{
		}
	}
}