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
		private const RADIUS:uint=182;
		private var _arrow:Sprite;
		private var _dots:Vector.<Dot>=new Vector.<Dot>();
		public function Cuiqa(model:NotesInstrumentModel)
		{
			super(model);
			init();
		}
		
		private function init():void{
			_arrow = new Sprite();
			_arrow.graphics.lineStyle(22,0xFFFFFF);
			_arrow.graphics.drawRect(0,0,RADIUS,2);
			addChild(_arrow);
			_arrow.x=Dimentions.WIDTH/2;
			_arrow.y=Dimentions.HEIGHT/2+50;
			
			var circle:Sprite = new Sprite();
			var shp:DisplayObject = AssetsManager.getAssetByName("cuica.png");
			circle.addChild(shp);
			shp.x=-shp.width/2;
			shp.y=-shp.height/2;
			addChild(circle);
			circle.x=Dimentions.WIDTH/2;
			circle.y=Dimentions.HEIGHT/2+50;
			var inst:Sprite;
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
				}
			}
			_playingDot=_dots[_dots.length-1];
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
			_arrow.rotation = tick*360/64;
			
			for each(var dot:Dot in _dots){
				if((dot._angle)==(tick*360/64)%360 && (dot._angle != _playingDot._angle)){
					dot.play();
					_playingDot=dot;
					_notePlayed.dispatch(dot.id);
					dot.soundCompleteSignal.add(onDotSoundComplete);
				}
			}
			
		}
		private function onDotSoundComplete(id:String,startTime:uint,soundLength:int):void{
			_noteStopped.dispatch(id,startTime,soundLength);
		}
		
	}
}
import com.gskinner.motion.GTween;
import com.metronom.Metronome;
import com.musicalInstruments.view.components.SoundPlayer;

import flash.display.DisplayObject;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

import org.osflash.signals.Signal;


class Dot extends Sprite{
	private var _soundPlayer:SoundPlayer;
	public var _angle:Number;
	private var _id:String;
	private var _startTime:uint;
	private var _dotFill:Shape;
	public var soundCompleteSignal:Signal = new Signal();
	public function Dot(xml:XML,angle:Number){
		init(xml.@color);
		_angle=angle;
		_id=xml.@id;
		_soundPlayer = new SoundPlayer(xml.@sound);
	}
	
	public function get id():String{
		return _id;
	}
	
	private function init(color:int):void{
		trace(color)
		var spr:Sprite = new Sprite();
		spr.graphics.lineStyle(1,color);
		//spr.graphics.beginFill(color);
		spr.graphics.drawCircle(0,0,16);
		spr.graphics.endFill();
		addChild(spr);
		_dotFill=new Shape();
		_dotFill.graphics.lineStyle(1,color);
		_dotFill.graphics.beginFill(color);
		_dotFill.graphics.drawCircle(0,0,16);
		_dotFill.graphics.endFill();
		addChild(_dotFill);
		_dotFill.alpha=0;
		this.addEventListener(MouseEvent.MOUSE_OVER,play);
	}
	
	public function play(e:Event=null):void{
		_soundPlayer.play(1);
		_soundPlayer.soundComplete.add(onSoundComplete);
		
		var dTween:GTween = new GTween(_dotFill,0.5,{alpha:1});
		dTween.onComplete = endTween;
		_startTime = Metronome.getTimeModel().currentTick;
	}
	private function endTween(t:GTween):void{
		new GTween(_dotFill,0.2,{alpha:0});
	}
	private function onSoundComplete():void{
		this.scaleX=1;
		this.scaleY=1;
		soundCompleteSignal.dispatch(_id,_startTime,Metronome.getTimeModel().currentTick-_startTime);
	}
	
}