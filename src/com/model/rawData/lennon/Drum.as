package com.model.rawData.lennon
{
	public class Drum
	{
		public static var data:XML = <drum type="drums" thumbNail='drum.png' spriteSheet="drumsSheet.png" width="500" height="400">
							<eyes swfSheet="drumsEyes.png" x="217" y="78" width="50" height="30" >
								<blink start="0" end="4" />
								<blink start="6" end="10" />
								<blink start="10" end="14" />
								<blink start="15" end="19" />
								<blink start="19" end="23" />
							</eyes>								
							<components>
							<set image="drumset.jpg" x='5' y='5'>
								<tap noteId="drumset" />
							</set>
							</components>
						<notes>
							<note id="kick" weight="4" value="2" soundFile="lennon/drums/kick2.mp3" animationIndex='3'  />
							<note id="crash" weight="4" value="1" soundFile="lennon/drums/crash.mp3" animationIndex='2'  />
							<note id="tom" weight="4" value="3" soundFile="lennon/drums/tom.mp3" animationIndex='1'  />
							<note id="snare" weight="4" value="4" soundFile="lennon/drums/snare.mp3" animationIndex='4'  />
							
						</notes>
						<sequances>
							<sequance id="1" >
								<note id="kick" location="97" soundLength="1"/>
								<note id="tom" location="113" soundLength="1"/>
								<note id="snare" location="121" soundLength="1"/>
							</sequance>
						<sequance id="2" >
								<note id="kick" location="1" soundLength="1"/>
								<note id="kick" location="9" soundLength="1"/>
								<note id="kick" location="25" soundLength="1"/>
								<note id="tom" location="33" soundLength="1"/>
								<note id="kick" location="41" soundLength="1"/>
								<note id="kick" location="49" soundLength="1"/>
								<note id="tom" location="57" soundLength="1"/>
								<note id="kick" location="65" soundLength="1"/>
								<note id="tom" location="73" soundLength="1"/>
								<note id="kick" location="81" soundLength="1"/>
								<note id="snare" location="89" soundLength="1"/>
								<note id="kick" location="97" soundLength="1"/>
								<note id="tom" location="105" soundLength="1"/>
								<note id="crash" location="113" soundLength="1"/>

							</sequance>
							
			
						</sequances>
						<gestures>
							
						</gestures>
						
					</drum>
		public function Drum()
		{
		}
	}
}