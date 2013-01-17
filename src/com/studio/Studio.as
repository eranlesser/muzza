package com.studio
{
	import com.constants.Dimentions;
	import com.gskinner.motion.GTween;
	import com.metronom.Metronome;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	import com.musicalInstruments.view.IMusicalView;
	import com.musicalInstruments.view.character.PlayMusician;
	import com.representation.Representation;
	import com.screens.view.IScreen;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	import org.osflash.signals.Signal;
	
	public class Studio extends Sprite implements IScreen{
		
		private var _model:			StudioModel;
		private var _instruments:	Vector.<StudioInstrument>;
		private var _representation:Representation;
		private var _layoutActive:	Boolean=false;
		
		public var homeClicked:Signal=new Signal();
		public var backClicked:Signal=new Signal();
		
		public function Studio(){
			
		}
		
		public function set isRecorded(flag:Boolean):void{
			
		}
		
		public function parseXML(screenData:XML,instrumentsModel:ThemeInstrumentsModel):void{
			_model=new StudioModel(screenData,instrumentsModel);
			_instruments = new Vector.<StudioInstrument>();
			for each(var instrumentModel:InstrumentModel in _model.instruments){
				_instruments.push(addInstrument(instrumentModel));
			}
			layout(0);
			//_toolBar = ToolBar.instance;
		}
		
		public function start():void{
			//_toolBar.studioClicked.add(onToolBar);
			//Metronome.getTimeControll(this).play();
		}
		
		public function stop():void{
			//_toolBar.studioClicked.remove(onToolBar);
			for(var i:uint=0;i<_instruments.length;i++){
				_instruments[i].stop();
			}
		}
		
		
		
		private function onToolBar(tool:String):void{
			switch(tool){
				case "Open Layout":
					toggleLayoutable();
					break;
				case "home":
					homeClicked.dispatch();
					break;
				case "back":
					backClicked.dispatch();
					break;
				case "Single Player":
					layout(0);
					break;
				case "2 Players":
					layout(1);
					break;
				case "3 Players":
					layout(2);
					break;
			}
		}
		
		
		
		private function toggleLayoutable():void{
			if(!_layoutActive){
				this.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
				this.addEventListener(MouseEvent.MOUSE_UP,onMouseOut);
				this.addEventListener(MouseEvent.MOUSE_OUT,onMouseOut);
				Multitouch.inputMode = MultitouchInputMode.GESTURE;
				for each(var instrument:StudioInstrument in _instruments){
					instrument.mode="layout";
				}
				_layoutActive=true;
			}else{
				this.removeEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
				this.removeEventListener(MouseEvent.MOUSE_UP,onMouseOut);
				this.removeEventListener(MouseEvent.MOUSE_OUT,onMouseOut);
				Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
				for each(var ins:StudioInstrument in _instruments){
					ins.mode="play";
				}
				_layoutActive=false;
			}
			
		}
		
		private function onMouseDown(e:Event):void{
			if(e.target.parent is StudioInstrument){
				StudioInstrument(e.target.parent).startDrag(false,new Rectangle(0,0,Dimentions.WIDTH,Dimentions.HEIGHT));
			}
		}
		
		private function onMouseOut(e:Event):void{
			if(e.target.parent is StudioInstrument){
				StudioInstrument(e.target.parent).stopDrag();
			}
		}
		
		private function addInstrument(insModel:InstrumentModel):StudioInstrument{
			var ins:StudioInstrument = new StudioInstrument(insModel);
			ins.swapped.add(onSwapp);
			ins.sequanceDone.add(onPlayerDone);
			addChild(ins);
			return ins;
		}
		
		private function onSwapp():void{
			var allInstruments:Boolean=true;
			for(var i:uint=0;i<_instruments.length;i++){
				if(_instruments[i].viewType==StudioInstrument.CHARACTER){
					allInstruments=false;
					break;
				}
			}
			if(allInstruments){
				Metronome.getTimeControll().beginAtFrame=1;
				//Metronome.getTimeControll(this).play();
			}
		}
		
		private function onPlayerDone():void{
			var doneFlag:Boolean=true;
			for each(var inst:StudioInstrument in _instruments){
				if(inst.viewType==StudioInstrument.CHARACTER&&!inst.done){//check all players are done
					doneFlag=false;
					break;
				}
			}
			if(doneFlag){
				var tween:GTween = new GTween(this,1);
				tween.onComplete=onDelayDone;
			}
			
		}
		
		private function onDelayDone(t:GTween):void{
			t.onComplete=null;
			Metronome.getTimeControll().beginAtFrame=1;
			for each(var ins:StudioInstrument in _instruments){
				if(ins.viewType==StudioInstrument.CHARACTER){
					ins.play();
				}
			}
		}
		
		private function layout(indx:uint):void{
			for each(var ins:StudioInstrument in _instruments){
				ins.rotation=ins.getRotation(indx);
				ins.x = ins.getX(indx);
				ins.y = ins.getY(indx);
			}
		}
	}
}