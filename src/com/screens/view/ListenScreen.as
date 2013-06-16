package com.screens.view
{
	import com.constants.Dimentions;
	import com.constants.Session;
	import com.gui.hat.Hat;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.view.character.PlayMusician;
	import com.representation.Representation;
	import com.representation.controller.PlayChannelController;
	import com.representation.view.Channel;
	import com.utils.Claps;
	import com.view.gui.Btn;
	
	import org.osflash.signals.Signal;

	public class ListenScreen extends DemoScreen
	{
		private var _hat:					Hat;
		private var _claps:					Claps;
		private var _representation:		Representation;
		private var _channelControllers:	Vector.<PlayChannelController>;
		private var _toolBar:				ToolBar;
		public var goTo:Signal=new Signal();
		
		public function ListenScreen(){
			_channelControllers = new Vector.<PlayChannelController>();
			//addRepresentation();
			addToolBar();
		}

		override public function start():void{
			if(!isInited){
				//addEventListener(MouseEvent.CLICK,onClick);
			}else{
				for each(var instrumentModel:InstrumentModel in _model.instruments){
					var onStage:Boolean = false;
					for each(var ins:PlayMusician in _instruments){
						if(ins.thumbnail==instrumentModel.coreModel.thumbNail){
							onStage=true;
							break;
						}
					}
					if(!onStage){
						(addInstrument(instrumentModel));
						layout();
					}
				}
			}
			super.start(); // here _channelControllers gets filled
			for each(var channelController:PlayChannelController in _channelControllers){
				channelController.start();
			}
			_hat.reStart();
			//_toolBar.playPauseBut.state = 1;
		}
		
		
		override public function stop():void{
			super.stop();
			_hat.reset();
			_claps.stop();
			for each(var channelController:PlayChannelController in _channelControllers){
				channelController.stop();
			}
			//_representation.stop();
			//_toolBar.playPauseBut.state = 0;
		}
		
		override protected function init(masked:Boolean=true):void{
			super.init(false);
			addHat();
			_claps = new Claps();
			
		}
		override protected function addInstrument(insModel:InstrumentModel):void{
			if(NoteSequanceModel(insModel.getSequanceById(_model.playSequance))){
				 super.addInstrument(insModel);
			//var channel:Channel = _representation.addChannel(insModel.coreModel);
			//_channelControllers.push(new PlayChannelController( channel, insModel,_model.playSequance));
			}
		}

		override protected function endMusciPiece():void{
			//if(Session.instance.goodScreensLength==4){
				_claps.play();
				_hat.fillHat(Session.instance.score);
			//}
			for each(var channelController:PlayChannelController in _channelControllers){
				channelController.stop();
			}
		}
		
		private function addHat():void{
			_hat = new Hat();
			_stageLayer.addChild(_hat);
			_hat.x=892//Dimentions.WIDTH-_hat.width+80;
			_hat.y=380;
			
		}
		
//		private function addRepresentation():void{
//			_representation = new Representation();
//			_representation.y = 573+52-5;
//			_stageLayer.addChild(_representation);
//		}
		
		private function addToolBar():void{
//			_toolBar=new ToolBar(_representation);
//			_toolBar.y=_representation.y-40//-_toolBar.height;
//			addChild(_toolBar);
			var backBtn:Btn = new Btn("exit_idle.png","exit_press.png");
			addChild(backBtn);
			backBtn.x=1;
			backBtn.y=8;
			backBtn.clicked.add(backClicked);
		}
		private function backClicked(id:String):void{
			goTo.dispatch("back");
		}
		
	}
}
import com.constants.Dimentions;
import com.gskinner.motion.GTween;
import com.metronom.Metronome;
import com.representation.Representation;
import com.view.gui.Btn;
import com.view.gui.ToggleBut;
import com.view.tools.AssetsManager;

import flash.display.DisplayObject;
import flash.display.Sprite;

import org.osflash.signals.Signal;

class ToolBar extends Sprite{
	
	private var _collapseBut:Btn;
	private var _expandBut:Btn;
	private var _representation:Representation;
	private var _mouse:DisplayObject;
	private var _bar:DisplayObject;
	private var _playPauseBtn:ToggleBut;
	public function ToolBar(representation:Representation){
		_representation=representation;
		init();
		//this.scaleY=0.9;
	}
	
	private function init():void{
		_bar=addChild(AssetsManager.getAssetByName("LISTEN_SCREEN_NOTES_BAR.png"));
		
		_playPauseBtn = new ToggleBut("PLAY_BUTTON_IDLE.png","PLAY_BUTTON_PRESSED.png");
		addChild(_playPauseBtn);
		_playPauseBtn.x=0;
		_playPauseBtn.clicked.add(onPlayPause);
		var replay:Btn = new Btn("REPLAY_BUTTON_IDLE.png","REPLAY_BUTTON_PRESSED.png");
		addChild(replay);
		replay.x=100;
		replay.clicked.add(reload);
		_expandBut = new Btn("EXPAND_IDLE.png","EXPAND_PRESSED.png","","expand");
		_collapseBut = new Btn("COLLAPSE_IDLE.png","COLLAPSE_PRESSED.png","","collapse");
		addChild(_expandBut);
		addChild(_collapseBut);
		_collapseBut.x=959;
		_expandBut.x=959;
		_collapseBut.clicked.add(onColapse);
		_expandBut.clicked.add(onColapse);
		_mouse = AssetsManager.getAssetByName("mouse.png");
		addChild(_mouse);
		_mouse.y=-_mouse.height+32;
		_mouse.x=700;
		_mouse.visible=false;
			
	}
	
	public function get playPauseBut():ToggleBut{
		return _playPauseBtn;
	}
	
	private function reload(str:String):void{
		Metronome.getTimeControll().toZero();
		_playPauseBtn.state=0;
	}
	
	private function onPlayPause(btnId:String):void{
		Metronome.getTimeControll().togglePause();
	}
	
	override public function set visible(value:Boolean):void{
		//trace("b");
	}
	
	private function onColapse(str:String):void{
		var curY:uint=this.y;
		if(str=="collapse"){
			_collapseBut.visible=false;
			new GTween(this,0.5,{y:curY+130})
			new GTween(_bar,0.5,{alpha:0.2})
			var colTween:GTween=new GTween(_representation,0.5,{y:curY+130+52-5});
			colTween.onComplete=function():void{
				_mouse.visible=true;
				
			}
		}else{
			_collapseBut.visible=true;
			new GTween(this,0.5,{y:curY-130})
			new GTween(_bar,0.5,{alpha:1})
			var exTween:GTween=new GTween(_representation,0.5,{y:curY-130+52-5});
			_mouse.visible=false;
		}
	}
	
	
}