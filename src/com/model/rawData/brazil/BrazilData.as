package com.model.rawData.brazil
{

public class BrazilData
{
public static var data:XML = 
<theme id='recycle' rhythm='16'>
<instruments>
{Drum.data}
{Bass.data}
{Bottles.data}
{Quika.data}
{Ganza.data}
{Agogo.data}
</instruments>
<screens>

<demoScreen type="ThemeTemplate" beginAtFrame="1" playSequance="99" nowPlaying="WATERCOLORS_of_BRAZIL_nowPlaying.png">
	<instrument type="drum.png" >
		<layout id="0" x='50' y='140' rotation="0" />
	</instrument>
	<instrument type='bass_flash.jpg' >
		<layout id="0" x='600' y='100' rotation="0" />
	</instrument>
	<instrument type='bottles.png' >
		<layout id="0" x='350' y='100'  rotation="0" />
	</instrument>
	<instrument type='quika' >
		<layout id="0" x='900' y='200'  rotation="0" />
	</instrument>
	<instrument type='ganza' >
		<layout id="0" x='900' y='250'  rotation="0" />
	</instrument>
	<instrument type='agogo' >
		<layout id="0" x='900' y='300'  rotation="0" />
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
<recordScreen type="RecordScreen"  beginAtFrame="1" endAtFrame="512" >
	<playerInstrument type="bottles.png" learnedSequanced="99" recordedSequance="102">
	<RecordedX>167</RecordedX>
	<RecordedY>360</RecordedY>
	</playerInstrument>
</recordScreen>


<recordScreen type="RecordScreen" beginAtFrame="1" endAtFrame="512" >
	<playerInstrument type="drum.png" learnedSequanced="99" recordedSequance="102">
	<RecordedX>380</RecordedX>
	<RecordedY>370</RecordedY>
	</playerInstrument>
	
</recordScreen>

<recordScreen type="RecordScreen"  beginAtFrame="1" endAtFrame="512" >
	<playerInstrument type="bass_flash.jpg" learnedSequanced="99" recordedSequance="102">
	<RecordedX>34</RecordedX>
	<RecordedY>440</RecordedY>
	</playerInstrument>
</recordScreen>

<endScreen type="ThemeTemplate" beginAtFrame="1" playSequance="102">
<backGroundSound id="0" source="brazil/drums/quika.mp3" />
	<instrument type="drum.png" >
<layout id="0" x='50' y='140'  rotation="0" />	
	</instrument>
	<instrument type='bass_flash.jpg'>
<layout id="0" x='600' y='100'  rotation="0" />	
	</instrument>
	<instrument type='bottles.png' >
<layout id="0" x='350' y='100'  rotation="0" />	
	</instrument>
</endScreen>
</recordSession>
</screens>
</theme>
	}
}