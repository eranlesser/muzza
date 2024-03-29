package com.metronom {
	import org.osflash.signals.Signal;
	/**
	 * @author eranlesser
	 */
	public interface ITimeModel {
		function get currentTick():uint;
		function get tickSignal():Signal;
		function get duration():int;
	}
}
