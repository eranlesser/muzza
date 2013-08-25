package com.musicalInstruments.view.instrument
{
	import com.metronom.Metronome;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.view.components.Pawee;
	import com.musicalInstruments.view.instrument.Instrument;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import org.osflash.signals.Signal;
	

	public class Loopee extends Instrument
	{
		private var _rows:Vector.<TogiRow>;
		public var playRequest:Signal = new Signal();
		public var isPlaying:Boolean=false;
		public function Loopee(model:NotesInstrumentModel){
			super(model);
			init();
			//this.scaleX=0.75
		}
		
		private function init():void{
			var loopee:Sprite = new Sprite();
			var bg:DisplayObject=loopee.addChild(AssetsManager.getAssetByName("notes_sheet.png"));
			var frame:DisplayObject = loopee.addChild(AssetsManager.getAssetByName("notes_frame.png"));
			frame.scaleX=-1;
			bg.scaleX=-1;
			bg.x=bg.width;
			frame.x = frame.width;
			_rows = new Vector.<TogiRow>();
			var xx:uint=210;
			for each(var row:XML in _model.rawData.row){
				var togiRow:TogiRow = new TogiRow(row);
				loopee.addChild(togiRow);
				togiRow.x=xx+2;
				xx+=togiRow.width+2;
				togiRow.y=50;
				_rows.push(togiRow);
			}
			var playBut:Sprite = new Sprite();
			playBut.addChild(AssetsManager.getAssetByName("PLAY_BUTTON_IDLE.png"));
			playBut.addChild(AssetsManager.getAssetByName("PLAY_BUTTON_PRESSED.png"));
			loopee.addChild(playBut);
			playBut.getChildAt(1).visible=false;
			playBut.y=height/2-playBut.height/2;
			playBut.x=40;
			playBut.addEventListener(MouseEvent.CLICK,onPlay);
			addChild(loopee);
			loopee.scaleX=0.74;
			addAgogo(_model.rawData);
		}
		
		override public function stop():void{
			Metronome.getTimeModel().tickSignal.remove(onTick);
		}
		
		private function onPlay(e:MouseEvent):void{
			if(!Sprite(e.target).getChildAt(1).visible){
				isPlaying=Sprite(e.target).getChildAt(1).visible=true;
				Metronome.getTimeModel().tickSignal.add(onTick);
			}else{
				Metronome.getTimeModel().tickSignal.remove(onTick);
				isPlaying=Sprite(e.target).getChildAt(1).visible=false;
			}
			playRequest.dispatch();
			
		}
		
		private function onTick():void{
			//trace(Metronome.getTimeModel().currentTick%64)
			//return;
			var tickValue:int = (Metronome.getTimeModel().currentTick-1)%64/4;
//			while(tickValue>4){
//				tickValue = tickValue-4;
//			}
			//tickValue =tickValue/4;
			if(tickValue != (Metronome.getTimeModel().currentTick-1)%64/4)
				return;
			trace("tickValue",tickValue)
			if(_rows[tickValue].selectedTogi){
				_rows[tickValue].selectedTogi.play();
				onNotePlayed(_rows[tickValue].selectedTogi.noteId)
			}
			if(tickValue>0&&_rows[tickValue-1].selectedTogi){
				_rows[tickValue-1].selectedTogi.unPlay();
				onNoteStopped(_rows[tickValue-1].selectedTogi.noteId,Metronome.getTimeModel().currentTick-4);
			}
			if(tickValue==0&&_rows[_rows.length-1].selectedTogi){
				_rows[_rows.length-1].selectedTogi.unPlay();
				onNoteStopped(_rows[tickValue-1].selectedTogi.noteId,Metronome.getTimeModel().currentTick-4);
			}
		}
		
		//___________________________________________________________________________________________________________		
		//____________________________________________________________________________________________________AGOGO		
		
		private function addAgogo(xml:XML):void{
			var agogo:Sprite = new Sprite();
			addChild(agogo);
			agogo.x = xml.agogo.@x;
			agogo.y = xml.agogo.@y;
			for each(var paweXml:XML in xml.agogo.children()){
				var pawee:Pawee = new Pawee(paweXml);
				agogo.addChild(pawee);
				pawee.notePlayed.add(onNotePlayed);
				pawee.noteStopped.add(onNoteStopped);
			}
			
		}
		
		private  function onNotePlayed(id:String):void{
			_notePlayed.dispatch(id);
		}
		private  function onNoteStopped(id:String,startTime:uint):void{
			_noteStopped.dispatch(id,startTime,2,0);
		}
	}
}

import com.musicalInstruments.view.components.Togi;

import flash.display.Sprite;

class TogiRow extends Sprite{
	private var _togis:Vector.<Togi>;
	public function TogiRow(data:XML){
		init(data);
	}
	
	public function get selectedTogi():Togi{
		for each(var togi:Togi in _togis){
			if(togi.selected){
				return togi;
			}
		}
		return null;
	}
	
	private function init(data:XML):void{
		var yy:uint=0;
		_togis = new Vector.<Togi>();
		for each(var togiXml:XML in data.togi){
			var togi:Togi = new Togi(togiXml);
			addChild(togi);
			togi.y=yy+2;
			yy+=togi.height+2;
			togi.click.add(onTogiClicked);
			_togis.push(togi);
		}
	}
	
	private function onTogiClicked(clickedTogi:Togi):void{
		for each(var togi:Togi in _togis){
			if(clickedTogi!=togi){
				togi.selected=false;
				togi.unPlay();
			}
		}
		
	}
	
}