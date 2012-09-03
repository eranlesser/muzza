package com.model.rawData.Tutorial
{

public class TutorialData
{
public static var data:XML = 
<theme id='recycle' rhythm='22'>
<instruments>
{Drum.data}
{Bass.data}
{Bottles.data}
</instruments>
<screens>

<demoScreen type="ThemeTemplate" beginAtFrame="1" playSequance="99">
	<instrument type="drum.png" x='50' y='140'>
	</instrument>
	<instrument type='bass_flash.jpg' x='600' y='100'>
	</instrument>
	<instrument type='bottles.png' x='350' y='100' >
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
<tutorialRecordScreen type="RecordScreen"  beginAtFrame="1" endAtFrame="64" >
	<playerInstrument type="bottles.png" learnedSequanced="99" recordedSequance="102">
	<RecordedX>400</RecordedX>
	<RecordedY>350</RecordedY>
	</playerInstrument>
	
</tutorialRecordScreen>

<tutorialRecordScreen type="RecordScreen" beginAtFrame="1" endAtFrame="64" >
	<playerInstrument type="drum.png" learnedSequanced="99" recordedSequance="102">
	<RecordedX>380</RecordedX>
	<RecordedY>400</RecordedY>
	</playerInstrument>
	
</tutorialRecordScreen>

<tutorialRecordScreen type="RecordScreen"  beginAtFrame="1" endAtFrame="64" >
	<playerInstrument type="bass_flash.jpg" learnedSequanced="99" recordedSequance="102">
	<RecordedX>-1</RecordedX>
	<RecordedY>470</RecordedY>
	</playerInstrument>
</tutorialRecordScreen>

<endScreen type="ThemeTemplate" beginAtFrame="1" playSequance="102">
	<instrument type="drum.png" x='50' y='140'>
	</instrument>
	<instrument type='bass_flash.jpg' x='600' y='100'>
	</instrument>
	<instrument type='bottles.png' x='350' y='100' >
	</instrument>
</endScreen>
</recordSession>
</screens>
</theme>
	}
}