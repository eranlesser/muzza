package com.container.navigation
{
	import com.view.gui.Btn;
	
	import flash.display.Sprite;
	import flash.utils.Timer;
	
	import org.osflash.signals.Signal;
	
	public class Navigator extends Sprite
	{
		private var _prevButton:	Btn;
		private var _nextButton:	Btn;
		public var nextSignal:		Signal = new Signal();
		public var prevSignal:		Signal = new Signal();
		private var _breadCrumbs:BreadCrumbs;
		public function Navigator(){
			initButtons();
		}
		
		private function initButtons():void{
			_nextButton = new Btn("right_idle.png","right_pressed.png");
			_nextButton.clicked.add(onNextButton);
			addChild(_nextButton);
			_prevButton = new Btn("left_idle.png","left_pressed.png");
			addChild(_prevButton);
			_prevButton.clicked.add(onPrevButton);
			_nextButton.x=170;
			_prevButton.x=0;
			_breadCrumbs=new BreadCrumbs();
			addChild(_breadCrumbs);
			_breadCrumbs.x=40;
			_breadCrumbs.y=16;
			//draw(0,0);
		}
		
		private function onNextButton(clicked:Boolean):void{
			nextSignal.dispatch();
			_breadCrumbs.progress()
		}
		
		private function onPrevButton(clicked:Boolean):void{
			prevSignal.dispatch();
			_breadCrumbs.reverse()
		}
		
		
		public function set backEnebled(flag:Boolean):void{
			_prevButton.visible = flag;
			
			//_breadCrumbs.visible = flag;
		}
		
		public function set nextEnabled(flag:Boolean):void{
			_nextButton.visible = flag;
		}
		public function reset():void{
			_breadCrumbs.reset();
		}
		
	}
}
import com.view.gui.Btn;

import flash.display.Sprite;

class BreadCrumbs extends Sprite{
	private var _icons:Vector.<Btn>;
	private var _index:uint=0;
	public function BreadCrumbs(){
		init();
	}
	private function init():void{
		_icons=new Vector.<Btn>();
		var bottleIcon:Btn=new Btn("icon_bottles.png","icon_bottles_.png");
		var bassIcon:Btn=new Btn("icon_bass.png","icon_bass_.png");
		var drumIcon:Btn=new Btn("icon_drums.png","icon_drums_.png");
		var allIcon:Btn=new Btn("all.jpg","all_.jpg");
		_icons.push(bottleIcon);
		_icons.push(drumIcon);
		_icons.push(bassIcon);
		_icons.push(allIcon);
		addChild(bottleIcon);
		addChild(drumIcon);
		addChild(bassIcon);
		addChild(allIcon);
		drumIcon.x=bottleIcon.x+bottleIcon.width+2;
		bassIcon.x=drumIcon.x+drumIcon.width+2;
		allIcon.x=bassIcon.x+bassIcon.width+2;
		_icons[_index].state="off";
	}
	
	public function progress():void{
		_index++;
		for each(var icon:Btn in _icons){
			icon.state="on"
		}
		_icons[_index].state="off";
	}
	
	public function reverse():void{
		_index--;
		for each(var icon:Btn in _icons){
			icon.state="on"
		}
		_icons[_index].state="off";
	}
	
	public function reset():void{
		_index=0;
		for each(var icon:Btn in _icons){
			icon.state="on"
		}
		_icons[_index].state="off";
	}
	
	
}