package com.screens.recordScreenStates
{
	import org.osflash.signals.Signal;

	public interface IRecordScreenState
	{
		function activate():void;
		function deActivate():void;
		function get complete():Signal;
		function get name():String;
		
		//function get context():RecordScreenStateController;
	}
}