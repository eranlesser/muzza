package com.screens.view
{
	import com.constants.Dimentions;
	import com.gui.hat.Hat;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.view.character.PlayMusician;
	import com.representation.Representation;
	import com.representation.controller.PlayChannelController;
	import com.representation.view.Channel;
	import com.utils.Claps;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.osflash.signals.Signal;

	public class ListenScreen extends DemoScreen
	{
		private var _hat:					Hat;
		private var _claps:					Claps;
		private var _representation:		Representation;
		private var _channelControllers:	Vector.<PlayChannelController>;
		private var _toolBar:				ToolBar;
		
		public function ListenScreen(){
			_channelControllers = new Vector.<PlayChannelController>();
			addRepresentation();
			addToolBar();
		}
		
		
		override public function start():void{
			if(!isInited){
				
			}else{
			
			}
			super.start(); // here _channelControllers gets filled
			for each(var channelController:PlayChannelController in _channelControllers){
				channelController.start();
			}
			var tmr:Timer=new Timer(1000,1);
			tmr.addEventListener(TimerEvent.TIMER_COMPLETE,onTimerComplete);
			tmr.start();
			
		}
		
		private function onTimerComplete(e:Event):void{
			Timer(e.target).removeEventListener(TimerEvent.TIMER_COMPLETE,onTimerComplete);
			_representation.start();
		}
		
		override public function stop():void{
			super.stop();
			_hat.reset();
			_claps.stop();
			for each(var channelController:PlayChannelController in _channelControllers){
				channelController.stop();
			}
			_representation.stop();
		}
		
		override protected function init(masked:Boolean=true):void{
			super.init(false);
			addHat();
			_claps = new Claps();
			
		}
		override protected function addInstrument(insModel:InstrumentModel):PlayMusician{
			var ins:PlayMusician = super.addInstrument(insModel);
			var channel:Channel = _representation.addChannel(insModel.coreModel);
			_channelControllers.push(new PlayChannelController( channel, insModel,_model.playSequance));
			return ins;
		}

		
		override protected function endMusciPiece():void{
			_claps.play();
			_hat.fillHat();
			for each(var channelController:PlayChannelController in _channelControllers){
				channelController.stop();
			}
			super.endMusciPiece();
		}
		
		public function get goto():Signal{
			return _toolBar.goTo;
		}

		private function addHat():void{
			_hat = new Hat();
			_stageLayer.addChild(_hat);
			_hat.x=Dimentions.WIDTH-_hat.width+80;
			_hat.y=380;
			_hat.start();
		}
		
		private function addRepresentation():void{
			_representation = new Representation();
			_representation.y = 573+52-5;
			_stageLayer.addChild(_representation);
		}
		
		private function addToolBar():void{
			_toolBar=new ToolBar(_representation);
			_toolBar.y=573;
			addChild(_toolBar)
		}
		
	}
}
import com.gskinner.motion.GTween;
import com.representation.Representation;
import com.view.gui.Btn;
import com.view.tools.AssetsManager;

import flash.display.DisplayObject;
import flash.display.Sprite;

import org.osflash.signals.Signal;

class ToolBar extends Sprite{
	public var goTo:Signal=new Signal();
	private var _collapseBut:Btn;
	private var _expandBut:Btn;
	private var _representation:Representation;
	private var _mouse:DisplayObject;
	public function ToolBar(representation:Representation){
		_representation=representation;
		init();
	}
	
	private function init():void{
		var bg:DisplayObject=addChild(AssetsManager.getAssetByName("LISTEN_SCREEN_NOTES_BAR.png"));
		var backBtn:Btn = new Btn("BACK_BUTTON_IDLE.png","BACK_BUTTON_PRESSED.png");
		addChild(backBtn);
		backBtn.clicked.add(backClicked);
		var playBtn:Btn = new Btn("PLAY_BUTTON_IDLE.png","PLAY_BUTTON_PRESSED.png");
		addChild(playBtn);
		playBtn.x=439;
		var replay:Btn = new Btn("REPLAY_BUTTON_IDLE.png","REPLAY_BUTTON_PRESSED.png");
		addChild(replay);
		replay.x=439+playBtn.width;
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
	
	private function onColapse(str:String):void{
		var curY:uint=this.y;
		if(str=="collapse"){
			_collapseBut.visible=false;
			new GTween(this,0.5,{y:curY+130})
			var colTween:GTween=new GTween(_representation,0.5,{y:curY+130+52-5});
			colTween.onComplete=function():void{
				_mouse.visible=true;
			}
		}else{
			_collapseBut.visible=true;
			new GTween(this,0.5,{y:curY-130})
			var exTween:GTween=new GTween(_representation,0.5,{y:curY-130+52-5});
			_mouse.visible=false;
		}
	}
	
	private function backClicked(id:String):void{
		goTo.dispatch("back");
	}
}