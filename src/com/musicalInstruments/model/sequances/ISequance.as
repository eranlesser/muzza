package com.musicalInstruments.model.sequances
{
	import com.musicalInstruments.model.SequancedNote;
	import org.osflash.signals.Signal;
	

	public interface ISequance
	{
		function get id():uint
		function destroy():void;
	}
}