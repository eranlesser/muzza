package com.screens.view.components.homePage
{
	import com.constants.Dimentions;
	import com.constants.Session;
	import com.gskinner.motion.GTween;
	import com.gskinner.motion.easing.Circular;
	import com.model.FileProxy;
	import com.view.gui.Btn;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
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
		public var ready:Signal = new Signal();
		public function SongsMenu(){
			Session.fullVersionEnabled = FileProxy.getFullVersion();
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
			_songs=new Vector.<LearnSongPannel>();
			Session.fullVersionSignal.add(onFullVersion);
			for each(var song:XML in xml.song){
				var songPannel:LearnSongPannel = getSongPannel(song);
				_thumbsLayer.addChild(songPannel);
				songPannel.x=(indx*(Dimentions.WIDTH));
				var pole:DisplayObject = AssetsManager.getAssetByName("POLE_STATION.png");
				_poleLayer.addChild(pole);
				pole.x=Dimentions.WIDTH*indx;
				indx++;
				songPannel.songSelected.add(onSongSelected);
				_songs.push(songPannel);
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
			//var tmr:Timer = new Timer(400,1);
			
//			var enterSound:Sound = new Sound();
//			enterSound.load(new URLRequest("../../../../../assets/sounds/trainarrives.mp3"))
//			enterSound.addEventListener(Event.COMPLETE,function onSoundReady(e:Event):void{
//				enterSound.removeEventListener(Event.COMPLETE, onSoundReady);
//				tmr.start();
//			});
			//enterSound.play();
			//tmr.addEventListener(TimerEvent.TIMER_COMPLETE, function start(e:Event):void{
			//	tmr.removeEventListener(TimerEvent.TIMER_COMPLETE, start);
				var wtween:GTween = new GTween(_wallLayer,1,{x:0},{ease:Circular.easeInOut});
				var tween:GTween = new GTween(_thumbsLayer,1,{x:0},{ease:Circular.easeInOut});
				var ptween:GTween = new GTween(_poleLayer,1.2,{x:Dimentions.WIDTH-100},{ease:Circular.easeInOut});
				wtween.delay=3;
				tween.delay=3;
				ptween.delay=3;
				_nextButton.visible=false;
				ptween.onComplete = function dispatchComplete(t:GTween):void{
					_nextButton.visible=true;
					ready.dispatch();
					//var loopSound:Sound = new Sound(new URLRequest("../../../../../assets/sounds/trainloop1.mp3"));
					//var cnl:SoundChannel = loopSound.play();
					//					cnl.addEventListener(Event.SOUND_COMPLETE,function loop(e:Event):void{
					//						cnl = loopSound.play();
					//						cnl.addEventListener(Event.SOUND_COMPLETE,loop);
					//					});
				}
			//});
			
		}
		
		private function onFullVersion():void
		{
			for each(var learnedSong:LearnSongPannel in _songs){
				learnedSong.onFullVersion();
			}
		}
		
		private function onNext(id:String):void{
			if(_isTweening){
				return;
			}
			_isTweening=true;
			var wtween:GTween = new GTween(_wallLayer,1,{x:_wallLayer.x-Dimentions.WIDTH},{ease:Circular.easeInOut});
			var tween:GTween = new GTween(_thumbsLayer,1,{x:_thumbsLayer.x-Dimentions.WIDTH},{ease:Circular.easeInOut});
			var ptween:GTween = new GTween(_poleLayer,1.2,{x:_poleLayer.x-Dimentions.WIDTH},{ease:Circular.easeInOut});
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
			var wtween:GTween = new GTween(_wallLayer,1,{x:0},{ease:Circular.easeInOut});
			var tween:GTween = new GTween(_thumbsLayer,1,{x:_thumbsLayer.x+Dimentions.WIDTH},{ease:Circular.easeInOut});
			var ptween:GTween = new GTween(_poleLayer,1.2,{x:_poleLayer.x+Dimentions.WIDTH},{ease:Circular.easeInOut});
			tween.onComplete = enableTween;
		}
		
		private function enableNextPrev():void{
			_prevButton.visible=true;//change these 2 to true when not in tease
			_nextButton.visible=true;
			if(_thumbsLayer.x==0){
				_prevButton.visible=false;
			}
			trace((_thumbsLayer.width)+Dimentions.WIDTH);
			if(_thumbsLayer.x<-(_thumbsLayer.width)+Dimentions.WIDTH){
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
import com.constants.Session;
import com.screens.view.Store;
import com.view.gui.Btn;
import com.view.tools.AssetsManager;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

import org.osflash.signals.Signal;


class LearnSongPannel extends Sprite{
	private var _thumbNail:	DisplayObject;
	private var _title:		DisplayObject;
	private var _name:		String;
	private var _isFree:Boolean=false;
	private var _store:Store;
	private var playBtn:Btn;
	private var freestyle:Btn;
	private var buyBtn:Btn;
	private var playBtnVisible:Boolean=true;
	
	private var _songSelected:	Signal=new Signal();
	
	public function LearnSongPannel(xml:XML){
		setData(xml);
	}
	
	public function get songSelected():Signal{
		return _songSelected;
	}
	private function onPlay(e:Event):void{
		Session.IMPROVISE_MODE = false;
		_songSelected.dispatch(_name);
	}
	protected function onFreeStyle(event:MouseEvent):void
	{
		Session.IMPROVISE_MODE = true;
		_songSelected.dispatch(_name);
		
	}
	
	private function setData(xml:XML):void{
		if(xml.@isFree=="true"){
			_isFree=true;
		}
		if(xml.@name=="tutorial"){
			
			//playBtn=new Btn("Start_tutorial_idle.png","Start_tutorial_idle.png","","tutorial");
			playBtn=new Btn("tutorialHeb.jpg","tutorialHeb.jpg","","tutorial");
			
			//playBtn.x = 510;
			playBtn.x = 530;
			playBtn.y = 220;
		}else{
			playBtn=new Btn("PLAY_IDLE.png","PLAY_PRESSED.png");
			playBtn.x = 650;
			playBtn.y = 210;
			freestyle = new Btn("freestyle.png","freestyle.png");
			freestyle.addEventListener(MouseEvent.CLICK,onFreeStyle);
			addChild(freestyle);
			freestyle.x = 650 + (playBtn.width-freestyle.width)/2;
			freestyle.y = 310;
			buyBtn = new Btn("unlock.png","unlock.png");
			buyBtn.clicked.add(buyBtnClicked);
			addChild(buyBtn);
			buyBtn.x=670 ;
			buyBtn.y=260;
			_title=AssetsManager.getAssetByName(xml.@title);
			addChild(_title);
			_thumbNail = AssetsManager.getAssetByName(xml.@thumbNail);
			addChild(_thumbNail);
			_thumbNail.alpha=0.99;
			playBtnVisible = (xml.@play!="false")
			onFullVersion();
		}
		
		_name=xml.@name;
		playBtn.addEventListener(MouseEvent.CLICK,onPlay);
		addChild(playBtn);
	}
	
	public function onFullVersion():void{
		if(playBtn.id=="tutorial"){
			return;
		}
		var isFree:Boolean = (_isFree || Session.fullVersionEnabled)
			buyBtn.visible=!isFree;
			freestyle.visible=isFree;
			playBtn.visible=isFree && playBtnVisible;
			if(_store&&_store.parent){
				removeChild(_store);
			}
	}
	
	private function buyBtnClicked(id:String):void
	{
		// TODO Auto Generated method stub
		if(!_store){
			_store = new Store();
			_store.complete.add(onStore);
		}else{
			_store.restart();
		}
		addChild(_store);
		
	}	
	
	private function onStore():void{
		
		onFullVersion();
	}
	
		
	
	public function get songName():String{
		return _name;
	}
	
}

