package com.messages
{
	import flash.display.Sprite;

	public class MessageControl
	{
		private var _activeMessage:AbstractMessage;
		private var _messageArea:Sprite;
		public function MessageControl(messageArea:Sprite){
			_messageArea = messageArea;
		}
		
		public function popUp(message:AbstractMessage):void{
			_activeMessage = message;
			_activeMessage.closeSignal.add(onCloseDispatched);
			_messageArea.addChild(_activeMessage);
			_activeMessage.start();
		}
		
		public function close():void{
			onCloseDispatched();
		}
		
		private function onCloseDispatched():void{
			_activeMessage.closeSignal.remove(onCloseDispatched);
			_messageArea.removeChild(_activeMessage);
		}
	}
}