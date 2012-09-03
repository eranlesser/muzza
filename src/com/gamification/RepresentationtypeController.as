package com.gamification
{
	import com.representation.RepresentationType;

	public class RepresentationtypeController{
		
	private static var instance:			RepresentationtypeController;
	private static var allowInstantiation:	Boolean;
	private var _listeners:Vector.<INoteDisplayer>;
	private var _displayType:String;
		
	
	/**
	 *Responsible for swapping representation view to all registered compomnents 
	 * 
	 */	
	public function RepresentationtypeController(){
			_listeners = new Vector.<INoteDisplayer>();
			_displayType = RepresentationType.NUMBERS;
			if (!allowInstantiation) {
				throw new Error("Error: Instantiation failed: Use SingletonDemo.getInstance() instead of new.");
			}
		}
		//______________________________________________________________________________________
		//_____________________________________________________SINGELTON STUFF
		
		
		public static function getInstane():RepresentationtypeController {
			if (instance == null) {
				allowInstantiation = true;
				instance = new RepresentationtypeController();
				allowInstantiation = false;
			}
			return instance;
		}
		public function register(listener:INoteDisplayer):void{
			_listeners.push(listener);
		}
		
		public function updateDisplay():void{
			for each(var noteDisplayer:INoteDisplayer in _listeners){
				noteDisplayer.updateDisplay();
			}
		}
		
		public function set displayType(displayType:String):void{
			_displayType=displayType;
			updateDisplay();
		}
		
		public function get displayType():String{
			return _displayType;
		}
	}
}