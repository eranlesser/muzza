package com.screens.view
{
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	
	

	public interface IScreen
	{
		function start():void;
		function stop():void;
		function set isRecorded(flag:Boolean):void;
		function parseXML(screenData:XML,instrumentsModel:ThemeInstrumentsModel):void
		//function set representationVisible(vis:Boolean):void;
		//function layout(direction:String):void;
		
		
	}
}