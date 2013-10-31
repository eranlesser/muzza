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
			<tap noteId="C#_5" />
			</drum>
			<drum image="DRUMS_2_IDLE.png" playImage="DRUMS_2_PRESSED.png"  x='140' y='0'>
			<tap noteId="C_5" />
			</drum>
			<drum image="DRUMS_3_IDLE.png" playImage="DRUMS_3_PRESSED.png"  x='280' y='0'>
			<tap noteId="C#_6" />
			</drum>
			
			</components>
			<notes>
				<note id="B_5" value="1"  soundFile="mozart/drums/B_4.mp3" animationIndex='5'    />
				<note id="C_6" value="2" soundFile="mozart/drums/C_5.mp3" animationIndex='4'  />
				<note id="C#_6" value="3" soundFile="mozart/drums/C_diez_5.mp3" animationIndex='1' />
				<note id="C#_5" value="1" soundFile="mozart/agogo/c_diez4.mp3" animationIndex='5' />
				<note id="C_5" value="2" soundFile="mozart/agogo/c4.mp3" animationIndex='1' />
			</notes>
			<sequances>
			
			<!--SEQUANCES-->
			
			<sequance id="10">
			
			 <note id="C_5" location="65" soundLength="8"/>
			 <note id="C#_5" location="73" soundLength="8"/>
			 <note id="C#_5" location="81" soundLength="4"/>
			 <note id="C_5" location="85" soundLength="8"/>
			 <note id="C_5" location="93" soundLength="4"/>
			 <note id="C_5" location="97" soundLength="8"/>
			 <note id="C#_5" location="105" soundLength="8"/>
			 <note id="C#_5" location="113" soundLength="4"/>
			 <note id="C_5" location="117" soundLength="8"/>
			 <note id="C_5" location="125" soundLength="4"/>
			 <note id="C_5" location="129" soundLength="8"/>
			 <note id="C#_5" location="137" soundLength="8"/>
			 <note id="C#_5" location="145" soundLength="4"/>
			 <note id="C_5" location="149" soundLength="8"/>
			 <note id="C_5" location="157" soundLength="4"/>
			 <note id="C_5" location="161" soundLength="8"/>
			 <note id="C#_5" location="169" soundLength="8"/>
			 <note id="C#_5" location="177" soundLength="4"/>
			 <note id="C_5" location="181" soundLength="8"/>
			 <note id="C_5" location="189" soundLength="4"/>
			 <note id="C_5" location="193" soundLength="8"/>
			 <note id="C#_5" location="201" soundLength="8"/>
			 <note id="C#_5" location="209" soundLength="4"/>
			 <note id="C_5" location="213" soundLength="8"/>
			 <note id="C_5" location="221" soundLength="4"/>
			 <note id="C_5" location="225" soundLength="8"/>
			 <note id="C#_5" location="233" soundLength="8"/>
			 <note id="C#_5" location="241" soundLength="4"/>
			 <note id="C_5" location="245" soundLength="8"/>
			 <note id="C_5" location="253" soundLength="4"/>
			 <note id="C_5" location="257" soundLength="8"/>
			 <note id="C#_5" location="265" soundLength="8"/>
			 <note id="C#_5" location="273" soundLength="4"/>
			 <note id="C_5" location="277" soundLength="8"/>
			 <note id="C_5" location="285" soundLength="4"/>
			 <note id="C_5" location="289" soundLength="8"/>
			 <note id="C#_5" location="297" soundLength="8"/>
			 <note id="C#_5" location="305" soundLength="4"/>
			 <note id="C_5" location="309" soundLength="8"/>
			 <note id="C_5" location="317" soundLength="4"/>
			 <note id="C_5" location="321" soundLength="8"/>
			 <note id="C#_5" location="329" soundLength="8"/>
			 <note id="C#_5" location="337" soundLength="4"/>
			 <note id="C_5" location="341" soundLength="8"/>
			 <note id="C_5" location="349" soundLength="4"/>
			 <note id="C_5" location="353" soundLength="8"/>
			 <note id="C#_5" location="361" soundLength="8"/>
			 <note id="C#_5" location="369" soundLength="4"/>
			 <note id="C_5" location="373" soundLength="8"/>
			 <note id="C_5" location="381" soundLength="4"/>
			 <note id="C_5" location="385" soundLength="8"/>
			 <note id="C#_5" location="393" soundLength="8"/>
			 <note id="C#_5" location="401" soundLength="4"/>
			 <note id="C_5" location="405" soundLength="8"/>
			 <note id="C_5" location="413" soundLength="4"/>
			 <note id="C_5" location="417" soundLength="8"/>
			 <note id="C#_5" location="425" soundLength="8"/>
			 <note id="C#_5" location="433" soundLength="4"/>
			 <note id="C_5" location="437" soundLength="8"/>
			 <note id="C_5" location="445" soundLength="4"/>
			 <note id="C_5" location="449" soundLength="8"/>
			 <note id="C#_5" location="457" soundLength="8"/>
			 <note id="C#_5" location="465" soundLength="4"/>
			 <note id="C_5" location="469" soundLength="8"/>
			 <note id="C_5" location="477" soundLength="4"/>
			 <note id="C_5" location="481" soundLength="4"/>
			 <note id="C#_5" location="489" soundLength="8"/>
			 <note id="C#_5" location="497" soundLength="4"/>
			 <note id="C_5" location="501" soundLength="8"/>
			 <note id="C_5" location="509" soundLength="4"/>
			 <note id="C_5" location="513" soundLength="8"/>
			 <note id="C#_5" location="521" soundLength="8"/>
			 <note id="C#_5" location="529" soundLength="4"/>
			 <note id="C_5" location="533" soundLength="8"/>
			 <note id="C_5" location="541" soundLength="4"/>
			 <note id="C_5" location="545" soundLength="8"/>
			 <note id="C#_5" location="553" soundLength="8"/>
			 <note id="C#_5" location="561" soundLength="4"/>
			 <note id="C_5" location="565" soundLength="8"/>
			 <note id="C_5" location="573" soundLength="4"/>
			 <note id="C_5" location="577" soundLength="8"/>
			 <note id="C#_5" location="585" soundLength="8"/>
			 <note id="C#_5" location="593" soundLength="4"/>
			 <note id="C_5" location="597" soundLength="8"/>
			 <note id="C_5" location="605" soundLength="4"/>
			 <note id="C_5" location="609" soundLength="8"/>
			 <note id="C#_5" location="617" soundLength="8"/>
			 <note id="C#_5" location="625" soundLength="4"/>
			 <note id="C_5" location="629" soundLength="8"/>
			 <note id="C_5" location="637" soundLength="4"/>
			 <note id="C_5" location="641" soundLength="64"/>
			 <note id="C_5" location="705" soundLength="8"/>
			 <note id="C#_5" location="713" soundLength="8"/>
			 <note id="C#_5" location="721" soundLength="4"/>
			 <note id="C_5" location="725" soundLength="8"/>
			 <note id="C_5" location="733" soundLength="4"/>
			 <note id="C_5" location="737" soundLength="8"/>
			 <note id="C#_5" location="745" soundLength="8"/>
			 <note id="C#_5" location="753" soundLength="4"/>
			 <note id="C_5" location="757" soundLength="8"/>
			 <note id="C_5" location="765" soundLength="4"/>
			 <note id="C_5" location="769" soundLength="8"/>
			 <note id="C#_5" location="777" soundLength="8"/>
			 <note id="C#_5" location="785" soundLength="4"/>
			 <note id="C_5" location="789" soundLength="8"/>
			 <note id="C_5" location="797" soundLength="4"/>
			 <note id="C_5" location="801" soundLength="8"/>
			 <note id="C#_5" location="809" soundLength="8"/>
			 <note id="C#_5" location="817" soundLength="4"/>
			 <note id="C_5" location="821" soundLength="8"/>
			 <note id="C_5" location="829" soundLength="4"/>
			 <note id="C_5" location="833" soundLength="8"/>
			 <note id="C#_5" location="841" soundLength="8"/>
			 <note id="C#_5" location="849" soundLength="4"/>
			 <note id="C_5" location="853" soundLength="8"/>
			 <note id="C_5" location="861" soundLength="4"/>
			 <note id="C_5" location="865" soundLength="8"/>
			 <note id="C#_5" location="873" soundLength="8"/>
			 <note id="C#_5" location="881" soundLength="4"/>
			 <note id="C_5" location="885" soundLength="8"/>
			 <note id="C_5" location="893" soundLength="4"/>
			 <note id="C_5" location="897" soundLength="8"/>
			 <note id="C#_5" location="905" soundLength="8"/>
			 <note id="C#_5" location="913" soundLength="4"/>
			 <note id="C_5" location="917" soundLength="8"/>
			 <note id="C_5" location="925" soundLength="4"/>
			 <note id="C_5" location="929" soundLength="8"/>
			 <note id="C#_5" location="937" soundLength="8"/>
			 <note id="C#_5" location="945" soundLength="4"/>
			 <note id="C_5" location="949" soundLength="8"/>
			 <note id="C_5" location="957" soundLength="4"/>
			 <note id="C_5" location="961" soundLength="8"/>
			 <note id="C#_5" location="969" soundLength="8"/>
			 <note id="C#_5" location="977" soundLength="4"/>
			 <note id="C_5" location="981" soundLength="8"/>
			 <note id="C_5" location="989" soundLength="4"/>
			 <note id="C_5" location="993" soundLength="8"/>
			 <note id="C#_5" location="1001" soundLength="8"/>
			 <note id="C#_5" location="1009" soundLength="4"/>
			 <note id="C_5" location="1013" soundLength="8"/>
			 <note id="C_5" location="1021" soundLength="4"/>
			 <note id="C_5" location="1025" soundLength="8"/>
			 <note id="C#_5" location="1033" soundLength="8"/>
			 <note id="C#_5" location="1041" soundLength="4"/>
			 <note id="C_5" location="1045" soundLength="8"/>
			 <note id="C_5" location="1053" soundLength="4"/>
			 <note id="C_5" location="1057" soundLength="8"/>
			 <note id="C#_5" location="1065" soundLength="8"/>
			 <note id="C#_5" location="1073" soundLength="4"/>
			 <note id="C_5" location="1077" soundLength="8"/>
			 <note id="C_5" location="1085" soundLength="4"/>
			 <note id="C_5" location="1089" soundLength="8"/>
			 <note id="C#_5" location="1097" soundLength="8"/>
			 <note id="C#_5" location="1105" soundLength="4"/>
			 <note id="C_5" location="1109" soundLength="8"/>
			 <note id="C_5" location="1117" soundLength="4"/>
			 <note id="C_5" location="1121" soundLength="8"/>
			 <note id="C#_5" location="1129" soundLength="8"/>
			 <note id="C#_5" location="1137" soundLength="4"/>
			 <note id="C_5" location="1141" soundLength="8"/>
			 <note id="C_5" location="1149" soundLength="4"/>
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