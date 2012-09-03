package com.screens.lyrics
{
	public class LyricController{
		
		private var _lyricsView:LyricView;
		private var _lyricsModel:Vector.<LyricModel>;
		public function LyricController(lyricView:LyricView,lyricsModel:Vector.<LyricModel>){
			_lyricsView = lyricView;
			_lyricsModel = lyricsModel;
		}
		
		public function set playCycle(cycle:uint):void{
			_lyricsView.clear();
			var lyricModel:LyricModel = getLyricsAtCycle(cycle);
			if(lyricModel){
				_lyricsView.visible=true;
				for each(var line:Line in lyricModel.lines){
					_lyricsView.showLyrics(line.text,line.location);
				}
			}else{
				_lyricsView.visible=false;
			}
		}
		private function getLyricsAtCycle(cycle:uint):LyricModel{
			var returnedLyricModel:LyricModel;
			for each(var lyricModel:LyricModel in _lyricsModel){
				if(lyricModel.cycle==cycle){
					returnedLyricModel = lyricModel
				}
			}
			return returnedLyricModel;
			
		}
		
	}
}