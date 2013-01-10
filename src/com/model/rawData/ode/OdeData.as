package com.model.rawData.ode
{
	import com.musicalInstruments.palleta.views.Groovee;

public class OdeData
{
public static var data:XML = 
<theme id='recycle' rhythm='10'>
<instruments>
{Drum.data}
{Bass.data}
{Bottles.data}
{Claps.data}
{Chelo.data}
{Scratch.data}
</instruments>
<screens>

<demoScreen type="ThemeTemplate" beginAtFrame="1" endAtFrame="176" playSequance="99" nowPlaying="ODE_TO_JOY_nowPlaying.png">
	<instrument type="drum.png" >
	<layout id="0" x='50' y='140' rotation="0" />
	</instrument>
	<instrument type='bass_flash.jpg' >
	<layout id="0" x='600' y='100' rotation="0" />
	</instrument>
	<instrument type='bottles.png' >
	<layout id="0" x='350' y='100'  rotation="0" />
	</instrument>
<instrument type='scratch' >
		<layout id="0" x='800' y='570'  rotation="0" />
	</instrument>
<instrument type='chelo' >
		<layout id="0" x='720' y='570'  rotation="0" />
	</instrument>
<instrument type='claps' >
		<layout id="0" x='880' y='570'  rotation="0" />
	</instrument>
</demoScreen>

<studioScreen>
	<instrument type='bass_flash.jpg'>
	<layout id="0" x="-7" y="560" rotation="0" />
	<layout id="1" x="-7" y="568" rotation="0" />
	<layout id="2" x="-7" y="568" rotation="0" />
	</instrument>
	<instrument type="drum.png">
	<layout id="0" x="12" y="130" rotation="0"/>
	<layout id="1" x="320" y="190" rotation="90"/>
	<layout id="2" x="620" y="130" />
	</instrument>
	<instrument type='bottles.png' >
	<layout id="0" x="320" y="40" rotation="0"/>
	<layout id="1" x="160" y="2"  rotation="180"/>
	<layout id="2" x="-12" y="-10" rotation="140"/>
	</instrument>
</studioScreen>

<recordSession>
<recordScreen type="RecordScreen"  beginAtFrame="1" endAtFrame="176" >
	<playerInstrument type="bottles.png" learnedSequanced="99" palletSequance="10" recordedSequance="102" noteTargetsY="372">
	<RecordedX>-10</RecordedX>
	<RecordedY>360</RecordedY>
	</playerInstrument>
	<pallet type="claps"  rhythm="8" x='815' y='380'>
		
	</pallet>
<backups>

</backups>
</recordScreen>

<recordScreen type="RecordScreen" beginAtFrame="1" endAtFrame="176" >
	<playerInstrument type="drum.png" learnedSequanced="99" recordedSequance="102" palletSequance="99" noteTargetsY="454" notesTargetYOffset="8" >
	<RecordedX>50</RecordedX>
	<RecordedY>458</RecordedY>
	</playerInstrument>
<pallet type="scratch" learnedSequanced="99" rhythm="8" x='700' y='452'>
		
	</pallet>
<backups>
</backups>
</recordScreen>

<recordScreen type="RecordScreen"  beginAtFrame="1" endAtFrame="176" >
	<playerInstrument type="bass_flash.jpg" learnedSequanced="99" recordedSequance="102" palletSequance="99" noteTargetsY="422">
	<RecordedX>300</RecordedX>
	<RecordedY>420</RecordedY>
	</playerInstrument>
<pallet type="chelo" learnedSequanced="99" x='14' y='450'>
		
	</pallet>
<backups>
</backups>
</recordScreen>


<endScreen type="ThemeTemplate" beginAtFrame="1" playSequance="102">
	<instrument type="drum.png" >
<layout id="0" x='50' y='140'  rotation="0" />	
	</instrument>
	<instrument type='bass_flash.jpg'>
<layout id="0" x='600' y='100'  rotation="0" />	
	</instrument>
	<instrument type='bottles.png' >
<layout id="0" x='350' y='100'  rotation="0" />	
	</instrument>
<instrument type='scratch' >
		<layout id="0" x='650' y='580'  rotation="0" />
	</instrument>
<instrument type='chelo' >
		<layout id="0" x='570' y='580'  rotation="0" />
	</instrument>
<instrument type='claps' >
		<layout id="0" x='730' y='580'  rotation="0" />
	</instrument>
</endScreen>
</recordSession>
</screens>

<popups>
<popup id="open_demo" width="250" x="85" y="500">
<title>Demo</title>
<content>Click to hear a demo of what we are about to record together</content>
<direction>btm_left</direction>
</popup>

<popup id="close_demo" width="240" x="760" y="85" >
<title>Close</title>
<content>Click to close demo screen</content>
<direction>top_right</direction>
</popup>

<popup id="press_record" width="280" x="250" y="100" >
<title>Record</title>
<content>Click when you are ready to begin recording</content>
<direction>top_right</direction>
</popup>
</popups>
</theme>


	}
}

/*
<backups>
<instrument type="bottles.png" learnedSequanced="102" />
</backups>
*/