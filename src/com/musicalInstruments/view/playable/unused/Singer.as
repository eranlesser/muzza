package com.musicalInstruments.view.playable {
	import com.constants.Session;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.VoiceInstrumentModel;
	import com.musicalInstruments.model.sequances.VoiceSequanceModel;
	import com.musicalInstruments.view.IMusicalView;
	import com.view.tools.AssetsManager;
	import com.view.tools.SpriteSheet;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	
	import org.osflash.signals.Signal;
	
	
	public class Singer extends Musician implements IMusicalView{
		
		private var _model:			VoiceInstrumentModel;
		private var _voiceSequance:	VoiceSequanceModel;
		private var _sound:			Sound;
		private var _eyes:			Eyes;
		
		private var _mouthSheet:	SpriteSheet;
		private var _mouth:			Bitmap;
		private var _mouthIndex:	uint=0;
		
		private var _timeModel:		ITimeModel = Metronome.getTimeModel();
		private var _beginAtFrame:	uint;
		private var _isPlaying:		Boolean=false;
		private var _sample:Number;
		private var _filter:String;
		public var soundDone:Signal;
		private var _sequanceDone:Signal=new Signal;
		
		public function Singer(model:CoreInstrumentModel,togable:Boolean){
			super(model);
			_model = model as VoiceInstrumentModel;
			soundDone = new Signal();
			init();
		}
		
		public function get sequanceDone():Signal{
			return _sequanceDone;
		}
		
		private function init():void{
			var singer:Sprite = new Sprite();
			singer.addChild(AssetsManager.getAssetByName(_model.thumbNail));
			addChild(singer);
			
			
			_eyes = new Eyes(_model.eyes);
			singer.addChild(_eyes.view);
			
			_mouthSheet = new SpriteSheet(AssetsManager.getBitmap(_model.mouth),_model.mouthWidth,_model.mouthHeight);
			_mouth = new Bitmap();
			_mouth.bitmapData = _mouthSheet.drawTile(0);
			_mouth.y=_model.mouthY;// 79;
			_mouth.x=_model.mouthX;//135;
			singer.addChild(_mouth);
			
		}
		
		
		
		private function checkVolume(e:Event):void{
			if(_voiceSequance){
				_sample =_voiceSequance.getMaxActivityAtLocation(_timeModel.currentTick);
				//_mouth.bitmapData=_mouthSheet.drawTile(_closeMouth[Math.floor(Math.random()*_closeMouth.length)])
				//_sample = Math.abs(_sample*4000)
				var diff:uint = 0 ;
				if(Session.FEMALE){
					diff=28;
				}
				if (_sample<1) {_mouth.bitmapData=_mouthSheet.drawTile(0);}
				else if (_sample<2) {_mouth.bitmapData=_mouthSheet.drawTile(1);}
				else if (_sample<4) {_mouth.bitmapData=_mouthSheet.drawTile(2);}
				else if (_sample<6) {_mouth.bitmapData=_mouthSheet.drawTile(3);}
				else if (_sample<7) {_mouth.bitmapData=_mouthSheet.drawTile(4);}
				else if (_sample<8) {_mouth.bitmapData=_mouthSheet.drawTile(5);}
				else if (_sample<10) {_mouth.bitmapData=_mouthSheet.drawTile(6);}
				else {_mouth.bitmapData=_mouthSheet.drawTile(7);}
			}
		}
		
		
		
		override public function play(sequanceId:uint,beginAtFrame:uint,volume:Number=1):Boolean{
			if(!_isPlaying){
				super.play(sequanceId,beginAtFrame);  // autoplay button toggle
				_voiceSequance = VoiceSequanceModel(_model.getSequanceById(sequanceId));
				if(_voiceSequance){
					Metronome.getTimeModel().tickSignal.add(onbeginAtFrame);
					//_sound = new Sound(new URLRequest(_voiceSequance.mp3File));
					//_sound.play();
					//_filter = filter;
					//var timer:Timer = new Timer(10,1);
					//timer.addEventListener(TimerEvent.TIMER_COMPLETE,realPlay);
					//timer.start();
					trace(Metronome.getTimeModel().currentTick)
					_beginAtFrame = _voiceSequance.beginAtFrame;
				}
				return (sequanceId > 0)
			}
			return true;
		}
		/*
		private function realPlay(e:TimerEvent):void{
		_voiceSequance.mp3Player.play(_filter);
		//_voiceSequance.mp3Player.soundData.add(onSoundData);
		}
		*/
		
		
		
		override public function stop():void{
			//Metronome.getTimeModel().soundTickSignal.remove(onbeginAtFrame);
			if(_isPlaying){
				_voiceSequance.mp3Player.stop();
				removeEventListener(Event.ENTER_FRAME, checkVolume);
				_mouth.bitmapData=_mouthSheet.drawTile(0);
				soundDone.dispatch();
				_isPlaying = false;
			}
			
		}
		
		private function onbeginAtFrame():void{
		if(Metronome.getTimeModel().currentTick==2){
		//onSingingbeginAtFrame();
			Metronome.getTimeModel().tickSignal.remove(onbeginAtFrame);
			//_voiceSequance.mp3Player.soundComplete.addOnce(onSoundComplete);
			_voiceSequance.mp3Player.play();
			_isPlaying = true;
			//Metronome.getTimeModel().soundTickSignal.remove(onbeginAtFrame);
		//addEventListener(Event.ENTER_FRAME, checkVolume);
		}
		}
		
		private function onSoundComplete():void{
			stop();
		}
		/*
		}
		private function onSingingbeginAtFrame():void{
		if (_voiceSequance && _voiceSequance.voice.length > 0){
		_isPlaying = true;
		_sound.addEventListener(SampleDataEvent.SAMPLE_DATA, playRecorded);
		if(_soundChannel)
		_soundChannel.stop();
		_soundChannel = _sound.play();
		//addEventListener(Event.ENTER_FRAME, checkVolume);
		}
		}
		private function playRecorded(e:SampleDataEvent): void{
		var voice:ByteArray =_voiceSequance.voice;
		var length:int = 4096;
		for (var i:int = 0; i < length; i++)
		{
		var left:Number = 0;
		if (voice.bytesAvailable > 0) _sample = voice.readFloat();
		e.data.writeFloat(_sample);
		e.data.writeFloat(_sample);
		left = _sample*128;
		if (left<0)	{
		left = -left;
		}
		_sample = left*2;
		
		}
		if(voice.length == voice.position){
		stopPlay()
		}
		
		}
		*/
		
		
	}
}