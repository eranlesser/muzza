package com.musicalInstruments
{
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.view.character.Character;
	import com.musicalInstruments.view.character.Musician;

	/**
	 * 
	 * @author eranlesser
	 * For performnce reasons the characters don't need to be recreated on each screen
	 * they are created once for each theme and are fetched via the Band
	 * currently only used in playscreen where performance was so so.
	 */	
	public class Band{
		
		private static var _instance:Band;
		private var _characters:Vector.<Character>;
		
		public function Band(){
			_characters = new Vector.<Character>();
		}
		
		public static function get instance():Band{
			if(!_instance){
				_instance = new Band();
			}
			return _instance;
		}
		
		public function initCharacter(character:Character):void{
			if(_characters.indexOf(character)>=0){
				throw new Error("character init error");
			}
			_characters.push(character);
		}
		
		public function getCharacter(mdl:NotesInstrumentModel):Character{
			var character:Character;
			for each(var char:Character in _characters){
				if(char.spriteSheetUrl==mdl.spriteSheet){
					return char;
				}
			}
			character=new Character(mdl.spriteSheet ,mdl.notesLength,mdl.width,mdl.height);
			_characters.push(character);
			return character;
		}
	}
}