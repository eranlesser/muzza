package com.container
{
	import com.constants.Dimentions;
	import com.constants.Rhythms;
	import com.container.navigation.Navigator;
	import com.gui.SpeedSlider;
	import com.screens.view.components.MenuButton;
	import com.view.gui.Btn;
	import com.view.gui.PressableButton;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import org.osflash.signals.Signal;
	import org.osflash.signals.natives.NativeSignal;
	
	public class ToolBar extends Sprite{
		
		private var _homeButton:	PressableButton;
		private var _navigator:		Navigator;
		private var _recordMenu:	RecordScreenMenu;
		private var _playMenu:		PlayMenu;
		private var _studioMenu:	studioMenu;
		public var 	goHome:			Signal = new Signal();
		
		private const hgt:uint=40;
		
		private static var _instance:ToolBar;
		
		public function ToolBar(enforce:Enforcer){
			init();
		}
		
		public static function get instance():ToolBar{
			if(!_instance){
				_instance=new ToolBar(new Enforcer());
			}
			return _instance;
		}
		public function get recordScreenMenu():RecordScreenMenu{
			return _recordMenu;
		}
		
		private function init():void{
			drawBg();
			addHomeButton();
			_recordMenu=new RecordScreenMenu();
			addChild(_recordMenu);
			_recordMenu.x=200;
			_playMenu=new PlayMenu();
			addChild(_playMenu);
			_playMenu.x=500;
			_playMenu.y=4;
			_playMenu.visible=false;
			addNavigation();
			_studioMenu=new studioMenu();
			addChild(_studioMenu);
			_studioMenu.x=0;
			_studioMenu.visible=false;
		}
		
		
		private function drawBg():void{
			var bg:Shape = new Shape();
			bg.graphics.beginFill(0x444444,0.5);
			bg.graphics.drawRect(0,0,Dimentions.WIDTH,hgt);
			bg.graphics.endFill();
			addChild(bg)
		}
		
		
		
		private function addHomeButton():void{
			_homeButton = new PressableButton("btn_home.png","btn_home.png");
			addChild(_homeButton);
			_homeButton.x=5;
			_homeButton.y = (hgt-_homeButton.height)/2;
			var _goHomeClicked:NativeSignal = new NativeSignal(_homeButton,MouseEvent.CLICK);
			_goHomeClicked.add(onHomeClicked)
		}
		
		private function onHomeClicked(e:Event):void{
			goHome.dispatch();
			_navigator.reset();
		}
		
		public function set mode(mode:String):void{
			_navigator.visible=false;
			_recordMenu.visible=false;
			_playMenu.visible=false;
			_studioMenu.visible=false;
			switch(mode){
				case "record":
					_navigator.visible=true;
					_recordMenu.visible=true;
					break;
				case "play":
					//_playMenu.visible=true;
					_navigator.visible=true;
					break
				case "studio":
					_studioMenu.visible=true;
					break
			}
		}
		
		public function get navigator():Navigator{
			return _navigator;
		}
		
		private function addNavigation():void{
			_navigator = new Navigator();
			_navigator.x = Dimentions.WIDTH-5-_navigator.width;
			_navigator.y = (hgt - _navigator.height)/2
			addChild(_navigator);
		}
		
		public function get studioClicked():Signal{
			return _studioMenu.buttonClickedSignal;
		}
		
		
	}
}

import com.constants.Dimentions;
import com.constants.Rhythms;
import com.gui.SpeedSlider;
import com.screens.view.components.MenuButton;
import com.view.gui.Btn;

import flash.display.Shape;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import org.osflash.signals.Signal;

class RecordScreenMenu extends Sprite{
	
	private var _listenButton:	MenuButton;
	private var _recordButton:	MenuButton;
	private var _practiceButton:MenuButton;
	private var _gear:			SpeedSlider;
	public function RecordScreenMenu():void{
		init();
	}
	
	private function init():void{
		createMenu();
		addSpeedControl();
	}
	
	private function addSpeedControl():void{
		_gear=new SpeedSlider();
		addChild(_gear);
		_gear.onChange.add(changeSpeed);
		_gear.x=0;
		_gear.y = 0;
	}
	
	private function changeSpeed(speed:String):void{
		if(speed=="1"){
			stage.frameRate = Rhythms.DELAY_COUNT;
		}else if(speed=="3/4"){
			stage.frameRate = Rhythms.DELAY_COUNT*3/4;
		}else if(speed=="1/2"){
			stage.frameRate = Rhythms.DELAY_COUNT/2;
		}
	}
	
	
	public function get listenButton():MenuButton{
		return _listenButton;
	}
	
	public function get recordButton():MenuButton{
		return _recordButton;
	}
	
	public function get practiceButton():MenuButton{
		return _practiceButton;
	}
	
	public function get speedControl():SpeedSlider{
		return _gear;
	}
	
	private function createMenu():void{
		_listenButton=new MenuButton("Listen","play");
		_practiceButton = new MenuButton("Practive","play");
		_recordButton=new MenuButton("Record","record");
		addChild(_listenButton)
		addChild(_practiceButton)
		addChild(_recordButton)
		_listenButton.x=300;
		_practiceButton.x=380;
		_recordButton.x=460;
	}
}

class PlayMenu extends Sprite{
	private var _playButton:Btn;
	private var _stopButton:Btn;
	public var clicked:Signal=new Signal();
	public function PlayMenu(){
		init();
	}
	
	private function init():void{
		_playButton=new Btn("play_idle.png","play_pressed.png");
		_stopButton=new Btn("stop_idle.png","stop_pressed.png");
		addChild(_playButton);
		addChild(_stopButton);
		_playButton.addEventListener(MouseEvent.CLICK,onPlay)
		_stopButton.addEventListener(MouseEvent.CLICK,onStop)
		_stopButton.x=_playButton.width+4;
	}
	private function onPlay(e:MouseEvent):void{
		clicked.dispatch("play");
		_playButton.state="off"
	}
	private function onStop(e:MouseEvent):void{
		clicked.dispatch("stop");
		_playButton.state="on"
	}
}

class studioMenu extends Sprite{
	public var buttonClickedSignal:Signal=new Signal();
	public function studioMenu():void{
		init();
	}
	private function init():void{
		
		var layoutBtn:Sprite=addButton("Open Layout");
		layoutBtn.addEventListener(MouseEvent.CLICK,layoutClicked);
		//layoutBtn.x=400;
		layoutBtn.y=2;
		
		var r1Players:Sprite=addButton("Single Player");
		r1Players.addEventListener(MouseEvent.CLICK,layoutClicked);
		r1Players.y=2;
		
		var r2Players:Sprite=addButton("2 Players");
		r2Players.addEventListener(MouseEvent.CLICK,layoutClicked);
		r2Players.y=2;
		
		var r3Players:Sprite=addButton("3 Players");
		r3Players.addEventListener(MouseEvent.CLICK,layoutClicked);
		r3Players.y=2;
		
		layoutBtn.x=Dimentions.WIDTH-layoutBtn.width-24;
		r1Players.x=layoutBtn.x-r1Players.width-24;
		r2Players.x=r1Players.x-r2Players.width-24;
		r3Players.x=r2Players.x-r3Players.width-24;
		
		
	}
	
	
	
	
	
	private function addButton(txt:String):Sprite{
		var btn:Sprite = new Sprite();
		var tFiled:TextField = new TextField();
		tFiled.text = txt;
		btn.addChild(tFiled);
		tFiled.x=2;
		tFiled.y=2;
		tFiled.setTextFormat(new TextFormat("Arial",16));
		tFiled.autoSize = TextFieldAutoSize.LEFT;
		btn.graphics.beginFill(0xFFFFFF);
		btn.graphics.lineStyle(0.2);
		btn.graphics.drawRect(0,0,tFiled.width+4,tFiled.height+4); 
		btn.graphics.endFill();
		addChild(btn);
		tFiled.mouseEnabled=false;
		return btn;
	}
	
	private function layoutClicked(e:MouseEvent):void{
		var txtField:TextField=Sprite(e.target).getChildAt(0) as TextField;
		buttonClickedSignal.dispatch(txtField.text);
		trace("clicked",txtField.text)
	}
}

class Enforcer{
	public function Enforcer(){
		
	}
}