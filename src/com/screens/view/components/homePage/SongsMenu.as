package com.screens.view.components.homePage
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;
	
	public class SongsMenu extends Sprite
	{
		private var _songs:Vector.<LearnSongPannel>;
		public var playRequest:Signal=new Signal();
		public var studioRequest:Signal=new Signal();
		public var demoRequest:Signal=new Signal();
		
		
		public function SongsMenu(){
			
		}
		
		public function set data(xml:XML):void{
			var indx:uint=0;
			for each(var song:XML in xml.song){
				var songPannel:LearnSongPannel = getSongPannel(song);
				addChild(songPannel);
				songPannel.x=(indx*200);
				indx++;
				songPannel.songSelected.add(onSongSelected);
				songPannel.studioRequest.add(onstudioRequest);
				songPannel.demoRequest.add(onDemoRequest);
				if(indx>1){
					//songPannel.visible=false;
				}
			}
		}
		
		private function onSongSelected(songName:String):void{
			playRequest.dispatch(songName);
		}
		private function onstudioRequest(songName:String):void{
			studioRequest.dispatch(songName);
		}
		
		private function onDemoRequest(songName:String):void{
			demoRequest.dispatch(songName);
		}
		
		private function getSongPannel(xml:XML):LearnSongPannel{
			var songPannel:LearnSongPannel;
			songPannel=new LearnSongPannel(xml);
			return songPannel;
		}
	}
}
import com.view.tools.AssetsManager;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import org.osflash.signals.Signal;


class LearnSongPannel extends Sprite{
	private var _thumbNail:	DisplayObject;
	private var _title:		TextField;
	private var _name:		String;
	private var _locked:	Boolean=false;
	
	private var _songSelected:	Signal=new Signal();
	public var studioRequest:	Signal=new Signal();
	public var demoRequest:		Signal=new Signal();
	
	public function LearnSongPannel(xml:XML){
		addTitle();
		setData(xml);
	}
	
	public function get songSelected():Signal{
		return _songSelected;
	}
	private function onClick(e:Event):void{
		if(!_locked)
		_songSelected.dispatch(_name);
	}
	private function onJamClicked(e:MouseEvent):void{
		if(!_locked)
		studioRequest.dispatch(_name);
	}
	private function onDemoClicked(e:MouseEvent):void{
		if(!_locked)
		demoRequest.dispatch(_name);
	}
	
	private function addTitle():void{
		_title=new TextField();
		addChild(_title);
		_title.y=4;
		_title.x=2;
		_title.width=256;
		_title.autoSize=TextFieldAutoSize.CENTER;
		_title.defaultTextFormat=(new TextFormat("Arial",18,0x111111,true));
		
	}
	
	private function setData(xml:XML):void{
		_thumbNail = AssetsManager.getAssetByName(xml.@thumbNail);
		addChild(_thumbNail)
		_thumbNail.x=(260-_thumbNail.width)/2;
		_thumbNail.y=46;
		_title.text=xml.@title;
		_name=xml.@name;
		_locked=(xml.@locked=="true");
		
		var playBtn:Sprite=addButton("Play",_locked);
		playBtn.addEventListener(MouseEvent.CLICK,onClick);
		var jamBtn:Sprite=addButton("Jam",_locked);
		jamBtn.addEventListener(MouseEvent.CLICK,onJamClicked);
		var demoBtn:Sprite=addButton("Demo",false);
		demoBtn.addEventListener(MouseEvent.CLICK,onDemoClicked);
		
		playBtn.y = _thumbNail.y;
		jamBtn.y = playBtn.y+playBtn.height+2;
		demoBtn.y = jamBtn.y+jamBtn.height+2;
		playBtn.x=_thumbNail.x+_thumbNail.width+1;
		jamBtn.x=_thumbNail.x+_thumbNail.width+1;
		demoBtn.x=_thumbNail.x+_thumbNail.width+1;
		
		
	}
	
	
	
	private function getLock():DisplayObject{
		var lock:DisplayObject=AssetsManager.getAssetByName("lock.jpg")
		//addChild(lock)
		lock.x=_thumbNail.x;
		lock.y=_thumbNail.y;
		return lock;
	}
	
	public function get songName():String{
		return _name;
	}
	private function addButton(txt:String,lock:Boolean):Sprite{
		var btn:Sprite = new Sprite();
		var tFiled:TextField = new TextField();
		tFiled.text = txt;
		btn.addChild(tFiled);
		tFiled.x=2;
		tFiled.setTextFormat(new TextFormat("Arial",12));
		tFiled.autoSize = TextFieldAutoSize.LEFT;
		btn.graphics.beginFill(0xFFFFFF);
		btn.graphics.lineStyle(0.2);
		btn.graphics.drawRect(0,0,80,40); 
		btn.graphics.endFill();
		tFiled.y=(btn.height-tFiled.height)/2
		tFiled.mouseEnabled=false;
		addChild(btn);
		if(lock){
			var lockIcon:DisplayObject=getLock();
			lockIcon.height=btn.height-4;
			lockIcon.width=lockIcon.height+4;
			btn.addChild(lockIcon);
			lockIcon.x=50;
			lockIcon.y=2;
		}
		return btn;
	}
}

