package com.musicalInstruments.palleta.views
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class Loopee extends Pallet
	{
		private var _rows:Vector.<TogiRow>;
		[Embed(source="assets/notes_sheet.png")] 
		private var _bg:Class;
		[Embed(source="assets/notes_frame.png")] 
		private var _frame:Class;
		[Embed(source="assets/PLAY_BUTTON_IDLE.png")] 
		private var _playBut:Class;
		[Embed(source="assets/PLAY_BUTTON_PRESSED.png")] 
		private var _playButPressed:Class;
		
		public function Loopee(model:XML){
			_xml=model;
			super();
		}
		
		override public function get instrument():String{
			return "LOOPEE";
		}
		
		override protected function get bg():Class{
			return _bg;
		}
		
		override protected function get frame():Class{
			return _frame;
		}
		
		override protected function init():void{
			super.init();
			
			_rows = new Vector.<TogiRow>();
			var xx:uint=210;
			for each(var row:XML in _xml.row){
				var togiRow:TogiRow = new TogiRow(row);
				addChild(togiRow);
				togiRow.x=xx+2;
				xx+=togiRow.width+2;
				togiRow.y=50;
				_rows.push(togiRow);
			}
			var playBut:Sprite = new Sprite();
			playBut.addChild(new _playBut());
			playBut.addChild(new _playButPressed());
			addChild(playBut);
			playBut.getChildAt(1).visible=false;
			playBut.y=height/2-playBut.height/2;
			playBut.x=40;
			playBut.addEventListener(MouseEvent.CLICK,onPlay);
		}
		private function onPlay(e:MouseEvent):void{
			if(!Sprite(e.target).getChildAt(1).visible){
				isPlaying=Sprite(e.target).getChildAt(1).visible=true;
			}else{
				isPlaying=Sprite(e.target).getChildAt(1).visible=false;
			}
			playRequest.dispatch();
		}
		override public function onTick(tickValue:uint):void{
			if(_rows[tickValue].selectedTogi){
				_rows[tickValue].selectedTogi.play();
			}
			if(tickValue>0&&_rows[tickValue-1].selectedTogi)
				_rows[tickValue-1].selectedTogi.unPlay();
			if(tickValue==0&&_rows[_rows.length-1].selectedTogi){
				_rows[_rows.length-1].selectedTogi.unPlay();
			}
		}
	}
}
import views.components.Togi;

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