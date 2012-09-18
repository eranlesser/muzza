package com.container
{
	import com.constants.Rhythms;
	import com.constants.Session;
	import com.container.controller.ProgressControl;
	import com.model.IThemeModel;
	import com.model.MainThemeModel;
	import com.model.rawData.Data;
	import com.musicalInstruments.Band;
	import com.screens.view.components.Clock;

	public class ThemesController{
		
		private var _presenter:			Presenter;
		private var _themeProgressors:	Vector.<ProgressControl>;
		private var _progressControlIndex:	uint=0;
		private var _playMode:String;
		
		public function ThemesController(view:Presenter){
			_presenter = view;
			_themeProgressors = new Vector.<ProgressControl>();
			init();
		}
		
		private function init():void{
			_presenter.addStartScreen();
			_presenter.start(this);
			_presenter.songMenu.playRequest.add(onSongSelected);
			_presenter.tutorialRequest.add(onSongSelected);
		}
		
		private function onSongSelected(name:String):void{
			startProgressControll(name,"record");
		}
		
		private function startProgressControll(name:String,mode:String):void{
			Session.SONG_NAME=name;
			_playMode=mode;
			_presenter.removeStartScreen();
			if(_themeProgressors.length>_progressControlIndex &&_themeProgressors[_progressControlIndex]){//reset old progresscontroll
				_themeProgressors[_progressControlIndex].reset();
			}
			_progressControlIndex = getProgressControllerIndex(name);
			//_progressControl = getProgressController(name);
			if(_themeProgressors.length>_progressControlIndex &&_themeProgressors[_progressControlIndex]){
				_themeProgressors[_progressControlIndex].start(mode);
			}else{
				var themeModel:MainThemeModel = new MainThemeModel(Data.getSongData(name));
				var progressControl:ProgressControl = new ProgressControl(_presenter,themeModel.screensModel,name,themeModel.rhythm);
				themeModel.ready.addOnce(onThemeReady);
				_themeProgressors.push(progressControl);
				_progressControlIndex=_themeProgressors.indexOf(progressControl);
				
			}
			Rhythms.DELAY_COUNT = _themeProgressors[_progressControlIndex].frameRate;
			_presenter.stage.frameRate = Rhythms.DELAY_COUNT;
			_themeProgressors[_progressControlIndex].goHomeSignal.add(reStartScreen);
		}
		
		private function onThemeReady():void{
			_themeProgressors[_progressControlIndex].start(_playMode);
		}
		
		private function reStartScreen():void{
			_presenter.clearScreens();
			_presenter.restart(this);
			//_progressControl.goHomeSignal.remove(reStartScreen);
		}
		
	/*
		public function resetData():void{
			while(_themeProgressors.length>0){
				_themeProgressors.pop().reset();
			}
			while(_themeModels.length>0){
				_themeModels.pop().reset();
			}
		}
		*/
		private function getProgressControllerIndex(theme:String):uint{
			var returnedProgressControl:ProgressControl;
			for each(var progressControl:ProgressControl in _themeProgressors){
				if(progressControl.theme == theme){
					returnedProgressControl = progressControl;
				}
			}
			return _themeProgressors.indexOf(returnedProgressControl);
		}
		
		
	}
}