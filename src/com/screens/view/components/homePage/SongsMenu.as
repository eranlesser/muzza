package com.screens.view.components.homePage
{
	import com.constants.Dimentions;
	import com.gskinner.motion.GTween;
	import com.gskinner.motion.easing.Bounce;
	import com.gskinner.motion.easing.Circular;
	import com.gskinner.motion.easing.Elastic;
	import com.gskinner.motion.easing.Exponential;
	import com.gskinner.motion.easing.Sine;
	import com.view.gui.Btn;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Matrix;
	import flash.utils.Timer;
	
	import org.osflash.signals.Signal;
	
	public class SongsMenu extends Sprite
	{
		private var _songs:Vector.<LearnSongPannel>;
		public var playRequest:Signal=new Signal();
		private var _thumbsLayer:Sprite;
		private var _poleLayer:Sprite;
		private var _wallLayer:Sprite;
		private var _isTweening:Boolean=false;
		private var _nextButton:Btn;
		private var _prevButton:Btn;
		public function SongsMenu(){
			
		}
		
		public function set data(xml:XML):void{
			_wallLayer=new Sprite();
			_thumbsLayer=new Sprite();
			_poleLayer=new Sprite();
			_wallLayer.addChild(AssetsManager.getAssetByName("STATION_WALL_TRIP.png"));
			var wall2:DisplayObject = AssetsManager.getAssetByName("STATION_WALL_TRIP.png");
			_wallLayer.addChild(wall2);
			wall2.x=wall2.width;
			addChild(_wallLayer);
			addChild(_thumbsLayer);
			addChild(_poleLayer);
			//addTutoiralPannel();
			var indx:uint=0;
			for each(var song:XML in xml.song){
				var songPannel:LearnSongPannel = getSongPannel(song);
				_thumbsLayer.addChild(songPannel);
				songPannel.x=(indx*(Dimentions.WIDTH));
				var pole:DisplayObject = AssetsManager.getAssetByName("POLE_STATION.png");
				_poleLayer.addChild(pole);
				pole.x=Dimentions.WIDTH*indx;
				
				indx++;
				songPannel.songSelected.add(onSongSelected);
				
			}
			//_wallLayer.cacheAsBitmap=true;
			//_thumbsLayer.cacheAsBitmap=true;
			//_poleLayer.cacheAsBitmap=true;
			
			_nextButton = new Btn("NEXT_IDLE.png","NEXT_PRESSED.png");
			_prevButton = new Btn("PREVIOUS_IDLE.png","PREVIOUS_Pressed.png");
			addChild(_nextButton);
			addChild(_prevButton);
			_prevButton.x= 370;
			_prevButton.y= 40;
			_nextButton.x= 380+_prevButton.x+_prevButton.width;
			_nextButton.y= 40;
			_nextButton.clicked.add(onNext);
			_prevButton.clicked.add(onPrev);
			enableNextPrev();
			
			_wallLayer.x = (_wallLayer.x-Dimentions.WIDTH);
			_thumbsLayer.x = (_thumbsLayer.x-Dimentions.WIDTH);
			_poleLayer.x = (_poleLayer.x-Dimentions.WIDTH);
			var tmr:Timer = new Timer(500,1);
			tmr.start()
			tmr.addEventListener(TimerEvent.TIMER_COMPLETE, function start(e:Event):void{
				tmr.removeEventListener(TimerEvent.TIMER_COMPLETE, start);
				var wtween:GTween = new GTween(_wallLayer,6,{x:0},{ease:Circular.easeInOut});
				var tween:GTween = new GTween(_thumbsLayer,6,{x:0},{ease:Circular.easeInOut});
				var ptween:GTween = new GTween(_poleLayer,7.2,{x:Dimentions.WIDTH-100},{ease:Circular.easeInOut});
			});
			
		}
		
		private function addTutoiralPannel():void{
			var tutPan:TutorialPannel = new TutorialPannel();
			_thumbsLayer.addChild(tutPan);
			var pole:DisplayObject = AssetsManager.getAssetByName("POLE_STATION.png");
			_poleLayer.addChild(pole);
			//pole.cacheAsBitmap=true;
			//pole.cacheAsBitmapMatrix=new Matrix();
			pole.x=Dimentions.WIDTH;
		}
		
		private function onNext(id:String):void{
			if(_isTweening){
				return;
			}
			_isTweening=true;
			var wtween:GTween = new GTween(_wallLayer,2,{x:_wallLayer.x-Dimentions.WIDTH},{ease:Circular.easeInOut});
			var tween:GTween = new GTween(_thumbsLayer,2,{x:_thumbsLayer.x-Dimentions.WIDTH},{ease:Circular.easeInOut});
			var ptween:GTween = new GTween(_poleLayer,2.2,{x:_poleLayer.x-Dimentions.WIDTH},{ease:Circular.easeInOut});
			wtween.onComplete=function onComplete():void{
				wtween.onComplete=null;
				_wallLayer.x=0;
			}
			tween.onComplete = enableTween;
		}
		private function onPrev(id:String):void{
			if(_isTweening){
				return;
			}
			_isTweening=true;
			_wallLayer.x=_wallLayer.x-Dimentions.WIDTH;
			var wtween:GTween = new GTween(_wallLayer,2,{x:0},{ease:Circular.easeInOut});
			var tween:GTween = new GTween(_thumbsLayer,2,{x:_thumbsLayer.x+Dimentions.WIDTH},{ease:Circular.easeInOut});
			var ptween:GTween = new GTween(_poleLayer,2,{x:_poleLayer.x+Dimentions.WIDTH},{ease:Circular.easeInOut});
			tween.onComplete = enableTween;
		}
		
		private function enableNextPrev():void{
			_prevButton.visible=false;//change these 2 to true when not in tease
			_nextButton.visible=false;
			if(_thumbsLayer.x==0){
				_prevButton.visible=false;
			}
			if(_thumbsLayer.x==-(_thumbsLayer.width)){
				_nextButton.visible=false;
			}
		}
		
		private function enableTween(t:GTween):void{
			_isTweening=false;
			enableNextPrev();
		}
		
		private function onSongSelected(songName:String):void{
			playRequest.dispatch(songName);
		}
		
		
		private function getSongPannel(xml:XML):LearnSongPannel{
			var songPannel:LearnSongPannel;
			songPannel=new LearnSongPannel(xml);
			return songPannel;
		}
	}
}
import com.constants.Dimentions;
import com.view.gui.Btn;
import com.view.tools.AssetsManager;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Matrix;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import org.osflash.signals.Signal;


class LearnSongPannel extends Sprite{
	private var _thumbNail:	DisplayObject;
	private var _title:		DisplayObject;
	private var _name:		String;

	
	private var _songSelected:	Signal=new Signal();
	
	public function LearnSongPannel(xml:XML){
		setData(xml);
	}
	
	public function get songSelected():Signal{
		return _songSelected;
	}
	private function onClick(e:Event):void{
		_songSelected.dispatch(_name);
	}
	
	private function setData(xml:XML):void{
		//addChild(AssetsManager.getAssetByName("STATION_WALL_TRIP.png"))
		//var bg:DisplayObject = AssetsManager.getAssetByName("STATION_WALL_TRIP.png");
		//addChild(bg);
		//bg.x=Dimentions.WIDTH;
		_title=AssetsManager.getAssetByName(xml.@title);
		addChild(_title);
		//_title.cacheAsBitmap=true;
		
		//addChild(AssetsManager.getAssetByName("WHITE_LIGHT_TOP.png"))//.cacheAsBitmap=true;
		
		_thumbNail = AssetsManager.getAssetByName(xml.@thumbNail);
		addChild(_thumbNail);
		//_thumbNail.cacheAsBitmap=true;
		_name=xml.@name;
		
		
		var playBtn:Sprite=new Btn("PLAY_IDLE.png","PLAY_PRESSED.png");
		playBtn.addEventListener(MouseEvent.CLICK,onClick);
		addChild(playBtn);
		playBtn.x = 650;
		playBtn.y = 230;
		
	}
	
	public function get songName():String{
		return _name;
	}
	
}

class TutorialPannel extends Sprite{
	private var _tutorialButton:Btn;
	public function TutorialPannel(){
		init();
	}
	

	private function init():void{
		//addChild(AssetsManager.getAssetByName("WHITE_LIGHT_TOP.png"));
		var light:DisplayObject = AssetsManager.getAssetByName("WHITE_LIGHT_TOP.png");
		//addChild(light);
		light.x=Dimentions.WIDTH;
		_tutorialButton = new Btn("Start_tutorial_idle.png","Start_tutorial_PRESSED_V_2.png");
		addChild(_tutorialButton);
		_tutorialButton.x=510;
		_tutorialButton.y=220;
	}
	
	
}

