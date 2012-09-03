package com.representation
{
	import com.gamification.INoteDisplayer;
	import com.gamification.RepresentationtypeController;
	import com.view.gui.Btn;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class RepresentationMenu extends Sprite implements INoteDisplayer{
		
		private var _number:Btn;
		private var _vis:Btn;
		private var _note:Btn;
		private var _activeBtn:Btn;
		private var _bar:Sprite;
		public function RepresentationMenu(){
			init();
		}
		
		public function updateDisplay():void{
			setActiveRepresentation();
		}
		
		private function init():void{
			_number = new Btn("number.png","number.png");
			_vis = new Btn("vis.png","vis.png");
			_note = new Btn("note.png","note.png");
			_number.clicked.add(onNumber);
			_vis.clicked.add(onVis);
			_note.clicked.add(onNote);
			_bar = new Sprite();
			_bar.addChild(_number);
			//_bar.addChild(_vis);
			_bar.addChild(_note);
			_activeBtn = _number;
			addChild(_bar);
			this.addEventListener(MouseEvent.CLICK,open);
			_bar.visible = false;
			setActiveRepresentation();
			RepresentationtypeController.getInstane().register(this);
		}
		
		private function layout(btn1:Btn,btn2:Btn):void{
			_bar.addChild(_activeBtn);
			btn1.x=0;
			btn2.x=btn1.width+2;
			//btn3.x=2*btn1.width+4;
			_activeBtn = btn1;
			addChild(_activeBtn);
			//_bar.visible = false;
			
		}
		
		private function open(flag:Event):void{
			_bar.visible = !_bar.visible;
		}
		
		private function onNumber(flag:Boolean):void{
			layout(_number,_note);
			onRepresentationChanged();
		}
		private function onNote(flag:Boolean):void{
			layout(_note,_number);
			onRepresentationChanged();
		}
		private function onVis(flag:Boolean):void{
			layout(_note,_number);
			onRepresentationChanged();
		}
		
		private function setActiveRepresentation():void{
			var representationController:RepresentationtypeController = RepresentationtypeController.getInstane();
			switch(representationController.displayType){
				case RepresentationType.NUMBERS:
					layout(_number,_note);
					break;
				case RepresentationType.VISUALS:
					layout(_note,_number);
					break;
				case RepresentationType.NOTES:
					layout(_note,_number);
					break;
			}
		}
		
		private function onRepresentationChanged():void{
			var representationController:RepresentationtypeController = RepresentationtypeController.getInstane();
			switch(_activeBtn){
				case _number:
					representationController.displayType = RepresentationType.NUMBERS;
					break;
				case _vis:
					representationController.displayType = RepresentationType.VISUALS;
					break;
				case _note:
					representationController.displayType = RepresentationType.NOTES;
					break;
			}
		}
	}
}