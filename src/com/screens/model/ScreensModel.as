package com.screens.model {
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	import com.screens.view.IScreen;
	import com.screens.view.DemoScreen;
	import com.studio.Studio;
	

	public class ScreensModel {
		
		private var _recordSession:	RecordSession;
		private var _demoScreen:	DemoScreen;
		private var _studio:		Studio;
		private var _currentScreen:	IScreen;
		private var _xml:XML;
		private var _instrumentsModel:ThemeInstrumentsModel;
		
		public function ScreensModel(xml:XML,instrumentsModel:ThemeInstrumentsModel){
			_xml=xml;
			_instrumentsModel=instrumentsModel;
			//parse(xml);
		}
		
		public function get currentScreen():IScreen{
			return _currentScreen;
		}
		
		public function set playMode(mode:String):void{
			switch(mode){
				case "studio":
					if(!_studio){
						_studio=new Studio();
						_studio.parseXML(_xml.screens.studioScreen[0],_instrumentsModel);
					}
					_currentScreen=_studio;
					break;
				case "record":
					if(!_recordSession){
						_recordSession=new RecordSession(_xml.screens.recordSession[0],_instrumentsModel);
					}
					_currentScreen=_recordSession.currentScreen;
					break;
				case "demo":
					if(!_demoScreen){
						_demoScreen = new DemoScreen();
						_demoScreen.parseXML(_xml.screens.demoScreen[0],_instrumentsModel);
					}
					_currentScreen=_demoScreen;
					break;
			}
		}
		
	
		
		public function get showBackButton():Boolean{
			return !_recordSession.isFirstScreen;
		}
		
		public function get showNextButton():Boolean{
			return !_recordSession.isLastScreen;
		}
		
		public function progress():void{
			_recordSession.progress();
			_currentScreen=_recordSession.currentScreen;
		}
		
		public function rewind():void{
			_recordSession.rewind();
			_currentScreen=_recordSession.currentScreen;
		}
		
		public function reset():void{
			if(_recordSession){
				_recordSession.reset();
			}
		}
		
		
	}
}