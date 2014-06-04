package com.model.rawData.ode
{
	public class Bottles
	{
public static var data:XML = <bottles type="bottles" thumbNail='bottles.png' spriteSheet='bottlesSheet.png' >
<eyes swfSheet="bottlesEyes.png" x="0" y="0" width="440" height="460" >
	<blink start="0" end="4" />
	<blink start="4" end="12" />
	<blink start="12" end="16" />
	<blink start="16" end="22" />
	<blink start="22" end="26" />
	<blink start="26" end="31" />
	
</eyes>						
<components notesGap="80" leftPad="179">
<bg image="bottles_frame.png" clickable="false"  y="10" />
<bottle image="bottle_1_idle.png" playImage="bottle_1_SELECTED.png" x='50' y='0' >
	<tap noteId="A_3" />
</bottle>
<bottle image="bottle_2_idle.png" playImage="bottle_2_SELECTED.png" x='130' y='0' >
	<tap noteId="D_4" />
</bottle>
<bottle image="bottle_3_idle.png" playImage="bottle_3_SELECTED.png" x='210' y='0' >
	<tap noteId="E_4" />
</bottle>
<bottle image="bottle_4_idle.png" playImage="bottle_4_SELECTED.png" x='290' y='0' >
	<tap noteId="F#_4" />
</bottle>
<bottle image="bottle_5_idle.png" playImage="bottle_5_SELECTED.png" x='370' y='0' >
	<tap noteId="G_4" />
</bottle>
<bottle image="bottle_6_idle.png" playImage="bottle_6_SELECTED.png" x='450' y='0' >
	<tap noteId="A_4" />
</bottle>
<bottle image="bottle_7_idle.png" playImage="bottle_7_SELECTED.png" x='530' y='0' >
	<tap noteId="7" />
</bottle>
<bottle image="bottle_8_idle.png" playImage="bottle_8_SELECTED.png" x='610' y='0' >
	<tap noteId="8" />
</bottle>
<bottle image="bottle_9_idle.png" playImage="bottle_9_SELECTED.png" x='690' y='0' >
	<tap noteId="9" />
</bottle>
	
</components>

<studio>


</studio>
<notes>
	<note id="A_3"  soundFile="ode/xilofon/la_down.mp3" animationIndex='1' value="1"   />
	<note id="D_4"  soundFile="ode/xilofon/re.mp3" animationIndex='2'  value="2"  />
	<note id="E_4"  soundFile="ode/xilofon/mi.mp3" animationIndex='3'  value="3"/>
	<note id="F#_4"  soundFile="ode/xilofon/fa_diez.mp3" animationIndex='4'  value="4"/>
	<note id="G_4"  soundFile="ode/xilofon/sol.mp3" animationIndex='9'  value="5"/>
	<note id="A_4" soundFile="ode/xilofon/la.mp3" animationIndex='8' value="6" />
	<note id="7" soundFile="ode/xilofon/ci.mp3" animationIndex='7' value="7" />
	<note id="8" soundFile="ode/xilofon/do_diez_up.mp3" animationIndex='6' value="8" />
	<note id="9" soundFile="ode/xilofon/re_up.mp3" animationIndex='5' value="9" />
	
</notes>
<sequances>
<sequance id="10">
  <note id="F#_4" location="4" soundLength="4"/>
  <note id="E_4" location="20" soundLength="4"/>
  <note id="F#_4" location="36" soundLength="4"/>
  <note id="A_4" location="44" soundLength="4"/>
  <note id="E_4" location="52" soundLength="4"/>
  <note id="F#_4" location="68" soundLength="8"/>
  <note id="F#_4" location="76" soundLength="8"/>
  <note id="G_4" location="84" soundLength="8"/>
  <note id="A_4" location="92" soundLength="8"/>
  <note id="A_4" location="100" soundLength="8"/>
  <note id="G_4" location="108" soundLength="8"/>
  <note id="F#_4" location="116" soundLength="8"/>
  <note id="E_4" location="124" soundLength="8"/>
  <note id="D_4" location="132" soundLength="8"/>
  <note id="D_4" location="140" soundLength="8"/>
  <note id="E_4" location="148" soundLength="8"/>
  <note id="F#_4" location="156" soundLength="8"/>
  <note id="F#_4" location="164" soundLength="8"/>
  <note id="E_4" location="172" soundLength="8"/>
  <note id="E_4" location="180" soundLength="16"/>
  <note id="F#_4" location="196" soundLength="8"/>
  <note id="F#_4" location="204" soundLength="8"/>
  <note id="G_4" location="212" soundLength="8"/>
  <note id="A_4" location="220" soundLength="8"/>
  <note id="A_4" location="228" soundLength="8"/>
  <note id="G_4" location="236" soundLength="8"/>
  <note id="F#_4" location="244" soundLength="8"/>
  <note id="E_4" location="252" soundLength="8"/>
  <note id="D_4" location="260" soundLength="8"/>
  <note id="D_4" location="268" soundLength="8"/>
  <note id="E_4" location="276" soundLength="8"/>
  <note id="F#_4" location="284" soundLength="8"/>
  <note id="E_4" location="292" soundLength="8"/>
  <note id="D_4" location="300" soundLength="8"/>
  <note id="D_4" location="308" soundLength="8"/>
  <note id="E_4" location="324" soundLength="8"/>
  <note id="E_4" location="332" soundLength="8"/>
  <note id="F#_4" location="340" soundLength="8"/>
  <note id="D_4" location="348" soundLength="8"/>
  <note id="E_4" location="356" soundLength="8"/>
  <note id="F#_4" location="364" soundLength="4"/>
  <note id="G_4" location="368" soundLength="4"/>
  <note id="F#_4" location="372" soundLength="8"/>
  <note id="D_4" location="380" soundLength="8"/>
  <note id="E_4" location="388" soundLength="8"/>
  <note id="F#_4" location="396" soundLength="4"/>
  <note id="G_4" location="400" soundLength="4"/>
  <note id="F#_4" location="404" soundLength="8"/>
  <note id="E_4" location="412" soundLength="8"/>
  <note id="D_4" location="420" soundLength="8"/>
  <note id="E_4" location="428" soundLength="8"/>
  <note id="A_3" location="436" soundLength="16"/>
  <note id="F#_4" location="452" soundLength="8"/>
  <note id="F#_4" location="460" soundLength="8"/>
  <note id="G_4" location="468" soundLength="8"/>
  <note id="A_4" location="476" soundLength="8"/>
  <note id="A_4" location="484" soundLength="8"/>
  <note id="G_4" location="492" soundLength="8"/>
  <note id="F#_4" location="500" soundLength="8"/>
  <note id="E_4" location="508" soundLength="8"/>
  <note id="D_4" location="516" soundLength="8"/>
  <note id="D_4" location="524" soundLength="8"/>
  <note id="E_4" location="532" soundLength="8"/>
  <note id="F#_4" location="540" soundLength="8"/>
  <note id="E_4" location="548" soundLength="8"/>
  <note id="D_4" location="556" soundLength="8"/>
  <note id="D_4" location="564" soundLength="16"/>
</sequance>

	
<sequance id="99">
<subSequance id="10" location="64" />
</sequance>
</sequances>
</bottles>
		
	}
}