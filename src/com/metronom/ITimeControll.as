package com.metronom {
	import com.gskinner.motion.GTween;

	/**
	 * @author eranlesser
	 */
	public interface ITimeControll {
		function stop():void;
		function set beginAtFrame(frame:uint):void;
		function play(target:Object,duration:uint,props:Object):GTween;
		function togglePause():void;
		function toZero():void;
	}
}
