package com.view.gui
{
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.osflash.signals.Signal;
	import org.osflash.signals.natives.NativeSignal;
	
	public class Btn extends Sprite{
		
		private var _clicked:		Signal;
		private var _idle:			DisplayObject;
		private var _pressed:		DisplayObject;
		private var _visited:		DisplayObject;
		private var _id:String;
		
		public function Btn(idle:String,pressed:String,visited:String="",id:String=""){
			_id=id;
			_clicked = new Signal();
			_idle = AssetsManager.getAssetByName(idle);
			_pressed = AssetsManager.getAssetByName(pressed);
			_visited = AssetsManager.getAssetByName(visited);
			addChild(_idle);
			init();
		}
		
		public function get clicked():Signal{
			return _clicked;
		}
		
		public function set enabled(able:Boolean):void{
			if(able){
				this.alpha = 1;
				this.mouseEnabled = true;
			}else{
				this.alpha = 0;
				this.mouseEnabled = false;
				
			}
		}
		
		
		public function set state(state:String):void{
			removeChildAt(0);
			if(state=="idle"){
				addChild(_idle);
			}else if(state=="pressed"){
				addChild(_pressed);
			}else if(state=="visited"){
				addChild(_visited);
			}else{
				throw Error(new Error("no state",state))
			}
		}
		
		private function mouseDown(e:Event):void{
			state="pressed";
			stage.addEventListener(MouseEvent.MOUSE_UP,mouseUp);
		}
		
		private function mouseUp(e:Event):void{
			stage.removeEventListener(MouseEvent.MOUSE_UP,mouseUp);
			state="idle";
		}
		
		
		private function init():void{
			var nativeClicked:NativeSignal = new NativeSignal(this,MouseEvent.CLICK);
			nativeClicked.add(onClicked);
			addEventListener(MouseEvent.MOUSE_DOWN,mouseDown);
		}
		
		private function toggleIcons():void{
			if(removeChildAt(0)==_idle){
				addChild(_pressed);
			}else{
				addChild(_idle);
			}
		}
		
		private function onClicked(e:MouseEvent):void{
			_clicked.dispatch(_id);
		}
		
	}
}