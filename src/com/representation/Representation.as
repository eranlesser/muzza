package com.representation {
	import com.gskinner.motion.GTween;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.representation.view.Channel;
	import com.view.gui.Btn;
	import com.view.tools.AssetsManager;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	
	public class Representation extends Sprite{
		
		private var _title:			Sprite;
		private var _bg:			Sprite;
		private var _cue:			Bitmap;
		private var _channelHeight:	Number;
		private var tickSize:		Number = (RepresentationSizes.notesArea)/128
		private var _numChannels:	uint;
		private var _timeModel:		ITimeModel=Metronome.getTimeModel();
		private var _upButton:Btn;
		protected var _channels:	Vector.<Channel>;
		
		
		public function Representation(numChannels:uint){
			_numChannels = numChannels;
			init();
			_channels = new Vector.<Channel>();
			addEventListener(MouseEvent.CLICK,showData);
		}
		
		private function showData(e:Event):void{
			var tField:TextField = new TextField();
			tField.width=400;
			tField.height=800;
			tField.background=true;
			for each(var channel:Channel in _channels){
				tField.appendText("<instrument name="+channel.thumbNail+">"+"\n"+channel.showData());
			}
			stage.addChild(tField);
		}
		
		
		
		public function addChannel(model:CoreInstrumentModel):Channel{
			var chanel:Channel;
			chanel = new Channel(model);
			insertChannel(chanel);
			return chanel;
		}
		
		
		private function insertChannel(chanel:Channel):void{
			_bg.addChild(chanel);
			chanel.x=1;
			_channels.push(chanel);
			if(_numChannels==4){
				chanel.y=height-((_channels.length+1)*RepresentationSizes.channelHeight); // missing singer
			}else if(_numChannels==3){
				chanel.y=height-((_channels.length)*RepresentationSizes.channelHeight)-2; // missing singer
			}else{
				chanel.y=height-(2*RepresentationSizes.channelHeight);
			}
		}
		
		
		private function init():void{
			_bg = new Sprite();
			var bg:DisplayObject;
			if(_numChannels==2){
				bg = AssetsManager.getAssetByName("notearea_small.png");
				_cue = AssetsManager.getBitmap("marker_small.png",true);
			}else if(_numChannels==3){
				bg = AssetsManager.getAssetByName("notearea_3.png");
				bg.y=14;
				_cue = AssetsManager.getBitmap("marker_3.png",true);
				_upButton = new Btn("representationUp.png","representationDown.png");
				_bg.addChild(_upButton);
				_upButton.y=bg.height+bg.y;
				_upButton.clicked.add(upBtnClicked);
			}else{
				bg = AssetsManager.getAssetByName("notearea_big.png");
				_cue = AssetsManager.getBitmap("marker_big.png",true);
			}
			_cue.smoothing = true;
			_cue.cacheAsBitmap = true;
			_bg.addChild(bg);
			addChild(_bg);
				//addChild(AssetsManager.getAssetByName("notearea_indx.png"));
			var menu:RepresentationMenu = new RepresentationMenu();
			menu.y=-34;
			addChild(menu);
			addChild(_cue);
			_cue.x=32;
		}
		
		private function upBtnClicked(flag:Boolean):void{
			if(!flag){
				new GTween(_bg,0.2,{y:-_bg.height+34});
				new GTween(_cue,0.2,{y:-_bg.height+34});
				_upButton.state="off"
				//_cue.visible=false;
			}else{
				new GTween(_bg,0.2,{y:0});
				new GTween(_cue,0.2,{y:0});
				_upButton.state="on"
				//_cue.visible=true;
			}
		}
		
		public function start():void{
			//_cue.x = tickSize+RepresentationSizes.thumbNailWidth-_cue.width/2;
			_timeModel.tickSignal.add(onTick);
		}
		
		public function stop():void{
			_timeModel.tickSignal.remove(onTick);
			_cue.x=32;
		}
		
		public function onTick():void{
			if(_timeModel.currentTick<64)
				_cue.x = (_timeModel.currentTick)*tickSize+38//-_cue.width/2;
		}
		
		public function get cueX():uint{
			return _cue.x;
		}
		
		override public function get height():Number{
			return RepresentationSizes.channelHeight*_numChannels+RepresentationSizes.titleHeight;
		}
	}
}