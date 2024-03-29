package com.screens.model {
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	import com.screens.view.DemoScreen;
	import com.screens.view.IScreen;
	

	public class ScreensModel {
		
		private var _recordSession:	RecordSession;
		private var _demoScreen:	DemoScreen;
		private var _currentScreen:	IScreen;
		private var _xml:XML;
		private var _instrumentsModel:ThemeInstrumentsModel;
		
		public function ScreensModel(xml:XML,instrumentsModel:ThemeInstrumentsModel){
			_xml=xml;
			_instrumentsModel=instrumentsModel;
			parse(xml);
		}
		
		public function set playMode(mode:String):void{
			switch(mode){
				
				case "record":
					_currentScreen=_recordSession.currentScreen;
					break;
				case "demo":
					_currentScreen=_demoScreen;
					break;
			}
		}

		
		public function get currentScreen():IScreen{
			return _currentScreen;
		}
		
		private function parse(xml:XML):void{
//			_studio=new Studio();
//			_studio.parseXML(_xml.screens.studioScreen[0],_instrumentsModel);
			_recordSession=new RecordSession(_xml.screens.recordSession[0],_instrumentsModel,xml.@tutorial == "true");
			_demoScreen = new DemoScreen();
			_demoScreen.parseXML(_xml.screens.demoScreen[0],_instrumentsModel);
			_currentScreen=_recordSession.currentScreen;
		}
		
		
		public function get demoScreen():DemoScreen{
			return _demoScreen;
		}
	
		public function get recordSession():RecordSession{
			return _recordSession;
		}
		
		public function get showBackButton():Boolean{
			return !_recordSession.isFirstScreen;
		}
		
		public function get showNextButton():Boolean{
			return !_recordSession.isLastScreen;
		}
		
		public function getScreenIndex(scr:String):int{
			return _recordSession.getScreenIndex(scr);
		}
		public function gotoScreen(scr:String):void{
			_recordSession.gotoScreen(scr);
			_currentScreen=_recordSession.currentScreen;
		}
		
		public function goNext():void{
			_recordSession.goNext();
			_currentScreen=_recordSession.currentScreen;
		}
		
		public function reset():void{
			if(_recordSession){
				_recordSession.reset();
			}
		}
		
		
	}
}