package com.representation {
	import com.gskinner.motion.GTween;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.representation.view.Channel;
	import com.view.tools.AssetsManager;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;

	
	public class Representation extends Sprite{
		
		private var _bg:			Sprite;
		private var _cue:			Bitmap;
		private var _channelHeight:	Number;
		private var tickSize:		Number = (RepresentationSizes.notesArea)/128
		private var _timeModel:		ITimeModel=Metronome.getTimeModel();
		protected var _channels:	Vector.<Channel>;
		
		
		public function Representation(){
			init();
			_channels = new Vector.<Channel>();
			addEventListener(MouseEvent.CLICK,showData);
		}
		
		private function showData(e:Event):void{
			var tField:TextField = new TextField();
			tField.width=400;
			tField.height=800;
			tField.background=true;
			tField.type=TextFieldType.INPUT;
			for each(var channel:Channel in _channels){
				tField.appendText("<instrument name="+channel.thumbNail+">"+"\n"+channel.showData());
			}
			stage.addChild(tField);
		}
		
		
		
		public function addChannel(model:CoreInstrumentModel):Channel{
			var chanel:Channel;
			chanel = new Channel(model);
			_bg.addChild(chanel);
			chanel.x=30;
			_channels.push(chanel);
			
			chanel.y=getIndx(model.thumbNail)*40+20;
			return chanel;
		}
		
		private function getIndx(tmb:String):uint{
			var yy:uint;
			switch(tmb){
				case "bottles.png":
					yy=0;
					break;
				case "drum.png":
					yy=1;
					break;
				case "bass_flash.jpg":
					yy=2;
					break;
			}
			return yy;
		}
		
		private function init():void{
			
			_bg = new Sprite();
			var bg:DisplayObject;
			bg = AssetsManager.getAssetByName("LISTEN_SCREEN_NOTES_SHEET.png");
			_cue = AssetsManager.getBitmap("LISTEN_SCREEN_BLUE_NEEDLE.png",true);
			_cue.smoothing = true;
			//_cue.cacheAsBitmap = true;
			_bg.addChild(bg);
			
			addChild(_bg);
			addChild(_cue);
			_cue.x=52;
			var thumbs:DisplayObject = AssetsManager.getAssetByName("INSTRUMENT_TAB_AND_SHADOWS.png");
			_bg.addChild(thumbs);
			
		}
		
		
		
		
		public function start():void{
			//_cue.x = tickSize+RepresentationSizes.thumbNailWidth-_cue.width/2;
			_timeModel.metronomeTick.add(onTick);
		}
		
		public function stop():void{
			_timeModel.metronomeTick.remove(onTick);
			_cue.x=52;
		}
		
		public function onTick():void{
			if(_timeModel.currentTick<64){
				_cue.x = (_timeModel.currentTick)*tickSize+52//-_cue.width/2;
			}
		}
		
	}
}
