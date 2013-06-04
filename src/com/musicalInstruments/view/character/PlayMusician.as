package com.musicalInstruments.view.character {
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;

	/**
	 * 
	 * @author eranlesser
	 */	
	public class PlayMusician extends Sprite
	{
		
		private var _musicianView:	Musician;
		private var _model:			InstrumentModel;

		public var sequanceDone:	Signal=new Signal();
		private var _done:			Boolean=false;
		
		public function PlayMusician(themedInstrumentModel:InstrumentModel){
			//super(themedInstrumentModel.coreModel);
			_model = themedInstrumentModel;
			//this.mouseChildren = false;
			//this.mouseEnabled = false;  // clic on clock (metronom on/off)
		}
		
		public function get type():String{
			return _model.coreModel.type;
		}
		
		public function start():void{
			initView();
		}
		
		private function initView():void{
			if(!_musicianView){
				//if(_model.coreModel.type == "bottles" ||_model.coreModel.type == "drums" || _model.coreModel.type == "bass"){
					//_musicianView = Band.instance.getMusician(_model.coreModel);
				_musicianView=new Musician(_model.coreModel);
				//}else if(_model.coreModel.type == "voice"){
					//_musicianView = new Singer(_model,false);
				//}
			}else{
				trace("ERROR",_model.coreModel.thumbNail)
			}
			_musicianView.start();
			addChild(_musicianView);
		}
		
		
		public function stop():void{
			if(_musicianView){
				_musicianView.stop();
			}
		}
		
		public function getX():uint{
			return _model.getX(0);
		}
		
		public function getY():uint{
			return _model.getY(0);
		}
		
		public function isRecorded(sequanceId:uint):Boolean{
			if(_model.getSequanceById(sequanceId)){
				return NoteSequanceModel(_model.getSequanceById(sequanceId)).notes.length>0;
			}
			return false;
		}
		
		public function play(playSequance:uint,beginAtFrame:uint,volume:Number=1):Boolean{
			//playSequance = _model.getSequanceAtCycle(currentCycle);
			if(_musicianView){
				_done=false;
				_musicianView.sequanceDone.add(onSequanceDone);
				return _musicianView.play(playSequance, beginAtFrame);
			}
			return false;
		}
		
		public function get done():Boolean{
			return _done;
		}
		
		public function get thumbnail():String{
			return _model.coreModel.thumbNail;
		}
		
		private function onSequanceDone():void{
			_done=true;
			sequanceDone.dispatch();
		}
		
		
		
	}
}