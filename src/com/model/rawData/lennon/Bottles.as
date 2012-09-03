package com.model.rawData.lennon
{
	public class Bottles
	{
		public static var data:XML = <bottles type="bottles" thumbNail='bottles.png' spriteSheet='bottlesSheet.png'  width="400" height="400">
<eyes swfSheet="bottlesEyes.png" x="199" y="79" width="40" height="20" >
								<blink start="0" end="4" />
								<blink start="4" end="8" />
								<blink start="9" end="13" />
								<blink start="13" end="17" />
								<blink start="18" end="22" />
							</eyes>						
<components>
							<bottle image="bottle.JPG" x='5' y='0'>
								<tap noteId="b1" />
							</bottle>
							<bottle image="bottle.JPG" x='65' y='0'>
								<tap noteId="c+1" />
							</bottle>
							<bottle image="bottle.JPG" x='125' y='0'>
								<tap noteId="d1" />
							</bottle>
							<bottle image="bottle.JPG" x='185' y='0'>
								<tap noteId="e1" />
							</bottle>
							
							
							<bottle image="bottle.JPG" x='245' y='0'>
								<tap noteId="f+1" />
							</bottle>
							<bottle image="bottle.JPG" x='305' y='0'>
								<tap noteId="g1" />
							</bottle>
							<bottle image="bottle.JPG" x='365' y='0'>
								<tap noteId="g+1" />
							</bottle>
							<bottle image="bottle.JPG" x='425' y='0'>
								<tap noteId="a1" />
							</bottle>
						</components>
						<notes>
							<note id="a1" weight="1" soundFile="lennon/bottle/A.mp3" animationIndex='1' isFlatOrSharp="flat" value="1"  />
							<note id="b1" weight="1" soundFile="lennon/bottle/B.mp3" animationIndex='2' isFlatOrSharp="sharp" value="2"/>
							<note id="c+1" weight="1" soundFile="lennon/bottle/C+1.mp3" animationIndex='3'  value="3"/>
							<note id="d1" weight="1" soundFile="lennon/bottle/D.mp3" animationIndex='4'  value="4"/>
							
							<note id="f+1" weight="1" soundFile="lennon/bottle/F+1.mp3" animationIndex='7' value="6" />
							<note id="e1" weight="1" soundFile="lennon/bottle/E.mp3" animationIndex='9'  value="5"/>
							<note id="g1" weight="1" soundFile="lennon/bottle/G.mp3" animationIndex='6' value="7" />
							<note id="g+1" weight="1" soundFile="lennon/bottle/G+1.mp3" animationIndex='5' value="8" />
						</notes>
						<gestures>
						</gestures>
						<sequances>
<sequance id="1">
<note id="c+1" location="1" soundLength="2" />
<note id="b1" location="9" soundLength="2"/>
<note id="d1" location="17" soundLength="2"/>
<note id="c+1" location="25" soundLength="2" />
			
<note id="d1" location="33" soundLength="2" />
<note id="c+1" location="41" soundLength="2" />
<note id="e1" location="49" soundLength="2" />
<note id="d1" location="57" soundLength="2" />
			
<note id="a1" location="65" soundLength="2" />
<note id="g+1" location="73" soundLength="2" />
<note id="f+1" location="81" soundLength="2" />
<note id="g+1" location="89" soundLength="2" />
<note id="a1" location="97" soundLength="2" />

							</sequance>
							
							
						</sequances>
					</bottles>
		public function Bottles()
		{
		}
	}
}