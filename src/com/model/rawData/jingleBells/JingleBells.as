package com.model.rawData.jingleBells
{
	import com.model.rawData.edvard.FluteData;
	
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
			<theme id='recycle' rhythm='6'>
			<instruments>
			{Bottles.data}
		{Drum.data}
		{Bass.data}
		</instruments>
		<screens>
		
		<demoScreen type="ThemeTemplate" beginAtFrame="1" endAtFrame="1632" playSequance="99" nowPlaying="JingleBells_nowPlaying.png">
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
		
		
		<recordSession>
		
		
		<recordScreen type="RecordScreen"  beginAtFrame="700" endAtFrame="1632" >
			<playerInstrument type="bottles.png" learnedSequanced="99" palletSequance="10" recordedSequance="102" noteTargetsY="240">
			<RecordedX>102.5</RecordedX>
			<RecordedY>360</RecordedY>
			</playerInstrument>
		<backups>
		<instrument type="drum.png" >
		<layout id="0" x='50' y='140'  rotation="0" learnedSequanced="102" />	
			</instrument>
			<instrument type='bass_flash.jpg'>
		<layout id="0" x='600' y='100'  rotation="0" learnedSequanced="102"/>	
			</instrument>
		</backups>
		</recordScreen>
		
		
		<recordScreen type="RecordScreen" beginAtFrame="1" endAtFrame="632" >
			<playerInstrument type="drum.png" learnedSequanced="99" recordedSequance="102"  noteTargetsY="240"  >
			<RecordedX>308</RecordedX>
			<RecordedY>500</RecordedY>
			</playerInstrument>
		
		<backups>
			<instrument type='bass_flash.jpg'>
		<layout id="0" x='600' y='100'  rotation="0" learnedSequanced="102"/>	
			</instrument>
			<instrument type='bottles.png' >
		<layout id="0" x='350' y='100'  rotation="0" learnedSequanced="102"/>	
			</instrument>
		</backups>
		</recordScreen>
		
		
		<recordScreen type="RecordScreen"  beginAtFrame="1" endAtFrame="632" >
			<playerInstrument type="bass_flash.jpg" learnedSequanced="99" recordedSequance="102"  noteTargetsY="240">
			<RecordedX>178</RecordedX>
			<RecordedY>500</RecordedY>
			</playerInstrument>
		<backups>
		<instrument type="drum.png" >
		<layout id="0" x='50' y='140'  rotation="0" learnedSequanced="102" />	
			</instrument>
			<instrument type='bottles.png' >
		<layout id="0" x='350' y='100'  rotation="0" learnedSequanced="102"/>	
			</instrument>
		</backups>
		</recordScreen>
		
		
		
		
		
		<endScreen type="ThemeTemplate" beginAtFrame="1" endAtFrame="632" playSequance="102">
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