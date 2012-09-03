package com.model.rawData.lennon
{
	public class Bass
	{
		public static var data:XML = <bass type="bass" thumbNail='bass_flash.jpg' spriteSheet='bassSheet.png'  width="250" height="350">
<eyes swfSheet="bassBlink.png" x="0" y="0" width="250" height="350" >
								<blink start="0" end="5" />
							</eyes>	
						<components>
							<bottle image="bottle.JPG" x='5' y='0'>
								<tap noteId="elo2" />
							</bottle>
							<bottle image="bottle.JPG" x='65' y='0'>
								<tap noteId="a2" />
							</bottle>
							<bottle image="bottle.JPG" x='125' y='0'>
								<tap noteId="b2" />
							</bottle>
							<bottle image="bottle.JPG" x='185' y='0'>
								<tap noteId="d2" />
							</bottle>
							
							<bottle image="bottle.JPG" x='245' y='0'>
								<tap noteId="f2" />
							</bottle>
							<bottle image="bottle.JPG" x='305' y='0'>
								<tap noteId="f+12" />
							</bottle>
							<bottle image="bottle.JPG" x='365' y='0'>
								<tap noteId="g2" />
							</bottle>
							<bottle image="bottle.JPG" x='425' y='0'>
								<tap noteId="eho2" />
							</bottle>
			
							
						</components>
<notes>
							<note id="elo2" weight="4" soundFile="lennon/bass/ELO.mp3" animationIndex='1'  value="8"/>
							<note id="a2" weight="4" soundFile="lennon/bass/A.mp3" animationIndex='2' value="5"  />
							<note id="b2" weight="4" soundFile="lennon/bass/B.mp3" animationIndex='3'  value="6"/>
							<note id="d2" weight="4" soundFile="lennon/bass/D.mp3" animationIndex='4' value="7" />
							<note id="f2" weight="4" soundFile="lennon/bass/F.mp3" animationIndex='5'  value="2"/>
							<note id="f+12" weight="4" soundFile="lennon/bass/F+1.mp3" animationIndex='6'  value="3"/>
							<note id="g2" weight="4" soundFile="lennon/bass/G.mp3" animationIndex='7'  value="4"/>
							<note id="eho2" weight="4" soundFile="lennon/bass/EHO.mp3" animationIndex='8'  value="4"/>
						</notes>
						<gestures>
						</gestures>
						<sequances>
							
							<sequance id="1">

<note id="b2" location="33" soundLength="4" />
<note id="b2" location="49" soundLength="4" />
<note id="elo2" location="65" soundLength="4"/>
<note id="elo2" location="81" soundLength="4"/>
<note id="a2" location="97" soundLength="4"/>
<note id="eho2" location="113" soundLength="4"/>
							</sequance>
<sequance id="2">
<note id="a2" location="1" soundLength="4" />
<note id="a2" location="17" soundLength="4" />
<note id="b2" location="33" soundLength="4" />
<note id="b2" location="49" soundLength="4" />
<note id="elo2" location="65" soundLength="4" />
<note id="elo2" location="81" soundLength="4" />
<note id="a2" location="97" soundLength="4" />
<note id="eho2" location="113" soundLength="4" />
							</sequance>
						
			<sequance id="3">
<note id="d2" location="1" soundLength="4" />
<note id="d2" location="17" soundLength="4" />
<note id="eho2" location="33" soundLength="4" />
<note id="eho2" location="49" soundLength="4" />
<note id="a2" location="65" soundLength="4" />
<note id="a2" location="81" soundLength="4" />
<note id="d2" location="97" soundLength="4" />
<note id="eho2" location="113" soundLength="4" />
			</sequance>
<sequance id="4">
<note id="g2" location="1" soundLength="4" />
<note id="g2" location="17" soundLength="4" />
<note id="a2" location="33" soundLength="4" />
<note id="a2" location="49" soundLength="4" />
<note id="elo2" location="65" soundLength="4" />
<note id="elo2" location="81" soundLength="4" />
<note id="d2" location="97" soundLength="4" />
<note id="eho2" location="113" soundLength="4" />
			</sequance>
							
						</sequances>
					</bass>
		public function Bass()
		{
		}
	}
}