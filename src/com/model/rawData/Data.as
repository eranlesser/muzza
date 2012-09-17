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
				<song name="beethoven" thumbNail="BETHOVEEN_PICTURE.png"  title="ODE_TO_JOY.png"/>
				<song name="edvard"  thumbNail="EDVARD_GRIEG.png"  title="MOUNTAIN_KING.png"  />
				<song name="jingleBells" thumbNail="JINGLE_BELLS_PICTURE.png"  title="JINGLE_BELLS.png"  />
				<song name="tarab"  thumbNail="MOZART_PICTURE.png"  title="MOUNTAIN_KING.png"  />
				
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