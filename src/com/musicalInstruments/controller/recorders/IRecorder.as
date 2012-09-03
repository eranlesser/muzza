package com.musicalInstruments.controller.recorders
{
	import com.musicalInstruments.model.sequances.ISequance;
	
	import org.osflash.signals.Signal;
	

	public interface IRecorder
	{
		function get sequance():ISequance;
		function get added():Signal;
		function beginRecord():void;
		function endRecord():void;
	}
}