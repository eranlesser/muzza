package com.musicalInstruments.view.instrument
{
	import com.constants.Dimentions;
	import com.metronom.Metronome;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Point;

	public class Cuiqa extends Instrument
	{
		private const RADIUS:uint=194;
		private var _arrow:Sprite;
		private var _dots:Vector.<Dot>=new Vector.<Dot>();
		public function Cuiqa(model:NotesInstrumentModel)
		{
			super(model);
			init();
		}
		
		override public function get x():Number{
			return 100;
		}
		
		private function init():void{
			_arrow = new Sprite();
			_arrow.graphics.lineStyle(5,0x3333333,0.2);
			_arrow.graphics.drawRect(0,0,RADIUS-32,2);
			_arrow.x=Dimentions.WIDTH/2;
			_arrow.y=Dimentions.HEIGHT/2+20;
			var rect:DisplayObject = AssetsManager.getAssetByName("rect.png");
			_arrow.addChild(rect);
			_arrow.mouseChildren=false;
			_arrow.mouseEnabled = false;
			rect.x=RADIUS-rect.width+28;
			rect.y=-26;
			var circle:Sprite = new Sprite();
			var shp:DisplayObject = AssetsManager.getAssetByName("cuica.png");
			circle.addChild(shp);
			shp.x=-shp.width/2;
			shp.y=-shp.height/2;
			addChild(circle);
			circle.x=Dimentions.WIDTH/2;
			circle.y=Dimentions.HEIGHT/2+20;
			var inst:Dot;
			var location:Point;
			var i:uint=0;
			for each(var row:XML in _model.rawData.row){
				i++;
				for each(var dot:XML in row.children()){
						inst = new Dot(dot,(360/XMLList(_model.rawData.row).length())*i%360);
						location=calculateDotLocation((360/XMLList(_model.rawData.row).length())*i);
						inst.x=location.x;
						inst.y=location.y;
						circle.addChild(inst);
						_dots.push(inst);
						inst.soundPlaySignal.add(onDotSoundPlay);
						inst.soundCompleteSignal.add(onDotSoundComplete);
				}
			}
			_playingDot=_dots[_dots.length-1];
			addChild(_arrow);
		}
		
		private function calculateDotLocation(angle:Number):Point{
			var p:Point = new Point();
			p.x = RADIUS * Math.cos(angle * Math.PI / 180);
			p.y = RADIUS * Math.sin(angle * Math.PI / 180);
			return p;
		}
		
		override public function set active(flag:Boolean):void{
			if(flag){
				Metronome.getTimeModel().tickSignal.add(onTick);
				_arrow.rotation=0;
			}else{
				Metronome.getTimeModel().tickSignal.remove(onTick);
				_arrow.rotation=0;
			}
		}
		
		override public function stop():void{
			active = false;
		}
		private var _playingDot:Dot;
		private function onTick():void
		{
			if(_model.rawData.@startAt > Metronome.getTimeModel().currentTick){
				if(Metronome.getTimeModel().currentTick%8==0){
					_arrow.visible=!_arrow.visible;
				}
				return;
			}
			_arrow.visible=true;
			var tick:int = Metronome.getTimeModel().currentTick;
			_arrow.rotation = tick*360/64+16.5;
			
//			for each(var dot:Dot in _dots){
//				if((dot._angle)==(tick*360/64)%360 && (dot._angle != _playingDot._angle)){
//					dot.play();
//					_playingDot=dot;
//					dot.soundCompleteSignal.add(onDotSoundComplete);
//				}
//			}
			
		}
		private function onDotSoundComplete(id:String,startTime:uint,soundLength:int):void{
			_noteStopped.dispatch(id,startTime,soundLength);
		}
		private function onDotSoundPlay(id:String):void{
			_notePlayed.dispatch(id);
		}
		
	}
}
import com.gskinner.motion.GTween;
import com.metronom.Metronome;
import com.musicalInstruments.view.IMusicalInstrumentComp;
import com.musicalInstruments.view.components.SoundPlayer;
import com.view.tools.AssetsManager;

import flash.display.DisplayObject;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TouchEvent;

import org.osflash.signals.Signal;


class Dot extends Sprite implements IMusicalInstrumentComp{
	private var _soundPlayer:SoundPlayer;
	public var _angle:Number;
	private var _id:String;
	private var _startTime:uint;
	private var _dotFill:Shape;
	public var soundCompleteSignal:Signal = new Signal();
	public var soundPlaySignal:Signal = new Signal();
	private var _isPlaying:Boolean = false;
	public function Dot(xml:XML,angle:Number){
		init(xml.@color);
		_angle=angle;
		_id=xml.@id;
		_soundPlayer = new SoundPlayer(xml.@sound);
	}
	
	public function get id():String{
		return _id;
	}
	
	public function get noteId():String{
		return _id;
	}
	public function get octave():int{
		return 0;
	}
	public function set state(stt:String):void{
	}
	
	private function init(color:int):void{
		var spr:Sprite = new Sprite();
		//spr.graphics.lineStyle(1,color);
		spr.graphics.beginFill(color,0);
		spr.graphics.drawCircle(0,0,16);
		spr.graphics.endFill();
		addChild(spr);
		_dotFill=new Shape();
		_dotFill.graphics.lineStyle(1,color);
		_dotFill.graphics.beginFill(color);
		_dotFill.graphics.drawCircle(0,0,16);
		_dotFill.graphics.endFill();
		_dotFill.alpha=0;
		var bg:DisplayObject = addChild(AssetsManager.getAssetByName("dot.png"));
		bg.x= -bg.width/2;
		bg.y= -bg.height/2;
		addChild(_dotFill);
		//this.addEventListener(MouseEvent.ROLL_OVER,play);
		this.addEventListener(TouchEvent.TOUCH_ROLL_OVER,play);
	}
	
	public function play(e:Event=null):void{
		if(_isPlaying) return;
		
		_soundPlayer.play(1);
		_soundPlayer.soundComplete.addOnce(onSoundComplete);
		soundPlaySignal.dispatch(_id);
		var dTween:GTween = new GTween(_dotFill,0.5,{alpha:1});
		dTween.onComplete = endTween;
		_startTime = Metronome.getTimeModel().currentTick;
		_isPlaying = true;
	}
	private function endTween(t:GTween):void{
		new GTween(_dotFill,0.4,{alpha:0});
	}
	private function onSoundComplete():void{
		_isPlaying=false;
		new GTween(this,0.4,{scaleX:1,scaleY:1});
		soundCompleteSignal.dispatch(_id,_startTime,_startTime);
	}
	
}