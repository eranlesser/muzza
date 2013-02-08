package com.model.rawData.ode
{
	public class TurnTableData
	{
		public function TurnTableData()
		{
		}
		
		public static var data:XML = 
<instrument type="turnTable"  thumbNail='turnTable' spriteSheet='ganza.png'>
	
<rawData>
	<vinyl image="Vinyl.png" x="500" y="150" >
		<notes>
			<up noteId="C_5" />
			<down noteId="D_5" />
		</notes>
	</vinyl>
</rawData>
<components  notesGap="110" leftPad="195">
		<bass image="BASS_1_IDLE.png" playImage="BASS_1_SELECTED.png" x='0' y='0'  >
			<tap noteId="C_5" />
		</bass>
		<bass image="BASS_2_IDLE.png" playImage="BASS_2_SELECTED.png" x='150' y='0'  >
			<tap noteId="C_5" />
		</bass>
</components>
			<text>Scrach</text>
			<octaves>
			<notes>
			
			<note id="C_5"   soundFile="ode/scrach/do.mp3" animationIndex='1' value="1" x="0"  />
			<note id="C#_5"   soundFile="ode/scrach/do_diez.mp3" animationIndex='2' value="2" x="0"  />
			<note id="D_5"   soundFile="ode/scrach/re.mp3" animationIndex='3' value="3" x="0"  />
			<note id="E_5"   soundFile="ode/scrach/mi.mp3" animationIndex='4' value="4" x="0"  />
			<note id="G"   soundFile="ode/scrach/sol.mp3" animationIndex='5' value="5" x="0"  />
			</notes>
			</octaves>
			<gestures>
			</gestures>
			<sequances>

			
<sequance id="10">
<note id="C_5" location="160" soundLength="1"/><note id="C#_5" location="172" soundLength="1"/>
<note id="D_5" location="176" soundLength="1"/><note id="E_5" location="180" soundLength="1"/><note id="G" location="188" soundLength="1"/>
<note id="C_5" location="416" soundLength="1"/><note id="C#_5" location="424" soundLength="1"/>
<note id="D_5" location="428" soundLength="1"/><note id="E_5" location="432" soundLength="1"/>
<note id="E_5" location="436" soundLength="1"/><note id="G" location="444" soundLength="1"/>
</sequance>
<sequance id="99">
<subSequance id="10" location="128" />
</sequance>
			</sequances>
			</instrument>
	}
}