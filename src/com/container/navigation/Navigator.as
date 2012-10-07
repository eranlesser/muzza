package com.container.navigation
{
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
		
	}
}
import com.screens.model.RecordSession;
import com.view.gui.Btn;

import flash.display.Sprite;

import org.osflash.signals.Signal;

class BreadCrumbs extends Sprite{
	private var _icons:Vector.<Btn>;
	private var _index:uint=0;
	public var onNavigate:Signal = new Signal();
	public function BreadCrumbs(){
		init();
	}
	private function init():void{
		_icons=new Vector.<Btn>();
		var bottleIcon:Btn=new Btn("bottle_IDLE.png","bottle_PRESSED.png","BOTTLES_DONE.png","bottles.png");
		var bassIcon:Btn=new Btn("BASS_IDLE.png","BASS_PRESSED.png","BASS_DONE.png","bass_flash.jpg");
		var drumIcon:Btn=new Btn("DRUMS_IDLE.png","DRUMS_PRESSED.png","DRUMS_DONE.png","drum.png");
		var allIcon:Btn=new Btn("LISTEN_IDLE.png","LISTEN_PRESSED.png","LISTEN_DONE.png");
		
		
		addButton(bottleIcon);
		addButton(drumIcon);
		addButton(bassIcon);
		addButton(allIcon);
		drumIcon.x=bottleIcon.x+bottleIcon.width+2;
		bassIcon.x=drumIcon.x+drumIcon.width+2;
		allIcon.x=bassIcon.x+bassIcon.width+2;
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