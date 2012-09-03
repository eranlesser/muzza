package com.view.gui
{
	import flash.display.Shape;
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;
	
	public class RadioGroup extends Sprite
	{
		private var _btns:Vector.<Btn>;
		private var _selectedButton:Btn;
		private var _changed:Signal;
		
		public function RadioGroup(){
			_btns = new Vector.<Btn>();
			_changed = new Signal();
		}
		
		public function addButton(btn:Btn):void{
			//var btn:Btn = new Btn(assetName+"_idle.png",assetName+"_selected.png");
			addChild(btn);
			//btn.x = (100-btn.width)/2;
			btn.y = _btns.length*32+(32-btn.height)/2;
			_btns.push(btn);
			btn.selected.add(onButtonClicked);
			/*_bg.graphics.clear();
			_bg.graphics.beginFill(0XFFFFFF);
			_bg.graphics.lineStyle(1);
			_bg.graphics.drawRoundRect(0,0,100,_btns.length*32,8,8);
			_bg.graphics.endFill();*/
		}
		
		public function get change():Signal{
			return _changed;
		}
		
		public function get selectedIndex():uint{
			return _btns.indexOf(_selectedButton);
		}
		
		public function set selectedIndex(indx:uint):void{
			onButtonClicked(_btns[indx])
		}
		
		private function onButtonClicked(target:Btn):void{
			for each(var btn:Btn in _btns){
				btn.state = "on";
			}
			_selectedButton = target;
			target.state = "off";
			_changed.dispatch();
		}
	}
}