package com.model
{
	import com.constants.Session;
	import com.musicalInstruments.model.sequances.RecordableNotesSequance;
	
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import org.osflash.signals.Signal;
	
	public class FileProxy
	{
		private static var _highScore:int=0;
		public static var freeStyleSignal:Signal = new Signal();
		public function FileProxy(){
			
		}
		public static function getFullPath(id:uint):String{
			var inputFile:File = File.applicationStorageDirectory.resolvePath("song_"+Session.SONG_NAME+"/instruments/voice/sequance"+id.toString()+".mp3") ;
			return inputFile.url;
		}
		
		
		
		
		
		public static function exportSequance(sequance:RecordableNotesSequance,instrument:String):void{
			var folder:File = File.applicationStorageDirectory.resolvePath("song_"+Session.SONG_NAME+"/instruments/"+instrument);
			if (!folder.exists) { 
				folder.createDirectory();
			} 
			var outputFile:File = folder.resolvePath("sequance"+sequance.id.toString()+".xml");
			if(outputFile.exists){
				outputFile.deleteFile();
			}
			var outputStream:FileStream = new FileStream();
			outputStream.open(outputFile,FileMode.WRITE);
			var outputString:String = '<?xml version="1.0" encoding="utf-8"?>\n';
			outputString += sequance.toXML().toXMLString()+'\n';
			outputStream.writeUTFBytes(outputString);
			outputStream.close();
		}
		
		public static function importSequance(file:File):XML{
			//var inputFile:File = File.applicationStorageDirectory.resolvePath(url) ;
			var inputStream:FileStream = new FileStream();
			inputStream.open(file, FileMode.READ);
			var sequanceXML:XML = XML(inputStream.readUTFBytes(inputStream.bytesAvailable));
			inputStream.close();
			return sequanceXML;
		}
		
		public static function getRecordedSequancesFileNames(instrument:String):Array{
			var inputFile:File = File.applicationStorageDirectory.resolvePath("song_"+Session.SONG_NAME+"/instruments/"+instrument) ;
			if(inputFile.isDirectory)
				return inputFile.getDirectoryListing();
			else
				return new Array();
			
		}
		
		public static function setHighScore(score:int):void{
			if(score<=getHighScore()){
				return;
			}
			var folder:File = File.applicationStorageDirectory.resolvePath("score/song_"+Session.SONG_NAME);
			if (!folder.exists) { 
				folder.createDirectory();
			} 
			var outputFile:File = folder.resolvePath("highScore.xml");
			if(outputFile.exists){
				outputFile.deleteFile();
			}
			var outputStream:FileStream = new FileStream();
			outputStream.open(outputFile,FileMode.WRITE);
			var outputString:String = '<?xml version="1.0" encoding="utf-8"?>\n';
			outputString += '<data><score high="'+score.toString()+'" /></data>';
			outputStream.writeUTFBytes(outputString);
			outputStream.close();
		}
		
		public static function getHighScore():int{
			var inputFile:File = File.applicationStorageDirectory.resolvePath("score/song_"+Session.SONG_NAME+"/highScore.xml") ;
			if(inputFile.exists){
				var inputStream:FileStream = new FileStream();
				inputStream.open(inputFile, FileMode.READ);
				var sessionXML:XML = XML(inputStream.readUTFBytes(inputStream.bytesAvailable));
				inputStream.close();
				return sessionXML.score.@high;
			}else{
				return 0;
			}
		}
		
		public static function setFullVersion(val:String):void{
			
			var outputFile:File = File.documentsDirectory.resolvePath("melody/session/fullVersion.xml") ;
			if(outputFile.exists){
				outputFile.deleteFile();
			}
			var outputStream:FileStream = new FileStream();
			outputStream.open(outputFile,FileMode.WRITE);
			var outputString:String = '<?xml version="1.0" encoding="utf-8"?>\n';
			outputString += '<data><session fullversion="'+val+'" /></data>';
			outputStream.writeUTFBytes(outputString);
			outputStream.close();
		}
		
		public static function getFullVersion():Boolean{
			var inputFile:File = File.documentsDirectory.resolvePath("melody/session/fullVersion.xml") ;
			if(inputFile.exists){
				var inputStream:FileStream = new FileStream();
				inputStream.open(inputFile, FileMode.READ);
				var sessionXML:XML = XML(inputStream.readUTFBytes(inputStream.bytesAvailable));
				inputStream.close();
				return sessionXML.session.@fullversion == "true";
			}else{
				return false;
			}
		}
		
		public static function getBestScore(instrument:String):uint{
			var inputFile:File = File.applicationStorageDirectory.resolvePath("score/song_"+Session.SONG_NAME+"/"+instrument+".xml") ;
			if(inputFile.exists){
				var inputStream:FileStream = new FileStream();
				inputStream.open(inputFile, FileMode.READ);
				var sessionXML:XML = XML(inputStream.readUTFBytes(inputStream.bytesAvailable));
				inputStream.close();
				return sessionXML.score.@best;
			}else{
				return 0;
			}
		}
		
		public static function setBestScore(instrument:String,score:uint):void{
			if(score<=getBestScore(instrument)){
				return;
			}
			var folder:File = File.applicationStorageDirectory.resolvePath("score/song_"+Session.SONG_NAME);
			if (!folder.exists) { 
				folder.createDirectory();
			} 
			var outputFile:File = folder.resolvePath(instrument+".xml");
			if(outputFile.exists){
				outputFile.deleteFile();
			}
			var outputStream:FileStream = new FileStream();
			outputStream.open(outputFile,FileMode.WRITE);
			var outputString:String = '<?xml version="1.0" encoding="utf-8"?>\n';
			outputString += '<data><score best="'+score.toString()+'" /></data>';
			outputStream.writeUTFBytes(outputString);
			outputStream.close();
		}
		
		
		
		
		public  function getSongData(songInx:uint,instrument:String,id:uint):XML{
			var inputFile:File = File.applicationStorageDirectory.resolvePath("song"+songInx+"/instruments/"+instrument+"/sequance"+id.toString()+".xml") ;
			var inputStream:FileStream = new FileStream();
			inputStream.open(inputFile, FileMode.READ);
			var sequanceXML:XML = XML(inputStream.readUTFBytes(inputStream.bytesAvailable));
			inputStream.close();
			return sequanceXML;
			
			//return new XML();
		}
		
		
//		public  function exportSessionData(sessionXml:XML):void{
//			var folder:File = File.applicationStorageDirectory.resolvePath("sessions");
//			if (!folder.exists) { 
//				folder.createDirectory();
//			} 
//			var outputFile:File = folder.resolvePath("userSession.xml");
//			if(outputFile.exists){
//				outputFile.deleteFile();
//			}
//			var outputStream:FileStream = new FileStream();
//			outputStream.open(outputFile,FileMode.WRITE);
//			var outputString:String = '<?xml version="1.0" encoding="utf-8"?>\n';
//			//outputString += '<userSession>\n';
//			outputString += sessionXml.toXMLString()+'\n';
//			//outputString += '</userSession>\n';
//			outputStream.writeUTFBytes(outputString);
//			outputStream.close();
//		}
		
		public static function reset(protector:TrainBeats):void{
			var files:Array=File.applicationStorageDirectory.getDirectoryListing();
			for each(var file:File in files){
				if(file.isDirectory){
					if(file.name != "score" && file.name != "config" && file.name != "session"){
						file.deleteDirectory(true);
					}
				}else{
					file.deleteFile();
				}
			}
		}
		public static function resetTutorial():void{
			var files:Array=File.applicationStorageDirectory.getDirectoryListing();
			for each(var file:File in files){
				if(file.isDirectory&&file.name=="song_tutorial"){
					if(file.isDirectory){
						file.deleteDirectory(true);
					}else{
						file.deleteFile();
					}
				}
			}
		}
		
	}
}