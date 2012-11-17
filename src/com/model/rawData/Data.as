package com.model.rawData
{
	import com.model.rawData.Tutorial.TutorialData;
	import com.model.rawData.beethoven.*;
	import com.model.rawData.brazil.BrazilData;
	import com.model.rawData.edvard.EdvardData;
	import com.model.rawData.jingleBells.JingleBells;
	import com.model.rawData.lennon.LennonData;
	import com.model.rawData.ode.OdeData;
	import com.model.rawData.somewhere.SomeWhereData;
	import com.model.rawData.tarab.TarabData;

	public class Data
	{
		public function Data()
		{
		}
		
		public static var xml:XML=
			<data>
			<lessons type="lessons">
				<song name="ode" thumbNail="BETHOVEEN_PICTURE.png"  title="ODE_TO_JOY.png"/>
				<song name="brazil"  thumbNail="BRAZIL_PICTURE.png"  title="WATERCOLORS_of_BRAZIL.png"  />
				<song name="edvard"  thumbNail="EDVARD_GRIEG.png"  title="MOUNTAIN_KING.png"  />
<!--
				<song name="jingleBells" thumbNail="JINGLE_BELLS_PICTURE.png"  title="JINGLE_BELLS.png"  />
				<song name="tarab"  thumbNail="Tarab.png"  title="Tarab.png"  />
				<song name="tarab"  thumbNail="MOZART_PICTURE.png"  title="MOZART_PICTURE.png"  />
				<song name="somewhere"  thumbNail="OVER_THE_RAINBOW_pic.png"  title="OVER_THE_RAINBOW.png"  />
			-->	
				</lessons>
			<musicians>
				<character spriteSheet="bassSheet.png" positionsLength="8" width="250" height="350" />
				<character spriteSheet="bottlesSheet.png" positionsLength="9" width="440" height="460" />
				<character spriteSheet="drumsSheet.png" positionsLength="4" width="410" height="350" />
				<character spriteSheet="quika.png" positionsLength="12" width="40" height="38" />
				<character spriteSheet="ganza.png" positionsLength="5" width="40" height="38" />
				<character spriteSheet="agogo.png" positionsLength="5" width="40" height="38" />
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
				case "ode":
					songData = OdeData.data; 
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
				case "somewhere":
						songData = SomeWhereData.data;
					break;
				
					
			}
			return songData;
		}
	}
	
	
}