package com.musicalInstruments.model.sequances
{
	import org.osflash.signals.Signal;

	public interface IRecordableSequance
	{
		function reset():void;
		function toXML():XML;
		function get isEmpty():Boolean;
		function get added():Signal;
	}
}