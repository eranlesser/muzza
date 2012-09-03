package com.musicalInstruments.view.playable
{
	import org.osflash.signals.Signal;

	public interface IPerformer
	{
		function get isPerforming():Boolean;
		function get animationStateChanged():Signal;
	}
}