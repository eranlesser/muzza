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
			
			<note id="10"   soundFile="ode/scrach/scrach_1.mp3" animationIndex='3' value="9" x="600" />
			<note id="15"   soundFile="ode/scrach/scrach_5.mp3" animationIndex='3' value="9" x="900"  />
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
<note id="10" location="40" soundLength="1" />


<note id="15" location="104" soundLength="1" />

	</sequance>
<sequance id="99">
<subSequance id="10" location="32" />
</sequance>
			</sequances>
			</instrument>
	}
}