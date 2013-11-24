package com.musicalInstruments.view
{
	public interface IMusicalInstrumentComp
	{
		function get octave():int;
		//function set octave(v:int):void;
		function set visible(bool:Boolean):void;
		function get visible():Boolean;
		function get noteId():String;
		function get x():Number;
		function get width():Number;
		function set state(stt:String):void;
	}
}