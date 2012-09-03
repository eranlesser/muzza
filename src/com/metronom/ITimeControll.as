package com.metronom {
	/**
	 * @author eranlesser
	 */
	public interface ITimeControll {
		function stop():void;
		function set beginAtFrame(frame:uint):void;
		function get stopPosition():uint;
		function play():void;
		function pause():void;
		function unPause():void;
	}
}
