package com.screens.model
{
	import com.constants.Session;
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	import com.screens.view.IScreen;
	import com.screens.view.ListenScreen;
	import com.screens.view.RecordScreen;

	/**
	 *Record session  -  record 3(or different number) instruments and then show the result. 
	 * @author eranlesser
	 * 
	 */
	public class RecordSession
	{
		private var _endScreen:				ListenScreen;
		private var _recordScreens:			Vector.<IScreen>;
		private var _currentScreenIndex:	uint = 0;
		private var _lastInstrumentIndex:	uint;
		
		public function RecordSession(data:XML,instrumentsModel:ThemeInstrumentsModel,tutorial:Boolean){
			_recordScreens = new Vector.<IScreen>();
			for each(var screenData:XML in data.recordScreen){
				var scr:RecordScreen = new RecordScreen();
				scr.parseXML(screenData,instrumentsModel,tutorial);
				_recordScreens.push(scr);
				scr.scoreUpdated.add(onScorUpdated);
			}
			
			_endScreen = new ListenScreen();
			_endScreen.parseXML(data.endScreen[0],instrumentsModel);
			_recordScreens.push(_endScreen);
		}
		
		private function onScorUpdated():void
		{
			var score:int=0;
			for each(var isc:IScreen in _recordScreens){
				if(isc is RecordScreen){
					score = score+RecordScreen(isc).model.score;
				}
			}
			Session.instance.score = score;
			
		}
		
		public function start():void{
			_currentScreenIndex=1;
		}
		
		public function reset():void{
			_currentScreenIndex = 0;
		}
		
		public function deleteRecorded():void{
			for each(var isc:IScreen in _recordScreens){
				if(isc is RecordScreen && RecordScreen(isc).model.instrumentModel.getSequanceById(RecordScreen(isc).model.recordeSequanceId)){
					RecordScreen(isc).model.instrumentModel.getSequanceById(RecordScreen(isc).model.recordeSequanceId).destroy();
				}
			}
		}
		
		public function get currentScreen():IScreen{
			return _recordScreens[_currentScreenIndex] as IScreen;
		}
		
		public function get currenScreenIndex():uint{
			return _currentScreenIndex;
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
		
		public function getScreenIndex(scr:String):int{
			var curIndex:int=-1;
			for each(var isc:IScreen in _recordScreens){
				if(isc is RecordScreen){
					if(RecordScreen(isc).model.instrumentModel.thumbNail==scr){
						curIndex = _recordScreens.indexOf(isc);
					}
				}
			}
			if(curIndex==-1){
				curIndex = _recordScreens.length-1;//End Screen
			}
			return curIndex;
		}
		
		public function goNext():void{
			_currentScreenIndex++;
		}
		
		
		public function gotoScreen(scr:String):void{
			var curIndex:int=-1;
			if(scr=="back"){
				curIndex = _lastInstrumentIndex//  = last screen played
			}else{
				//var score:int=0;
				for each(var isc:IScreen in _recordScreens){
					if(isc is RecordScreen){
						if(RecordScreen(isc).model.instrumentModel.thumbNail==scr){
							curIndex = _recordScreens.indexOf(isc);
						}
						//score = score+RecordScreen(isc).model.score;
					}
				}
				//Session.instance.score = score;
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