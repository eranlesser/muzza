package com.utils
{
	import com.representation.view.Channel;
	
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;

	public class Claps{
		
		private var _sound:Sound;
		private var _channel:SoundChannel;
		public function Claps(){
			_sound = new Sound();
			var req:URLRequest = new URLRequest("../../assets/sounds/theme/CLAPS.mp3");
			try {
				_sound.load(req);
				//performance - to avoid cutting sound beginings
				_channel = _sound.play();
				_channel.stop();
				
			}
			catch (err:Error) {
				trace(err.message);
			}
		}
		
		public function play():void{
			_channel =_sound.play();
			var st:SoundTransform = _channel.soundTransform;
			st.volume = 0.5;
			_channel.soundTransform = st;
		}
		public function stop():void{
			_channel.stop();
		}
	}
}