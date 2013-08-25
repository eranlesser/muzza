package com.container.navigation
{
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	import com.screens.model.RecordSession;
	import com.view.gui.Btn;
	
	import flash.display.Sprite;
	import flash.utils.Timer;
	
	import org.osflash.signals.Signal;
	
	public class Navigator extends Sprite
	{
		public var goto:Signal = new Signal();
		private var _breadCrumbs:BreadCrumbs;
		public function Navigator(){
			initButtons();
		}
		
		private function initButtons():void{
			
			_breadCrumbs=new BreadCrumbs();
			addChild(_breadCrumbs);
			_breadCrumbs.onNavigate.add(onNavigate);
			//_breadCrumbs.y=7;
			//draw(0,0);
		}
		
		
		private function onNavigate(btn:String):void{
			goto.dispatch(btn);
		}
		
		public function set state(session:RecordSession):void{
			_breadCrumbs.state=session;
		}
	
		public function reset():void{
			_breadCrumbs.reset();
		}
		public function set instruments(instumnts:ThemeInstrumentsModel):void{
			_breadCrumbs.instruments = instumnts;
			
		}
	}
}
import com.musicalInstruments.model.CoreInstrumentModel;
import com.musicalInstruments.model.ThemeInstrumentsModel;
import com.screens.model.RecordSession;
import com.view.gui.Btn;

import flash.display.Sprite;

import org.osflash.signals.Signal;

class BreadCrumbs extends Sprite{
	private var _icons:Vector.<Btn>;
	private var _index:uint=0;
	public var onNavigate:Signal = new Signal();
	public function BreadCrumbs(){
		//init();
	}
//	private function init():void{
//		_icons=new Vector.<Btn>();
//		var bottleIcon:Btn=new Btn("bottle_IDLE.png","bottle_PRESSED.png","BOTTLES_DONE.png","bottles.png");
//		var bassIcon:Btn=new Btn("BASS_IDLE.png","BASS_PRESSED.png","BASS_DONE.png","bass_flash.jpg");
//		var drumIcon:Btn=new Btn("DRUMS_IDLE.png","DRUMS_PRESSED.png","DRUMS_DONE.png","drum.png");
//		var allIcon:Btn=new Btn("LISTEN_IDLE.png","LISTEN_PRESSED.png","LISTEN_DONE.png");
//		
//		
//		addButton(bottleIcon);
//		addButton(bassIcon);
//		addButton(drumIcon);
//		addButton(allIcon);
//		bassIcon.x=bottleIcon.x+bottleIcon.width;
//		drumIcon.x=bassIcon.x+bassIcon.width;
//		allIcon.x=drumIcon.x+drumIcon.width;
//		_icons[_index].state="idle";
//	}
	
	override public function set x(value:Number):void{
		super.x=value;
	}
	
	public function set instruments(instumnts:ThemeInstrumentsModel):void{
		if(_icons){
			var n:uint=_icons.length;
			for(var i:uint=0;i<n;i++){
				removeChild(_icons.pop());
			}
		}else{
			_icons=new Vector.<Btn>();
		}
		for each(var ins:CoreInstrumentModel in instumnts.instruments){
			var btn:Btn;
			switch(ins.thumbNail){
				case "bottles.png":
						btn=new Btn("bottle_IDLE.png","bottle_PRESSED.png","BOTTLES_DONE.png","bottles.png");
					break;
				case "drum.png":
						btn=new Btn("DRUMS_IDLE.png","DRUMS_PRESSED.png","DRUMS_DONE.png","drum.png");
					break;
				case "bass_flash.jpg":
						btn=new Btn("BASS_IDLE.png","BASS_PRESSED.png","BASS_DONE.png","bass_flash.jpg");
					break;
				case "turnTable":
						btn=new Btn("vinyl_idle_but.png","vinyl_press_but.png","vinyl_done_but.png","turnTable");
						break;
				case "loopee":
						btn=new Btn("vinyl_idle_but.png","vinyl_press_but.png","vinyl_done_but.png","loopee");
					break;
			}
			addButton(btn)
			// need to move btn assets to data and add buttons here
		}
		var allIcon:Btn=new Btn("LISTEN_IDLE.png","LISTEN_PRESSED.png","LISTEN_DONE.png");
		addButton(allIcon);
		_icons[_index].state="idle";
	}
	
	public function set state(session:RecordSession):void{
		for(var i:uint=0;i<_icons.length-1;i++){ // last screen is listen
			if(session.isRecorded(i)){
				_icons[i].state="visited";
			}else{
				_icons[i].state="idle";
			}
		}
		_icons[_icons.length-1].state="idle";
		_icons[session.screenIndex].state="pressed";
	}
	
	private function addButton(btn:Btn):void{
		addChild(btn);
		btn.x = _icons.length*btn.width;
		_icons.push(btn);
		btn.clicked.add(navigate);
	}
	
	private function navigate(id:String):void{
		onNavigate.dispatch(id);
	}
	
	
	public function reset():void{
		_index=0;
		for each(var icon:Btn in _icons){
			icon.state="idle"
		}
		_icons[_index].state="pressed";
	}
	
	
}