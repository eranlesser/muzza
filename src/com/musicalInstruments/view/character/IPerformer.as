package com.musicalInstruments.view.character
{
	import org.osflash.signals.Signal;

	public interface IPerformer
	{
		function get isPerforming():Boolean;
		function get animationStateChanged():Signal;
	}
}