package com.screens.view
{
	import com.constants.Dimentions;
	import com.gui.hat.Hat;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.view.playable.PlayMusician;
	import com.representation.Representation;
	import com.representation.controller.PlayChannelController;
	import com.representation.view.Channel;
	import com.utils.Claps;

	public class EndScreen extends DemoScreen
	{
		private var _hat:				Hat;
		private var _claps:				Claps;
		private var _representation:	Representation;
		private var _channelControllers:	Vector.<PlayChannelController>;
		
		public function EndScreen(){
			_channelControllers = new Vector.<PlayChannelController>();
		}
		
		
		override public function start():void{
			if(!isInited){
				addRepresentation();
			}else{
			
			}
			for each(var channelController:PlayChannelController in _channelControllers){
				channelController.start();
			}
			super.start();
		}
		
		
		override public function stop():void{
			super.stop();
			_hat.reset();
			_claps.stop();
			for each(var channelController:PlayChannelController in _channelControllers){
				channelController.stop();
			}
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

		private function addHat():void{
			_hat = new Hat();
			_stageLayer.addChild(_hat);
			_hat.x=Dimentions.WIDTH-_hat.width-10;
			_hat.y=380;
			_hat.start();
		}
		
		private function addRepresentation():void{
			_representation = new Representation();
			_representation.y = 573+30;
			_stageLayer.addChild(_representation);
		}
		
	}
}