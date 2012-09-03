package com.model.rawData
{
	import com.model.rawData.Tutorial.TutorialData;
	import com.model.rawData.beethoven.*;
	import com.model.rawData.brazil.BrazilData;
	import com.model.rawData.edvard.EdvardData;
	import com.model.rawData.jingleBells.JingleBells;
	import com.model.rawData.lennon.LennonData;
	import com.model.rawData.tarab.TarabData;

	public class Data
	{
		public function Data()
		{
		}
		
		public static var xml:XML=
			<data>
			<lessons type="lessons">
				<song name="beethoven" theme="beethoven"  thumbNail="BEETHOVEN_idle.png" clickIcon="BEETHOVEN_Press.png" title="Ode to joy"/>
				<song name="edvard" theme="edvard" thumbNail="edvard_grieg_idle.png" clickIcon="edvard_grieg_press.png" title="In the hall Of the mountain king"  />
				<song name="tarab" theme="tarab" thumbNail="blank.png" clickIcon="blank.png" title="Tarab"  />
				<song name="brazil" theme="brazil" thumbNail="blank.png" clickIcon="blank.png" title="Brazil"  />
				</lessons>
			<musicians>
				<character spriteSheet="bassSheet.png" positionsLength="8" width="250" height="350" />
				<character spriteSheet="bottlesSheet.png" positionsLength="9" width="410" height="460" />
				<character spriteSheet="drumsSheet.png" positionsLength="4" width="410" height="350" />
			</musicians>
			
			</data>
			
		public static function getSongData(songName:String):XML{
			var songData:XML 
			switch(songName){
				case "edvard":
					songData = EdvardData.data;
					//songData = EdvardDataNewLayout.data;
					break;
				case "beethoven":
					songData = BeethovenData.data; 
					break;
				case "lennon":
					songData = LennonData.data;
					break;
				case "jingleBells":
						songData = JingleBells.data;
					break;
				case "tarab":
						songData = TarabData.data;
					break;
				case "brazil":
						songData = BrazilData.data;
					break;
				case "tutorial":
						songData = TutorialData.data;
					break;
				
					
			}
			return songData;
		}
	}
	
	
}