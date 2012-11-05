package com.model.rawData.brazil
{
public class Bass
{
public static var data:XML = 
<bass type="bass" thumbNail='bass_flash.jpg' spriteSheet='bassSheet.png'>
<!--<bubble x="-155" y="22">-->
<bubble x="-800" y="22">
</bubble>
	<eyes swfSheet="bassBlink.png" x="0" y="0" width="250" height="350" >
		<blink start="0" end="5" />
	</eyes>	
<components recordButtonX="0" recordButtonY="580">
		
		<bass image="BASS_1_IDLE.png" playImage="BASS_1_SELECTED.png" x='0' y='0'  >
			<tap noteId="G_3" />
		</bass>
		<bass image="BASS_2_IDLE.png" playImage="BASS_2_SELECTED.png" x='120' y='0' >
			<tap noteId="A_3" />
		</bass>
		<bass image="BASS_3_IDLE.png" playImage="BASS_3_SELECTED.png" x='240' y='0'  >
			<tap noteId="B_3" />
		</bass>
		
		<bass image="BASS_4_IDLE.png" playImage="BASS_4_SELECTED.png" x='360' y='0' >
			<tap noteId="C_4" />
		</bass>
		<bass image="BASS_5_IDLE.png" playImage="BASS_5_SELECTED.png" x='360' y='0' >
			<tap noteId="D_4" />
		</bass>
		<bass image="BASS_6_IDLE.png" playImage="BASS_6_SELECTED.png" x='480' y='0'  >
			<tap noteId="E_4" />
		</bass>
		
	</components>
<studio>
<background image="backgr_solo.jpg" />
<spotLight image="bass_spot_lights.png" />
</studio>
<octaves>
<notes>
<note id="G_3"   soundFile="brazil/bass/sol.mp3" animationIndex='1' value="1"  />
<note id="A_3"   soundFile="brazil/bass/la.mp3" animationIndex='2' value="2"  />
<note id="B_3"   soundFile="brazil/bass/ci.mp3" animationIndex='3' value="3"   />
<note id="C_4"   soundFile="brazil/bass/do.mp3" animationIndex='4' value="4"  />
<note id="D_4"   soundFile="brazil/bass/re.mp3" animationIndex='5' value="5"  />
<note id="E_4"   soundFile="brazil/bass/mi.mp3" animationIndex='6' value="6"  />
</notes>
</octaves>
<gestures>
</gestures>
<sequances>
<sequance id="1">
	<note id="4" location="1" soundLength="1"/>
	<note id="1" location="5" soundLength="1"/>
	<note id="4" location="9" soundLength="1"/>
	<note id="1" location="13" soundLength="1"/>
</sequance>
<sequance id="2">
	<note id="5" location="1" soundLength="1"/>
	<note id="2" location="5" soundLength="1"/>
	<note id="5" location="9" soundLength="1"/>
	<note id="2" location="13" soundLength="1"/>
</sequance>
<sequance id="3">
	<note id="1" location="1" soundLength="1"/>
	<note id="5" location="5" soundLength="1"/>
	<note id="1" location="9" soundLength="1"/>
	<note id="5" location="13" soundLength="1"/>
</sequance>
<sequance id="4">
	<note id="1" location="1" soundLength="1"/>
	<note id="5" location="5" soundLength="1"/>
	<note id="1" location="9" soundLength="1"/>
	<note id="3" location="13" soundLength="1"/>
</sequance>
<sequance id="5">
	<note id="5" location="1" soundLength="1"/>
	<note id="2" location="5" soundLength="1"/>
	<note id="1" location="9" soundLength="1"/>
	<note id="5" location="13" soundLength="1"/>
</sequance>
<sequance id="6">
	<note id="4" location="1" soundLength="1"/>
	<note id="1" location="5" soundLength="1"/>
	<note id="4" location="9" soundLength="1"/>
	<note id="1" location="27" soundLength="1"/>
	<note id="6" location="13" soundLength="1"/>
</sequance>
<sequance id="7">
	<note id="1" location="1" soundLength="1"/>
	<note id="5" location="5" soundLength="1"/>
	<note id="1" location="9" soundLength="1"/>
	<note id="5" location="11" soundLength="1"/>
	<note id="6" location="13" soundLength="1"/>
</sequance>
<sequance id="8">
	<note id="4" location="1" soundLength="1"/>
	<note id="1" location="5" soundLength="1"/>
	<note id="4" location="9" soundLength="1"/>
	<note id="1" location="11" soundLength="1"/>
	<note id="4" location="13" soundLength="1"/>
</sequance>
<sequance id="10">
<note id="C_4" location="1" soundLength="2"/><note id="G_3" location="5" soundLength="1"/><note id="C_4" location="9" soundLength="2"/><note id="G_3" location="13" soundLength="1"/><note id="C_4" location="17" soundLength="2"/><note id="G_3" location="21" soundLength="1"/><note id="C_4" location="25" soundLength="2"/><note id="G_3" location="29" soundLength="1"/><note id="C_4" location="33" soundLength="2"/><note id="G_3" location="37" soundLength="2"/><note id="C_4" location="41" soundLength="2"/><note id="G_3" location="45" soundLength="1"/><note id="C_4" location="49" soundLength="1"/><note id="G_3" location="53" soundLength="2"/><note id="C_4" location="57" soundLength="2"/><note id="G_3" location="61" soundLength="2"/><note id="E_4" location="63" soundLength="1"/><note id="D_4" location="65" soundLength="2"/><note id="A_3" location="69" soundLength="2"/><note id="D_4" location="73" soundLength="2"/><note id="A_3" location="77" soundLength="2"/><note id="G_3" location="81" soundLength="2"/><note id="D_4" location="85" soundLength="2"/><note id="G_3" location="89" soundLength="2"/><note id="D_4" location="93" soundLength="2"/><note id="G_3" location="97" soundLength="2"/><note id="D_4" location="101" soundLength="2"/><note id="G_3" location="105" soundLength="2"/><note id="D_4" location="109" soundLength="2"/><note id="G_3" location="113" soundLength="2"/><note id="D_4" location="117" soundLength="2"/><note id="G_3" location="121" soundLength="2"/><note id="B_3" location="125" soundLength="2"/><note id="C_4" location="129" soundLength="2"/><note id="G_3" location="133" soundLength="2"/><note id="C_4" location="137" soundLength="2"/><note id="G_3" location="141" soundLength="2"/><note id="D_4" location="144" soundLength="2"/><note id="A_3" location="147" soundLength="2"/><note id="G_3" location="150" soundLength="2"/><note id="D_4" location="154" soundLength="2"/><note id="C_4" location="158" soundLength="2"/><note id="G_3" location="162" soundLength="2"/><note id="C_4" location="166" soundLength="2"/><note id="G_3" location="170" soundLength="1"/><note id="C_4" location="174" soundLength="1"/><note id="G_3" location="178" soundLength="2"/><note id="C_4" location="182" soundLength="2"/><note id="G_3" location="186" soundLength="2"/><note id="E_4" location="188" soundLength="1"/><note id="D_4" location="190" soundLength="2"/><note id="A_3" location="194" soundLength="2"/><note id="D_4" location="198" soundLength="2"/><note id="A_3" location="202" soundLength="2"/><note id="G_3" location="206" soundLength="2"/><note id="D_4" location="210" soundLength="2"/><note id="G_3" location="214" soundLength="2"/><note id="D_4" location="218" soundLength="2"/><note id="E_4" location="220" soundLength="2"/><note id="G_3" location="222" soundLength="2"/><note id="D_4" location="226" soundLength="2"/><note id="G_3" location="230" soundLength="2"/><note id="D_4" location="234" soundLength="2"/><note id="G_3" location="238" soundLength="2"/><note id="D_4" location="242" soundLength="2"/><note id="G_3" location="246" soundLength="2"/><note id="B_3" location="250" soundLength="2"/><note id="C_4" location="254" soundLength="2"/><note id="G_3" location="258" soundLength="2"/><note id="C_4" location="262" soundLength="2"/><note id="G_3" location="266" soundLength="2"/><note id="C_4" location="268" soundLength="2"/><note id="D_4" location="270" soundLength="2"/><note id="A_3" location="273" soundLength="2"/><note id="G_3" location="276" soundLength="2"/><note id="D_4" location="280" soundLength="2"/><note id="C_4" location="284" soundLength="2"/><note id="G_3" location="288" soundLength="1"/><note id="C_4" location="292" soundLength="2"/><note id="G_3" location="296" soundLength="1"/><note id="C_4" location="300" soundLength="2"/><note id="G_3" location="304" soundLength="1"/><note id="C_4" location="308" soundLength="2"/><note id="G_3" location="312" soundLength="1"/>
</sequance>
<sequance id="99">
	<subSequance id="10" location="0" />
	
</sequance>
</sequances>
</bass>
		public function Bass()
		{
		}
	}
}