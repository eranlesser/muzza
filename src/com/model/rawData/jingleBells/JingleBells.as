package com.model.rawData.jingleBells
{
	
	public class JingleBells
	{
		public function JingleBells()
		{
		}
		public static var lyrics:XML = 
			<lyrics>
			<lyric cycle="2">
					<line value="Jingle bells, jingle bells," location="0" />
					<line value="Jingle all the way." location="32"/>
					<line value="Oh! what fun it is to ride" location="64" />
					<line value="In a one-horse open sleigh." location="90"/>
				</lyric>
				<lyric cycle="3">
					<line value="Jingle bells, jingle bells," location="0" />
					<line value="Jingle all the way" location="32"/>
					<line value=" Oh! what fun it is to ride" location="64" />
					<line value="In a one-horse open sleigh." location="90"/>
				</lyric>
				<lyric cycle="4">
					<line value="Dashing through the snow" location="0" />
					<line value="In a one-horse open sleigh" location="32"/>
					<line value="O'er the fields we go" location="64" />
					<line value=" Laughing all the way" location="96"/>
				</lyric>
				<lyric cycle="5">
					<line value="Bells on bobtail ring" location="0" />
					<line value="Making spirits bright" location="32"/>
					<line value="What fun it is to laugh and sing" location="64" />
					<line value="A sleighing song tonight!" location="96"/>
				</lyric>
				<lyric cycle="6">
					<line value="Jingle bells, jingle bells," location="0" />
					<line value="Jingle all the way." location="32"/>
					<line value="Oh! what fun it is to ride" location="64" />
					<line value="In a one-horse open sleigh." location="96"/>
				</lyric>
				<lyric cycle="7">
					<line value="Jingle bells, jingle bells," location="0" />
					<line value="Jingle all the way" location="32"/>
					<line value=" Oh! what fun it is to ride" location="64" />
					<line value="In a one-horse open sleigh." location="96"/>
				</lyric>
				
			</lyrics>
		public static var data:XML = 
			<theme id='recycle' rhythm='22'>
			<instruments>
		
		{Bottles.data}
		{Drum.data}
		{Bass.data}
		</instruments>
<screens>

<demoScreen type="ThemeTemplate" beginAtFrame="1" playSequance="99">
<instrument type="drum.png" >
	<layout id="0" x='50' y='140' rotation="0" />
	</instrument>
	<instrument type='bass_flash.jpg' >
	<layout id="0" x='600' y='100' rotation="0" />
	</instrument>
	<instrument type='bottles.png' >
	<layout id="0" x='350' y='100'  rotation="0" />
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
	<RecordedY>450</RecordedY>
	</playerInstrument>
	<bandInstrument type="drum.png">
<layout id="0" x='50' y='110'  rotation="0" />	
	<cycle count="1" sequance="99" />
	</bandInstrument>
	<bandInstrument type='bass_flash.jpg'>
<layout id="0" x='740' y='100'  rotation="0" />	
	<cycle count="1" sequance="99" />
	</bandInstrument>
</recordScreen>


<recordScreen type="RecordScreen" beginAtFrame="1" endAtFrame="512" >
	<playerInstrument type="drum.png" learnedSequanced="99" recordedSequance="102">
	<RecordedX>380</RecordedX>
	<RecordedY>250</RecordedY>
	</playerInstrument>
	<bandInstrument type="bottles.png">
	<layout id="0" x='50' y='110'  rotation="0" />	
	<cycle count="1" sequance="99" />
	</bandInstrument>
	<bandInstrument type='bass_flash.jpg' >
	<layout id="0" x='740' y='100'  rotation="0" />	
	<cycle count="1" sequance="99" />
	</bandInstrument>
</recordScreen>

<recordScreen type="RecordScreen"  beginAtFrame="1" endAtFrame="512" >
	<playerInstrument type="bass_flash.jpg" learnedSequanced="99" recordedSequance="102">
	<RecordedX>-1</RecordedX>
	<RecordedY>500</RecordedY>
	</playerInstrument>
	<bandInstrument type="bottles.png" >
	<layout id="0" x='50' y='110'  rotation="0" />	
	<cycle count="1" sequance="99" />
	</bandInstrument>
	<bandInstrument type='drum.png'>
	<layout id="0" x='740' y='100'  rotation="0" />	
	<cycle count="1" sequance="99" />
	</bandInstrument>
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
</endScreen>
</recordSession>
</screens>
				
		</theme>
	}
}