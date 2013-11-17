package com.musicalInstruments.view.components
{
	import com.view.tools.AssetsManager;
	
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;

	public class OctaveSelector extends Sprite{
		private var _selectedOctave:uint;
		private var _rect1:Selector;
		private var _rect2:Selector;
		public var changed:Signal=new Signal();
		
		public function OctaveSelector(){
			init();
			_selectedOctave=1;
		}
		
		
		public function get selectedOctave():uint{
			return _selectedOctave;
		}
		
		private function init():void{
			_rect1=new Selector("a");
			addChild(_rect1);
			_rect2=new Selector("b");
			addChild(_rect2);
			_rect2.x=58;
			
			_rect1.touched.add(onTouched);
			_rect2.touched.add(onTouched);
		}
		
		private function onTouched(label:String):void{
			var dispatch:Boolean=false;
			if(label=="a"){
				if(_selectedOctave==2){
					dispatch=true;
				}
				octave=1;
			}else{
				if(_selectedOctave==1){
					dispatch=true;
				}
				octave=2;
			}
			if(dispatch){
				changed.dispatch();
			}
		}
		
		public function set octave(indx:uint):void{
			_selectedOctave=indx;
			if(indx==1){
				_rect1.on=true;
				_rect2.on=false;
			}else{
				_rect1.on=false;
				_rect2.on=true;
			}
		}
	}

}
import com.view.tools.AssetsManager;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.MouseEvent;

import org.osflash.signals.Signal;


class Selector extends Sprite{
	private var _onState:DisplayObject;
	private var _offState:DisplayObject;
	private var _label:String;
	public var touched:Signal=new Signal();
	public function Selector(label:String){
		_label = label;
		init();
		addEventListener(MouseEvent.MOUSE_DOWN,onTouch);
	}
	
	private function onTouch(e:MouseEvent):void{
		touched.dispatch(_label);
	}
	
	private function init():void{
		_onState = AssetsManager.getAssetByName("cb_on.png");
		_offState = AssetsManager.getAssetByName("cb.png");
		var lbl:DisplayObject = addChild(AssetsManager.getAssetByName(_label+".png"));
		lbl.y=-26;
		lbl.x=(50-lbl.width)/2;
	}
	
	public function set on(flag:Boolean):void{
		if(numChildren>1){
			removeChildAt(1);
		}
		if(flag){
			addChildAt(_onState,1);
		}else{
			addChildAt(_offState,1);
		}
	}
	
	
	
	
	
}