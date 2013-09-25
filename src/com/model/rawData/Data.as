package com.model.rawData
{
	import com.model.rawData.edvard.EdvardData;
	import com.model.rawData.motzart.MotzartData;
	import com.model.rawData.ode.OdeData;

	public class Data
	{
		public function Data()
		{
		}
		
		public static var xml:XML=
			<data>
			<lessons type="lessons">
				<song name="edvard"  thumbNail="EDVARD_GRIEG.png"  title="MOUNTAIN_KING.png"  />
				<song name="ode" thumbNail="BETHOVEEN_PICTURE.png"  title="ODE_TO_JOY.png"/>
			<song name="mozart" thumbNail="MOZART_PICTURE.png"  title="ODE_TO_JOY.png"/>
			<!--		<song name="brazil"  thumbNail="BRAZIL_PICTURE.png"  title="WATERCOLORS_of_BRAZIL.png"  />

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
			</musicians>
			
			</data>
			
		public static function getSongData(songName:String):XML{
			var songData:XML 
			switch(songName){
				case "edvard":
					songData = EdvardData.data
					break;
				case "beethoven":
					break;
				case "ode":
					songData = OdeData.data; 
					break;
				case "mozart":
					songData = MotzartData.data;
					break;
				case "jingleBells":
						//songData = JingleBells.data;
					break;
				case "tarab":
				//		songData = TarabData.data;
					break;
				case "brazil":
						//songData = BrazilData.data;
					break;
				case "somewhere":
						//songData = SomeWhereData.data;
					break;
				default:
					throw new Error("songdata missing");
					break;
				
					
			}
			return songData;
		}
	}
	
	
}