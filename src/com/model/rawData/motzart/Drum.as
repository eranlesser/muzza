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
	
<components notesGap="140" leftPad="275">

<drum image="DRUMS_1_IDLE.png" playImage="DRUMS_1_PRESSED.png" x='0' y='0'>
<tap noteId="B_5" />
</drum>
<drum image="DRUMS_2_IDLE.png" playImage="DRUMS_2_PRESSED.png"  x='140' y='0'>
<tap noteId="C_6" />
</drum>
<drum image="DRUMS_3_IDLE.png" playImage="DRUMS_3_PRESSED.png"  x='280' y='0'>
<tap noteId="c4" />
</drum>
<drum image="DRUMS_4_IDLE.png" playImage="DRUMS_4_PRESSED.png"  x='420' y='0'>
<tap noteId="C#_6" />
</drum>

</components>
<notes>
	<note id="B_5" value="1"  soundFile="mozart/drums/B_4.mp3" animationIndex='5'    />
	<note id="C_6" value="2" soundFile="mozart/drums/C_5.mp3" animationIndex='4'  />
	<note id="c4" value="3" soundFile="mozart/agogo/c4.mp3" animationIndex='2' />
	<note id="C#_6" value="4" soundFile="mozart/drums/C_diez_5.mp3" animationIndex='1' />
</notes>
<sequances>

<!--SEQUANCES-->

<sequance id="10">

 <note id="B_5" location="65" soundLength="12"/>
 <note id="C#_6" location="77" soundLength="4"/>
 <note id="C_6" location="81" soundLength="16"/>
 <note id="B_5" location="97" soundLength="8"/>
 <note id="C#_6" location="105" soundLength="8"/>
 <note id="C_6" location="113" soundLength="8"/>
 <note id="C_6" location="121" soundLength="8"/>
 <note id="B_5" location="129" soundLength="12"/>
 <note id="C#_6" location="141" soundLength="4"/>
 <note id="C_6" location="145" soundLength="32"/>
 <note id="C_6" location="177" soundLength="8"/>
 <note id="C_6" location="185" soundLength="8"/>
 <note id="B_5" location="193" soundLength="12"/>
 <note id="C#_6" location="205" soundLength="4"/>
 <note id="C_6" location="209" soundLength="16"/>
 <note id="B_5" location="225" soundLength="8"/>
 <note id="C#_6" location="233" soundLength="8"/>
 <note id="C_6" location="241" soundLength="8"/>
 <note id="C_6" location="249" soundLength="8"/>
 <note id="B_5" location="257" soundLength="12"/>
 <note id="C#_6" location="269" soundLength="4"/>
 <note id="C_6" location="273" soundLength="16"/>
 <note id="B_5" location="289" soundLength="8"/>
 <note id="C#_6" location="297" soundLength="8"/>
 <note id="C_6" location="305" soundLength="8"/>
 <note id="C_6" location="313" soundLength="8"/>
 <note id="B_5" location="321" soundLength="12"/>
 <note id="C#_6" location="333" soundLength="4"/>
 <note id="C_6" location="337" soundLength="16"/>
 <note id="B_5" location="353" soundLength="8"/>
 <note id="C#_6" location="361" soundLength="8"/>
 <note id="C_6" location="369" soundLength="8"/>
 <note id="C_6" location="377" soundLength="8"/>
 <note id="B_5" location="385" soundLength="12"/>
 <note id="C#_6" location="397" soundLength="4"/>
 <note id="C_6" location="401" soundLength="16"/>
 <note id="B_5" location="417" soundLength="8"/>
 <note id="C#_6" location="425" soundLength="8"/>
 <note id="C_6" location="433" soundLength="8"/>
 <note id="C_6" location="441" soundLength="8"/>
 <note id="B_5" location="449" soundLength="12"/>
 <note id="C#_6" location="461" soundLength="4"/>
 <note id="C_6" location="465" soundLength="16"/>
 <note id="B_5" location="481" soundLength="8"/>
 <note id="C#_6" location="489" soundLength="8"/>
 <note id="C_6" location="497" soundLength="8"/>
 <note id="C_6" location="505" soundLength="8"/>
 <note id="B_5" location="513" soundLength="12"/>
 <note id="C#_6" location="525" soundLength="4"/>
 <note id="C_6" location="529" soundLength="16"/>
 <note id="B_5" location="545" soundLength="8"/>
 <note id="C#_6" location="553" soundLength="8"/>
 <note id="C_6" location="561" soundLength="8"/>
 <note id="C_6" location="569" soundLength="8"/>
 <note id="B_5" location="577" soundLength="12"/>
 <note id="C#_6" location="589" soundLength="4"/>
 <note id="C_6" location="593" soundLength="16"/>
 <note id="B_5" location="609" soundLength="8"/>
 <note id="C#_6" location="617" soundLength="8"/>
 <note id="C_6" location="625" soundLength="8"/>
 <note id="C_6" location="633" soundLength="8"/>
 <note id="B_5" location="641" soundLength="16"/>
 <note id="C_6" location="657" soundLength="16"/>
 <note id="B_5" location="673" soundLength="12"/>
 <note id="C#_6" location="685" soundLength="4"/>
 <note id="C_6" location="689" soundLength="8"/>
 <note id="C_6" location="697" soundLength="8"/>
 <note id="B_5" location="705" soundLength="12"/>
 <note id="C#_6" location="717" soundLength="4"/>
 <note id="C_6" location="721" soundLength="16"/>
 <note id="B_5" location="737" soundLength="8"/>
 <note id="C#_6" location="745" soundLength="8"/>
 <note id="C_6" location="753" soundLength="8"/>
 <note id="C_6" location="761" soundLength="8"/>
 <note id="B_5" location="769" soundLength="12"/>
 <note id="C#_6" location="781" soundLength="4"/>
 <note id="C_6" location="785" soundLength="16"/>
 <note id="B_5" location="801" soundLength="8"/>
 <note id="C#_6" location="809" soundLength="8"/>
 <note id="C_6" location="817" soundLength="8"/>
 <note id="C_6" location="825" soundLength="8"/>
 <note id="B_5" location="833" soundLength="12"/>
 <note id="C#_6" location="845" soundLength="4"/>
 <note id="C_6" location="849" soundLength="16"/>
 <note id="B_5" location="865" soundLength="8"/>
 <note id="C#_6" location="873" soundLength="8"/>
 <note id="C_6" location="881" soundLength="8"/>
 <note id="C_6" location="889" soundLength="8"/>
 <note id="B_5" location="897" soundLength="12"/>
 <note id="C#_6" location="909" soundLength="4"/>
 <note id="C_6" location="913" soundLength="16"/>
 <note id="B_5" location="929" soundLength="8"/>
 <note id="C#_6" location="937" soundLength="8"/>
 <note id="C_6" location="945" soundLength="8"/>
 <note id="C_6" location="953" soundLength="8"/>
 <note id="B_5" location="961" soundLength="12"/>
 <note id="C#_6" location="973" soundLength="4"/>
 <note id="C_6" location="977" soundLength="16"/>
 <note id="B_5" location="993" soundLength="8"/>
 <note id="C#_6" location="1001" soundLength="8"/>
 <note id="C_6" location="1009" soundLength="8"/>
 <note id="C_6" location="1017" soundLength="8"/>
 <note id="B_5" location="1025" soundLength="4"/>
 <note id="C#_6" location="1037" soundLength="4"/>
 <note id="C_6" location="1041" soundLength="4"/>
 <note id="B_5" location="1057" soundLength="4"/>
 <note id="C#_6" location="1065" soundLength="4"/>
 <note id="C_6" location="1073" soundLength="8"/>
 <note id="C_6" location="1081" soundLength="8"/>
 <note id="B_5" location="1089" soundLength="12"/>
 <note id="C#_6" location="1101" soundLength="4"/>
 <note id="C_6" location="1105" soundLength="16"/>
 <note id="B_5" location="1121" soundLength="8"/>
 <note id="C#_6" location="1129" soundLength="8"/>
 <note id="C_6" location="1137" soundLength="8"/>
 <note id="C_6" location="1145" soundLength="8"/>
</sequance>
<sequance id="99">
<subSequance id="10" location="0" />
</sequance>
</sequances>
</drum>
		public function Drum()
		{
		}
	}
}