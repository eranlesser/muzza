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
<note id="C_4" location="27" soundLength="2"/><note id="G_3" location="31" soundLength="1"/><note id="C_4" location="35" soundLength="2"/><note id="G_3" location="39" soundLength="1"/><note id="C_4" location="43" soundLength="2"/><note id="G_3" location="47" soundLength="1"/><note id="C_4" location="51" soundLength="2"/><note id="G_3" location="55" soundLength="1"/><note id="C_4" location="59" soundLength="2"/><note id="G_3" location="63" soundLength="2"/><note id="C_4" location="67" soundLength="2"/><note id="G_3" location="71" soundLength="1"/><note id="C_4" location="75" soundLength="1"/><note id="G_3" location="79" soundLength="2"/><note id="C_4" location="83" soundLength="2"/><note id="G_3" location="87" soundLength="2"/><note id="E_4" location="89" soundLength="1"/><note id="D_4" location="91" soundLength="2"/><note id="A_3" location="95" soundLength="2"/><note id="D_4" location="99" soundLength="2"/><note id="A_3" location="103" soundLength="2"/><note id="G_3" location="107" soundLength="2"/><note id="D_4" location="111" soundLength="2"/><note id="G_3" location="115" soundLength="2"/><note id="D_4" location="119" soundLength="2"/><note id="G_3" location="123" soundLength="2"/><note id="D_4" location="127" soundLength="2"/><note id="G_3" location="131" soundLength="2"/><note id="D_4" location="135" soundLength="2"/><note id="G_3" location="139" soundLength="2"/><note id="D_4" location="143" soundLength="2"/><note id="G_3" location="147" soundLength="2"/><note id="B_3" location="151" soundLength="2"/><note id="C_4" location="155" soundLength="2"/><note id="G_3" location="159" soundLength="2"/><note id="C_4" location="163" soundLength="2"/><note id="G_3" location="167" soundLength="2"/><note id="D_4" location="170" soundLength="2"/><note id="A_3" location="173" soundLength="2"/><note id="G_3" location="176" soundLength="2"/><note id="D_4" location="180" soundLength="2"/><note id="C_4" location="184" soundLength="2"/><note id="G_3" location="188" soundLength="2"/><note id="C_4" location="192" soundLength="2"/><note id="G_3" location="196" soundLength="1"/><note id="C_4" location="200" soundLength="1"/><note id="G_3" location="204" soundLength="2"/><note id="C_4" location="208" soundLength="2"/><note id="G_3" location="212" soundLength="2"/><note id="E_4" location="214" soundLength="1"/><note id="D_4" location="216" soundLength="2"/><note id="A_3" location="220" soundLength="2"/><note id="D_4" location="224" soundLength="2"/><note id="A_3" location="228" soundLength="2"/><note id="G_3" location="232" soundLength="2"/><note id="D_4" location="236" soundLength="2"/><note id="G_3" location="240" soundLength="2"/><note id="D_4" location="244" soundLength="2"/><note id="E_4" location="246" soundLength="2"/><note id="G_3" location="248" soundLength="2"/><note id="D_4" location="252" soundLength="2"/><note id="G_3" location="256" soundLength="2"/><note id="D_4" location="260" soundLength="2"/><note id="G_3" location="264" soundLength="2"/><note id="D_4" location="268" soundLength="2"/><note id="G_3" location="272" soundLength="2"/><note id="B_3" location="276" soundLength="2"/><note id="C_4" location="280" soundLength="2"/><note id="G_3" location="284" soundLength="2"/><note id="C_4" location="288" soundLength="2"/><note id="G_3" location="292" soundLength="2"/><note id="C_4" location="294" soundLength="2"/><note id="D_4" location="296" soundLength="2"/><note id="A_3" location="299" soundLength="2"/><note id="G_3" location="302" soundLength="2"/><note id="D_4" location="306" soundLength="2"/><note id="C_4" location="310" soundLength="2"/><note id="G_3" location="314" soundLength="1"/><note id="C_4" location="318" soundLength="2"/><note id="G_3" location="322" soundLength="1"/><note id="C_4" location="326" soundLength="2"/><note id="G_3" location="330" soundLength="1"/><note id="C_4" location="334" soundLength="2"/><note id="G_3" location="338" soundLength="1"/>
</sequance>
<sequance id="99">
	<subSequance id="10" location="12" />
	
</sequance>
</sequances>
</bass>
		public function Bass()
		{
		}
	}
}