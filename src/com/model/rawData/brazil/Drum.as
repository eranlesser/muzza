package com.model.rawData.brazil
{
public class Drum
{
public static var data:XML = 
<drum type="drums" thumbNail='drum.png' spriteSheet="drumsSheet.png">
<bubble x="-100" y="42">
</bubble>
<eyes swfSheet="drumsEyes.png" x="0" y="0" width="410" height="350" >
	<blink start="0" end="4" />
	<blink start="4" end="8" />
	<blink start="9" end="15" />
	<blink start="15" end="16" />
</eyes>							
<components>

<drum image="DRUMS_1_IDLE.png" playImage="DRUMS_1_PRESSED.png" x='150' y='80'>
<tap noteId="B_4" />
</drum>
<drum image="DRUMS_2_IDLE.png" playImage="DRUMS_2_PRESSED.png"  x='60' y='160'>
<tap noteId="C_5" />
</drum>
<drum image="DRUMS_4_IDLE.png" playImage="DRUMS_4_PRESSED.png" x='-60' y='70' >
<tap noteId="C#_5" />
</drum>
</components>
<octaves>
<notes>
	<note id="B_4" value="1" soundFile="brazil/drums/pandero1.mp3" animationIndex='5'  />
	<note id="C_5" value="2" soundFile="brazil/drums/pandero2.mp3" animationIndex='4'  />
	<note id="C#_5" value="4" soundFile="brazil/drums/surdo.mp3" animationIndex='1'  />
</notes>
</octaves>
<sequances>
<sequance id="10">
<note id="B_4" location="17" soundLength="1"/><note id="B_4" location="18" soundLength="1"/><note id="C_5" location="20" soundLength="1"/><note id="C_5" location="21" soundLength="1"/><note id="B_4" location="25" soundLength="1"/><note id="B_4" location="27" soundLength="1"/><note id="C_5" location="29" soundLength="1"/><note id="C_5" location="31" soundLength="1"/><note id="B_4" location="33" soundLength="1"/><note id="B_4" location="34" soundLength="1"/><note id="C_5" location="36" soundLength="1"/><note id="C_5" location="37" soundLength="1"/><note id="B_4" location="41" soundLength="1"/><note id="B_4" location="43" soundLength="1"/><note id="C_5" location="45" soundLength="2"/><note id="C_5" location="47" soundLength="2"/><note id="B_4" location="49" soundLength="1"/><note id="B_4" location="50" soundLength="1"/><note id="C_5" location="52" soundLength="1"/><note id="C_5" location="53" soundLength="1"/><note id="B_4" location="57" soundLength="1"/><note id="B_4" location="59" soundLength="1"/><note id="C_5" location="61" soundLength="2"/><note id="C_5" location="63" soundLength="2"/><note id="B_4" location="65" soundLength="1"/><note id="B_4" location="66" soundLength="1"/><note id="C_5" location="68" soundLength="1"/><note id="C_5" location="69" soundLength="1"/><note id="B_4" location="73" soundLength="1"/><note id="B_4" location="75" soundLength="1"/><note id="C_5" location="77" soundLength="2"/><note id="C_5" location="79" soundLength="2"/><note id="B_4" location="81" soundLength="1"/><note id="B_4" location="82" soundLength="1"/><note id="C_5" location="84" soundLength="1"/><note id="C_5" location="85" soundLength="1"/><note id="B_4" location="89" soundLength="1"/><note id="B_4" location="91" soundLength="1"/><note id="C_5" location="93" soundLength="2"/><note id="C_5" location="95" soundLength="2"/><note id="B_4" location="97" soundLength="1"/><note id="B_4" location="98" soundLength="1"/><note id="C_5" location="100" soundLength="1"/><note id="C_5" location="101" soundLength="1"/><note id="B_4" location="105" soundLength="1"/><note id="B_4" location="107" soundLength="1"/><note id="C_5" location="109" soundLength="2"/><note id="C_5" location="111" soundLength="2"/><note id="B_4" location="113" soundLength="1"/><note id="B_4" location="114" soundLength="1"/><note id="C_5" location="116" soundLength="1"/><note id="C_5" location="117" soundLength="1"/><note id="B_4" location="121" soundLength="1"/><note id="B_4" location="123" soundLength="1"/><note id="C_5" location="125" soundLength="2"/><note id="C_5" location="127" soundLength="2"/><note id="B_4" location="129" soundLength="1"/><note id="B_4" location="130" soundLength="1"/><note id="C_5" location="132" soundLength="1"/><note id="C_5" location="133" soundLength="1"/><note id="B_4" location="137" soundLength="1"/><note id="B_4" location="139" soundLength="1"/><note id="C_5" location="141" soundLength="2"/><note id="C_5" location="143" soundLength="2"/><note id="B_4" location="145" soundLength="1"/><note id="B_4" location="146" soundLength="1"/><note id="C_5" location="148" soundLength="1"/><note id="C_5" location="149" soundLength="1"/><note id="B_4" location="153" soundLength="1"/><note id="B_4" location="155" soundLength="1"/><note id="C_5" location="157" soundLength="2"/><note id="C_5" location="159" soundLength="2"/><note id="B_4" location="161" soundLength="2"/><note id="C_5" location="165" soundLength="2"/><note id="B_4" location="169" soundLength="2"/><note id="C#_5" location="172" soundLength="1"/><note id="C#_5" location="173" soundLength="2"/><note id="C_5" location="175" soundLength="2"/><note id="B_4" location="177" soundLength="1"/><note id="B_4" location="178" soundLength="1"/><note id="C_5" location="180" soundLength="1"/><note id="C_5" location="181" soundLength="1"/><note id="B_4" location="185" soundLength="1"/><note id="B_4" location="187" soundLength="1"/><note id="C_5" location="189" soundLength="2"/><note id="C_5" location="191" soundLength="2"/><note id="B_4" location="193" soundLength="1"/><note id="B_4" location="194" soundLength="1"/><note id="C_5" location="196" soundLength="1"/><note id="C_5" location="197" soundLength="1"/><note id="B_4" location="201" soundLength="1"/><note id="B_4" location="203" soundLength="1"/><note id="C_5" location="205" soundLength="2"/><note id="C_5" location="207" soundLength="2"/><note id="B_4" location="209" soundLength="1"/><note id="B_4" location="210" soundLength="1"/><note id="C_5" location="212" soundLength="1"/><note id="C_5" location="213" soundLength="1"/><note id="B_4" location="217" soundLength="1"/><note id="B_4" location="219" soundLength="1"/><note id="C_5" location="221" soundLength="2"/><note id="C_5" location="223" soundLength="2"/><note id="B_4" location="225" soundLength="1"/><note id="B_4" location="226" soundLength="1"/><note id="C_5" location="228" soundLength="1"/><note id="C_5" location="229" soundLength="1"/><note id="B_4" location="233" soundLength="1"/><note id="B_4" location="235" soundLength="1"/><note id="C_5" location="237" soundLength="2"/><note id="C_5" location="239" soundLength="2"/><note id="B_4" location="241" soundLength="1"/><note id="B_4" location="242" soundLength="1"/><note id="C_5" location="244" soundLength="1"/><note id="C_5" location="245" soundLength="1"/><note id="B_4" location="249" soundLength="1"/><note id="B_4" location="251" soundLength="1"/><note id="C_5" location="253" soundLength="2"/><note id="C_5" location="255" soundLength="2"/><note id="B_4" location="257" soundLength="1"/><note id="B_4" location="258" soundLength="1"/><note id="C_5" location="260" soundLength="1"/><note id="C_5" location="261" soundLength="1"/><note id="B_4" location="265" soundLength="1"/><note id="B_4" location="267" soundLength="1"/><note id="C_5" location="269" soundLength="2"/><note id="C_5" location="271" soundLength="2"/><note id="B_4" location="273" soundLength="1"/><note id="B_4" location="274" soundLength="1"/><note id="C_5" location="276" soundLength="1"/><note id="C_5" location="277" soundLength="1"/><note id="B_4" location="281" soundLength="1"/><note id="B_4" location="283" soundLength="1"/><note id="C_5" location="285" soundLength="2"/><note id="C_5" location="287" soundLength="2"/><note id="B_4" location="289" soundLength="1"/><note id="B_4" location="291" soundLength="1"/><note id="B_4" location="297" soundLength="1"/><note id="B_4" location="299" soundLength="1"/><note id="C_5" location="301" soundLength="2"/><note id="C_5" location="303" soundLength="2"/><note id="B_4" location="305" soundLength="1"/><note id="B_4" location="306" soundLength="1"/><note id="C_5" location="308" soundLength="1"/><note id="C_5" location="309" soundLength="2"/><note id="B_4" location="312" soundLength="1"/><note id="B_4" location="314" soundLength="1"/><note id="C_5" location="316" soundLength="2"/><note id="C_5" location="318" soundLength="2"/><note id="B_4" location="320" soundLength="1"/><note id="B_4" location="321" soundLength="1"/><note id="C_5" location="323" soundLength="1"/><note id="C_5" location="324" soundLength="1"/><note id="B_4" location="328" soundLength="1"/><note id="B_4" location="330" soundLength="1"/><note id="C_5" location="332" soundLength="2"/><note id="C_5" location="334" soundLength="2"/>
</sequance>

<sequance id="99">
	<subSequance id="10" location="16" />
</sequance>
	
</sequances>

</drum>
		public function Drum()
		{
		}
	}
}