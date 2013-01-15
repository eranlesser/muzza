package com.musicalInstruments.palleta.views
{
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.model.PalletModel;
	import com.musicalInstruments.model.SequancedNote;
	import com.musicalInstruments.palleta.Ipallet;
	import com.musicalInstruments.palleta.views.components.Togi;
	import com.musicalInstruments.view.components.MusicalInstrumentComponent;
	import com.musicalInstruments.view.instrument.Instrument;
	import com.view.gui.ToggleBut;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import org.osflash.signals.Signal;

	public class Loopee extends Instrument implements Ipallet
	{
		private var _rows:Vector.<TogiRow>;
		[Embed(source="assets/notes_sheet_sml.png")] 
		private var _bg:Class;
		private var _muteBut:ToggleBut;
		
		public function Loopee(model:CoreInstrumentModel){
			super(model);
			init();
		}
		
		
		private function init():void{
			//addChild(new _bg());
			_notePlayed = new Signal();
			_rows = new Vector.<TogiRow>();
			var xx:uint=0;
			for each(var row:XML in (_model as PalletModel).data.data.children()){
				var togiRow:TogiRow = new TogiRow(row);
				addChild(togiRow);
				togiRow.x=xx+4;
				togiRow.y = 35;
				xx+=togiRow.width+4;
				//togiRow.y=(this.height-togiRow.height)/2;
				_rows.push(togiRow);
			}
			_muteBut = new ToggleBut("SOUND_ON.png","SOUND_OFF.png")
			_muteBut.y=-5;//(this.height-_muteBut.height)/2;
			_muteBut.x=(this.width - _muteBut.width)/2;//15;
			addChild(_muteBut);
			_muteBut.state=1;
			_muteBut.addEventListener(MouseEvent.CLICK,onPlay);
		}
		private function onPlay(e:MouseEvent):void{
			_notePlayed.dispatch("22");
		}
		
		public function set active(flag:Boolean):void{
			_muteBut.state = 1;
		}
		private var _tickValue:uint;
		private var _selectedTog:Togi;
		public function onTick(tickValue:int):void{
			_tickValue=tickValue;
			if(_muteBut.selected){
				return;
			}
			var togValue:int=-1;
			tickValue++;
			if(tickValue%2==0){
				togValue= tickValue/2;
			}
			while(togValue>=_rows.length){
				togValue-=_rows.length;
			}
			if(togValue>=0&&_rows[togValue].selectedTogi){
				_selectedTog = _rows[togValue].selectedTogi;
				_selectedTog.play();
				noteStopped.dispatch(_selectedTog.noteId,tickValue,1,0)
			}
			if(togValue>0&&_rows[togValue-1].selectedTogi){
				_rows[togValue-1].selectedTogi.unPlay();
			}
			if(togValue==0&&_rows[_rows.length-1].selectedTogi){
				_rows[_rows.length-1].selectedTogi.unPlay();
			}
			if(_selectedTog)
				_selectedTog.update(tickValue%2);
		}
	}
}

import com.musicalInstruments.palleta.views.components.Togi;

import flash.display.Sprite;

class TogiRow extends Sprite{
	private var _togis:Vector.<Togi>;
	public function TogiRow(data:XML){
		//_togis = togis;
		
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
			_togis.push(togi);
		}
	}
	
	
}