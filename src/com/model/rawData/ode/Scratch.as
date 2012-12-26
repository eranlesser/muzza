package com.model.rawData.ode
{
	public class Scratch
	{
		public function Scratch()
		{
		}
		
		public static var data:XML = 
			<instrument type="pallet" palletType="scratch" thumbNail='scratch' width="22" height="22" spriteSheet='ganza.png'>
<components />
			<text>Scrach</text>
			<octaves>
			<notes>
			<note id="1"   soundFile="ode/scrach/scrach_1.mp3" animationIndex='1' value="1" x="860" rotation="180"  />
			<note id="2"   soundFile="ode/scrach/scrach_2.mp3" animationIndex='2' value="2" x="880" />
			<note id="3"   soundFile="ode/scrach/scrach_3.mp3" animationIndex='3' value="3" x="900"  rotation="180"/>
			<note id="4"   soundFile="ode/scrach/scrach_4.mp3" animationIndex='4' value="4" x="920" />
			<note id="5"   soundFile="ode/scrach/scrach_5.mp3" animationIndex='5' value="5" x="940"  rotation="180"/>
			<note id="6"   soundFile="ode/scrach/scrach_6.mp3" animationIndex='6' value="6" x="960" />
			<note id="7"   soundFile="ode/scrach/scrach_7.mp3" animationIndex='5' value="7" x="980"  rotation="180"/>
			<note id="8"   soundFile="ode/scrach/scrach_8.mp3" animationIndex='4' value="8" x="1000" />
			<note id="9"   soundFile="ode/scrach/scrach_9.mp3" animationIndex='3' value="9" x="1020"  rotation="180"/>
			</notes>
			</octaves>
			<gestures>
			</gestures>
			<sequances>

			<sequance id="1">
<note id="2" location="3" soundLength="1"/>
<note id="3" location="6" soundLength="1"/>
<note id="4" location="8" soundLength="1"/>
<note id="1" location="9" soundLength="1"/>
<note id="2" location="11" soundLength="1"/>
<note id="3" location="14" soundLength="1"/>
<note id="4" location="16" soundLength="1"/>
		</sequance>
<sequance id="10">
<note id="1" location="40" soundLength="1" />
<note id="2" location="43" soundLength="1" />
<note id="3" location="44" soundLength="1" />
<note id="4" location="45" soundLength="1" />

<note id="5" location="104" soundLength="1" />
<note id="6" location="106" soundLength="1" />
<note id="7" location="107" soundLength="1" />
<note id="8" location="108" soundLength="2" />
<note id="9" location="110" soundLength="2" />
	</sequance>
<sequance id="99">
<subSequance id="10" location="16" />
</sequance>
			</sequances>
			</instrument>
	}
}