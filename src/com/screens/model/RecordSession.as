package com.screens.model
{
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	import com.screens.view.DemoScreen;
	import com.screens.view.EndScreen;
	import com.screens.view.IScreen;
	import com.screens.view.RecordScreen;
	import com.tutorial.TutorialRecordScreen;
	
	import org.osflash.signals.Signal;

	/**
	 *Record session  -  record 3(or different number) instruments and then show the result. 
	 * @author eranlesser
	 * 
	 */
	public class RecordSession
	{
		private var _endScreen:				EndScreen;
		private var _recordScreens:			Vector.<IScreen>;
		private var _currentScreenIndex:	uint = 0;
		
		public function RecordSession(data:XML,instrumentsModel:ThemeInstrumentsModel){
			_recordScreens = new Vector.<IScreen>();
			for each(var screenData:XML in data.recordScreen){
				var scr:RecordScreen = new RecordScreen();
				scr.parseXML(screenData,instrumentsModel);
				_recordScreens.push(scr);
			}
			
			_endScreen = new EndScreen();
			_endScreen.parseXML(data.endScreen[0],instrumentsModel);
			_recordScreens.push(_endScreen);
		}
		
		public function start():void{
			_currentScreenIndex=1;
		}
		
		public function reset():void{
			_currentScreenIndex = 0;
		}
		
		public function get currentScreen():IScreen{
			return _recordScreens[_currentScreenIndex] as IScreen;
		}
		
		public function get isFirstScreen():Boolean{
			return _currentScreenIndex==0;
		}
		
		public function get isLastScreen():Boolean{
			return _currentScreenIndex==_recordScreens.length-1;
		}
		
		public function get screenIndex():uint{
			return _currentScreenIndex;
		}
		
		public function goTo(scr:String):void{
			for each(var isc:IScreen in _recordScreens){
				if(isc is RecordScreen){
					if(RecordScreen(isc).model.instrumentModel.thumbNail==scr){
						_currentScreenIndex = _recordScreens.indexOf(isc);
						return;
					}
				}
			}
			_currentScreenIndex = _recordScreens.length-1;//End Screen
		}
		
		
		
		
	}
}