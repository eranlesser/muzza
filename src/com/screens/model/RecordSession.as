package com.screens.model
{
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	import com.screens.view.DemoScreen;
	import com.screens.view.EndScreen;
	import com.screens.view.IScreen;
	import com.screens.view.RecordScreen;
	
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
		private var _lastInstrumentIndex:	uint;
		
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
		
		public function isRecorded(scrIndex:uint):Boolean{
			return (_recordScreens[scrIndex] as RecordScreen).model.isRecorded;
		}
		
		public function goTo(scr:String):void{
			var curIndex:int=-1;
			if(scr=="back"){
				curIndex = _lastInstrumentIndex//  = last screen played
			}else{
				for each(var isc:IScreen in _recordScreens){
					if(isc is RecordScreen){
						if(RecordScreen(isc).model.instrumentModel.thumbNail==scr){
							curIndex = _recordScreens.indexOf(isc);
						}
					}
				}
			}
			if(curIndex==-1){
				curIndex = _recordScreens.length-1;//End Screen
			}
			if(curIndex<_recordScreens.length-1){
				_lastInstrumentIndex=curIndex;
			}
			_currentScreenIndex=curIndex;
		}
		
		
		
		
	}
}