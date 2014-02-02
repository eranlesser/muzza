package com.screens.view {
	import com.container.Presenter;
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	
	import flash.display.Sprite;


	
	public class AbstractScreen extends Sprite implements IScreen{
		
		protected var _bg:				Sprite;
		protected var _stageLayer:		Sprite;
		protected var _guiLayer:		Sprite;
		protected var isInited:			Boolean = false;

		public function AbstractScreen(){
			addBg();
		}
		
		private function addBg():void{
			_bg = new Sprite();
			addChild(_bg);
			_stageLayer = new Sprite();
			addChild(_stageLayer);
			_guiLayer = new Sprite();
			addChild(_guiLayer);
		}
		
		public function parseXML(screenData:XML,instrumentsModel:ThemeInstrumentsModel,tutorial:Boolean=false):void{
			trace("EEERRRROOOORRR parseXML not implemented");
		}
		
		
//______________________________________________________LAYOUT
		
		
		protected function layout():void{
			
		}
		
		
		
		
//_____________________________________________________END LAYOUT
		
		public function start():void{
			
		}
		
		public function stop():void{

		}
		
	}
}