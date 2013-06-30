package com.model.rawData.motzart
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
<octaves>
<notes>
	<note id="D_6" value="1"  soundFile="ode/drums/snar.mp3" animationIndex='5'    />
	<note id="C_6" value="2" soundFile="ode/drums/bd.mp3" animationIndex='4'  />
	<note id="C#_6" value="3" soundFile="ode/drums/shaker.mp3" animationIndex='2' />
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

<sequance id="10">

 <note id="B_4" location="1" soundLength="4"/>
 <note id="C_5" location="13" soundLength="4"/>
 <note id="C_5" location="17" soundLength="4"/>
 <note id="B_4" location="33" soundLength="4"/>
 <note id="B_4" location="41" soundLength="4"/>
 <note id="C_5" location="49" soundLength="4"/>
 <note id="C_5" location="57" soundLength="4"/>
 <note id="B_4" location="65" soundLength="4"/>
 <note id="C_5" location="77" soundLength="4"/>
 <note id="C_5" location="81" soundLength="4"/>
 <note id="B_4" location="97" soundLength="4"/>
 <note id="B_4" location="105" soundLength="4"/>
 <note id="C_5" location="113" soundLength="8"/>
 <note id="C_5" location="121" soundLength="8"/>
 <note id="B_4" location="129" soundLength="4"/>
 <note id="B_4" location="133" soundLength="4"/>
 <note id="C_5" location="141" soundLength="4"/>
 <note id="C_5" location="145" soundLength="4"/>
 <note id="B_4" location="161" soundLength="4"/>
 <note id="B_4" location="169" soundLength="4"/>
 <note id="C_5" location="177" soundLength="8"/>
 <note id="C_5" location="185" soundLength="8"/>
 <note id="B_4" location="193" soundLength="4"/>
 <note id="C_5" location="205" soundLength="4"/>
 <note id="C_5" location="209" soundLength="4"/>
 <note id="B_4" location="225" soundLength="4"/>
 <note id="B_4" location="233" soundLength="4"/>
 <note id="C_5" location="241" soundLength="8"/>
 <note id="C_5" location="249" soundLength="8"/>
 <note id="B_4" location="257" soundLength="4"/>
 <note id="C_5" location="269" soundLength="4"/>
 <note id="C_5" location="273" soundLength="4"/>
 <note id="B_4" location="289" soundLength="4"/>
 <note id="B_4" location="297" soundLength="4"/>
 <note id="C_5" location="305" soundLength="8"/>
 <note id="C_5" location="313" soundLength="8"/>
 <note id="B_4" location="321" soundLength="4"/>
 <note id="C_5" location="333" soundLength="4"/>
 <note id="C_5" location="337" soundLength="4"/>
 <note id="B_4" location="353" soundLength="4"/>
 <note id="B_4" location="361" soundLength="4"/>
 <note id="C_5" location="369" soundLength="8"/>
 <note id="C_5" location="377" soundLength="8"/>
 <note id="B_4" location="385" soundLength="4"/>
 <note id="C_5" location="397" soundLength="4"/>
 <note id="C_5" location="401" soundLength="4"/>
 <note id="B_4" location="417" soundLength="4"/>
 <note id="B_4" location="425" soundLength="4"/>
 <note id="C_5" location="433" soundLength="8"/>
 <note id="C_5" location="441" soundLength="8"/>
 <note id="B_4" location="449" soundLength="4"/>
 <note id="C_5" location="461" soundLength="4"/>
 <note id="C_5" location="465" soundLength="4"/>
 <note id="B_4" location="481" soundLength="4"/>
 <note id="B_4" location="489" soundLength="4"/>
 <note id="C_5" location="497" soundLength="8"/>
 <note id="C_5" location="505" soundLength="8"/>
 <note id="B_4" location="513" soundLength="4"/>
 <note id="C_5" location="525" soundLength="4"/>
 <note id="C_5" location="529" soundLength="4"/>
 <note id="B_4" location="545" soundLength="4"/>
 <note id="B_4" location="553" soundLength="4"/>
 <note id="C_5" location="561" soundLength="8"/>
 <note id="C_5" location="569" soundLength="8"/>
 <note id="B_4" location="577" soundLength="8"/>
 <note id="C_5" location="593" soundLength="8"/>
 <note id="B_4" location="609" soundLength="8"/>
 <note id="C#_5" location="621" soundLength="4"/>
 <note id="C#_5" location="625" soundLength="8"/>
 <note id="C_5" location="633" soundLength="8"/>
 <note id="B_4" location="641" soundLength="4"/>
 <note id="C_5" location="653" soundLength="4"/>
 <note id="C_5" location="657" soundLength="4"/>
 <note id="B_4" location="673" soundLength="4"/>
 <note id="B_4" location="681" soundLength="4"/>
 <note id="C_5" location="689" soundLength="8"/>
 <note id="C_5" location="697" soundLength="8"/>
 <note id="B_4" location="705" soundLength="4"/>
 <note id="C_5" location="717" soundLength="4"/>
 <note id="C_5" location="721" soundLength="4"/>
 <note id="B_4" location="737" soundLength="4"/>
 <note id="B_4" location="745" soundLength="4"/>
 <note id="C_5" location="753" soundLength="8"/>
 <note id="C_5" location="761" soundLength="8"/>
 <note id="B_4" location="769" soundLength="4"/>
 <note id="C_5" location="781" soundLength="4"/>
 <note id="C_5" location="785" soundLength="4"/>
 <note id="B_4" location="801" soundLength="4"/>
 <note id="B_4" location="809" soundLength="4"/>
 <note id="C_5" location="817" soundLength="8"/>
 <note id="C_5" location="825" soundLength="8"/>
 <note id="B_4" location="833" soundLength="4"/>
 <note id="C_5" location="845" soundLength="4"/>
 <note id="C_5" location="849" soundLength="4"/>
 <note id="B_4" location="865" soundLength="4"/>
 <note id="B_4" location="873" soundLength="4"/>
 <note id="C_5" location="881" soundLength="8"/>
 <note id="C_5" location="889" soundLength="8"/>
 <note id="B_4" location="897" soundLength="4"/>
 <note id="C_5" location="909" soundLength="4"/>
 <note id="C_5" location="913" soundLength="4"/>
 <note id="B_4" location="929" soundLength="4"/>
 <note id="B_4" location="937" soundLength="4"/>
 <note id="C_5" location="945" soundLength="8"/>
 <note id="C_5" location="953" soundLength="8"/>
 <note id="B_4" location="961" soundLength="4"/>
 <note id="C_5" location="973" soundLength="4"/>
 <note id="C_5" location="977" soundLength="4"/>
 <note id="B_4" location="993" soundLength="4"/>
 <note id="B_4" location="1001" soundLength="4"/>
 <note id="C_5" location="1009" soundLength="8"/>
 <note id="C_5" location="1017" soundLength="8"/>
 <note id="B_4" location="1025" soundLength="4"/>
 <note id="C_5" location="1037" soundLength="4"/>
 <note id="C_5" location="1041" soundLength="4"/>
 <note id="B_4" location="1057" soundLength="4"/>
 <note id="B_4" location="1065" soundLength="4"/>
 <note id="C_5" location="1073" soundLength="8"/>
 <note id="C_5" location="1081" soundLength="8"/>
 <note id="B_4" location="1089" soundLength="4"/>
 <note id="B_4" location="1097" soundLength="4"/>
 <note id="B_4" location="1121" soundLength="4"/>
 <note id="B_4" location="1129" soundLength="4"/>
 <note id="C_5" location="1137" soundLength="8"/>
 <note id="C_5" location="1145" soundLength="8"/>
 <note id="B_4" location="1153" soundLength="4"/>
 <note id="C_5" location="1165" soundLength="4"/>
 <note id="C_5" location="1169" soundLength="8"/>
 <note id="B_4" location="1181" soundLength="4"/>
 <note id="B_4" location="1189" soundLength="4"/>
 <note id="C_5" location="1197" soundLength="8"/>
 <note id="C_5" location="1205" soundLength="8"/>
 <note id="B_4" location="1213" soundLength="4"/>
 <note id="C_5" location="1225" soundLength="4"/>
 <note id="C_5" location="1229" soundLength="4"/>
 <note id="B_4" location="1245" soundLength="4"/>
 <note id="B_4" location="1253" soundLength="4"/>
 <note id="C_5" location="1261" soundLength="8"/>
 <note id="C_5" location="1269" soundLength="8"/>
</sequance>
<sequance id="99">

</sequance>
</sequances>
</drum>
		public function Drum()
		{
		}
	}
}