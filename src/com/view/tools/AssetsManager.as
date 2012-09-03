package com.view.tools
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	
	import org.osflash.signals.Signal;

	public class AssetsManager{
		public var complete:Signal;
		
		private var _assets:XML = new XML(
			"<assets>" +
			"<image path='assets/crLogo.png' />"+
			//SPRITESHEET
			"<image path='assets/band/drums_new/drumsSheet.png' />"+
			"<image path='assets/band/drums_new/drumsEyes.png' />"+
			"<image path='assets/band/bottles_new/bottlesSheet.png' />"+
			"<image path='assets/band/bottles_new/bottlesEyes.png' />"+
			"<image path='assets/band/bottles/bottlesSheetSmall.png' />"+
			"<image path='assets/band/bottles/bottlesEyesSmall.png' />"+
			"<image path='assets/band/singer/singer.png' />"+
			"<image path='assets/band/singer/eyesSinger.png' />"+
			"<image path='assets/band/singer/mouth.png' />"+
			"<image path='assets/band/singeret/singeret.png' />"+
			"<image path='assets/band/singeret/eyesSingeret.png' />"+
			"<image path='assets/band/singeret/mouthSingeret.png' />"+
			
			"<image path='assets/band/bass/bassSheet.png' />"+
			"<image path='assets/band/bass/bassBlink.png' />"+
			"<image path='assets/band/Bubble_talk.png' />"+
			"<image path='assets/metronome.png' />"+
			//TUTORIAL
			"<image path='assets/tutorial/create1.jpg' />"+
			"<image path='assets/tutorial/create2.jpg' />"+
			"<image path='assets/tutorial/create3.jpg' />"+
			"<image path='assets/tutorial/create4.jpg' />"+
			
			//MENU
			"<image path='assets/gui/menu/BEETHOVEN_idle.png' />"+
			"<image path='assets/gui/menu/BEETHOVEN_Press.png' />"+
			"<image path='assets/gui/menu/mozart_idle.png' />"+
			"<image path='assets/gui/menu/mozart_press.png' />"+
			"<image path='assets/gui/menu/jingle_bells_idle.png' />"+
			"<image path='assets/gui/menu/edvard_grieg_idle.png' />"+
			"<image path='assets/gui/menu/blank.png' />"+
			"<image path='assets/gui/menu/edvard_grieg_press.png' />"+
			"<image path='assets/gui/menu/icons_black_background.png' />"+
			"<image path='assets/gui/menu/thumbnail.gif' />"+
			"<image path='assets/gui/menu/IMG_0033.JPG' />"+
			//HAT
			"<image path='assets/band/hat/hat.png' />"+
			"<image path='assets/band/hat/coin.png' />"+
			//NOTES
			
			"<image path='assets/representation/notes/note_h.png' />"+
			"<image path='assets/representation/notes/note_hf.png' />"+
			"<image path='assets/representation/notes/note_hs.png' />"+
			"<image path='assets/representation/notes/note_q.png' />"+
			"<image path='assets/representation/notes/note_qf.png' />"+
			"<image path='assets/representation/notes/note_qs.png' />"+
			"<image path='assets/representation/notes/note_w.png' />"+
			"<image path='assets/representation/notes/note_wf.png' />"+
			"<image path='assets/representation/notes/note_ws.png' />"+
			//visuals
			"<image path='assets/representation/visuals/vis_1.png' />"+
			"<image path='assets/representation/visuals/vis_2.png' />"+
			"<image path='assets/representation/visuals/vis_4.png' />"+
			//symbols
			"<image path='assets/representation/symbols/icon_1.png' />"+
			"<image path='assets/representation/symbols/icon_2.png' />"+
			"<image path='assets/representation/symbols/icon_3.png' />"+
			"<image path='assets/representation/symbols/icon_4.png' />"+
			"<image path='assets/representation/symbols/icon_5.png' />"+
			"<image path='assets/representation/symbols/icon_6.png' />"+
			"<image path='assets/representation/symbols/icon_7.png' />"+
			"<image path='assets/representation/symbols/icon_8.png' />"+
			"<image path='assets/representation/symbols/icon_9.png' />"+
			//Representation
			"<image path='assets/representation/marker_small.png' />"+
			"<image path='assets/representation/marker_big.png' />"+
			"<image path='assets/representation/marker_3.png' />"+
			"<image path='assets/representation/notearea_big.png' />"+
			"<image path='assets/representation/notearea_3.png' />"+
			"<image path='assets/representation/notearea_indx.png' />"+
			"<image path='assets/representation/notearea_small.png' />"+
			"<image path='assets/representation/icon_bass.png' />"+
			"<image path='assets/representation/icon_bass_.png' />"+
			"<image path='assets/representation/icon_bottles.png' />"+
			"<image path='assets/representation/icon_drums.png' />"+
			"<image path='assets/representation/icon_mic.png' />"+
			"<image path='assets/representation/icon_bottles_.png' />"+
			"<image path='assets/representation/icon_drums_.png' />"+
			"<image path='assets/representation/all.jpg' />"+
			"<image path='assets/representation/all_.jpg' />"+
			"<image path='assets/representation/text_track.png' />"+
			"<image path='assets/representation/wrong_alert.png' />"+
			"<image path='assets/representation/notebook_x4.png' />"+
			"<image path='assets/representation/representationUp.png' />"+
			"<image path='assets/representation/representationDown.png' />"+
			"<image path='assets/representation/good.jpg' />"+
			"<image path='assets/representation/bad.jpg' />"+
			
			//Rrpresentation Menu
			"<image path='assets/representation/menu/note.png' />"+
			"<image path='assets/representation/menu/vis.png' />"+
			"<image path='assets/representation/menu/number.png' />"+
			//Rrpresentation RadioList
			"<image path='assets/gui/radioList/autoBtn.png' />"+
			"<image path='assets/gui/radioList/autoBtn_selected.png' />"+
			"<image path='assets/gui/radioList/noteBtn.png' />"+
			"<image path='assets/gui/radioList/noteBtn_selected.png' />"+
			"<image path='assets/gui/radioList/symbolBtn.png' />"+
			"<image path='assets/gui/radioList/symbolBtn_selected.png' />"+
			"<image path='assets/gui/radioList/numBtn.png' />"+
			"<image path='assets/gui/radioList/numBtn_selected.png' />"+
			
			//GUI BUTTONS
			"<image path='assets/gui/play_idle.png' />"+
			"<image path='assets/gui/stop_idle.png' />"+
			"<image path='assets/gui/play_pressed.png' />"+
			"<image path='assets/gui/stop_pressed.png' />"+
			"<image path='assets/gui/record_idle.png' />"+
			"<image path='assets/gui/right_idle.png' />"+
			"<image path='assets/gui/right_pressed.png' />"+
			"<image path='assets/gui/left_idle.png' />"+
			"<image path='assets/gui/left_pressed.png' />"+
			"<image path='assets/gui/close.png' />"+
			"<image path='assets/gui/info.png' />"+
			"<image path='assets/gui/restart.png' />"+
			"<image path='assets/gui/next_idle.png' />"+
			"<image path='assets/gui/next_press.png' />"+
			"<image path='assets/gui/swap.jpg' />"+
			"<image path='assets/gui/lock.jpg' />"+

			"<image path='assets/gui/btn_home.png' />"+
			"<image path='assets/gui/icon_current_screen.png' />"+
			"<image path='assets/gui/icon_screen.png' />"+
			
			"<image path='assets/gui/FaceBook.png' />"+
			"<image path='assets/gui/start_icon.gif' />"+
			"<image path='assets/gui/start.jpg' />"+
			"<image path='assets/gui/instructions.jpg' />"+
			"<image path='assets/gui/plus.gif' />"+
			"<image path='assets/gui/Down_Arrow_Icon.png' />"+
			//BACKGROUND
			"<image path='assets/themes/ny/BCKGR_1.jpg' />"+
			"<image path='assets/themes/ny/BCKGR_1.png' />"+
			"<image path='assets/themes/ny/opening_screen.jpg' />"+
			"<image path='assets/themes/ny/sign.png' />"+
			//CLOCK
			"<image path='assets/themes/ny/mahog_big.png' />"+
			"<image path='assets/themes/ny/mahog_small.png' />"+
			"<image path='assets/themes/ny/mahog_small2.png' />"+
			"<image path='assets/themes/ny/clock.png' />"+
			"<image path='assets/themes/ny/clock_highLight.png' />"+
			"<image path='assets/themes/ny/Pole_Left.png' />"+
			"<image path='assets/themes/ny/SOUND_OFF.png' />"+
			"<image path='assets/themes/ny/SOUND_ON.png' />"+
			// INSTRUMENTS
			"<image path='assets/instruments/BASS/BASS_ICON_1_IDLE.png' />"+
			"<image path='assets/instruments/BASS/BASS_ICON_1_PRESS.png' />"+
			"<image path='assets/instruments/BASS/BASS_ICON_2_IDLE.png' />"+
			"<image path='assets/instruments/BASS/BASS_ICON_2_PRESS.png' />"+
			"<image path='assets/instruments/BASS/BASS_ICON_3_IDLE.png' />"+
			"<image path='assets/instruments/BASS/BASS_ICON_3_PRESS.png' />"+
			"<image path='assets/instruments/BASS/BASS_ICON_4_IDLE.png' />"+
			"<image path='assets/instruments/BASS/BASS_ICON_4_PRESS.png' />"+
			"<image path='assets/instruments/BASS/BASS_ICON_5_IDLE.png' />"+
			"<image path='assets/instruments/BASS/BASS_ICON_5_PRESS.png' />"+
			"<image path='assets/instruments/BASS/BASS_ICON_6_IDLE.png' />"+
			"<image path='assets/instruments/BASS/BASS_ICON_6_PRESS.png' />"+
			"<image path='assets/instruments/BASS/BASS_ICON_7_IDLE.png' />"+
			"<image path='assets/instruments/BASS/BASS_ICON_7_PRESS.png' />"+
			"<image path='assets/instruments/BASS/BASS_ICON_8_IDLE.png' />"+
			"<image path='assets/instruments/BASS/BASS_ICON_8_PRESS.png' />"+
			"<image path='assets/instruments/backgr_solo.jpg' />"+
			"<image path='assets/instruments/BASS/bass_spot_lights.png' />"+
			
			"<image path='assets/instruments/BOTTLES/studio_bottle_1_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/studio_bottle_1_press.png' />"+
			"<image path='assets/instruments/BOTTLES/studio_bottle_3_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/studio_bottle_3_press.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_1_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_1_press.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_2_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_2_press.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_3_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_3_press.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_4_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_4_press.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_5_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_5_press.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_6_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_6_press.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_7_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_7_press.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_8_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_8_press.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_9_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_9_press.png' />"+
			"<image path='assets/instruments/BOTTLES/Spot_light_bottle.png' />"+
			"<image path='assets/instruments/BOTTLES/spot_light_floor_bottle.png' />"+
			"<image path='assets/instruments/BOTTLES/BOttle_Frame.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_frame_BCKGR.png' />"+
			
			"<image path='assets/instruments/DRUMS/bottle_drum_0001.png' />"+
			"<image path='assets/instruments/DRUMS/bottle_drum_0002.png' />"+
			"<image path='assets/instruments/DRUMS/drum_1_0001.png' />"+
			"<image path='assets/instruments/DRUMS/drum_1_0002.png' />"+
			"<image path='assets/instruments/DRUMS/drum_2_0001.png' />"+
			"<image path='assets/instruments/DRUMS/drum_2_0002.png' />"+
			"<image path='assets/instruments/DRUMS/metzila_0001.png' />"+
			"<image path='assets/instruments/DRUMS/metzila_0002.png' />"+
			"<image path='assets/instruments/DRUMS/panel.png' />"+
			"<image path='assets/instruments/DRUMS/spot_light_floor.png' />"+
			"<image path='assets/instruments/DRUMS/spot_light_up.png' />"+
			
			"<image path='assets/instruments/backgr_solo.jpg' />"+
			"<image path='assets/lv.png' />"+
			"</assets>"
		
		);
		private static var  _loadedAssets:Vector.<Asset>;
		
		private var _totalAssets:uint=0;
		
		public function AssetsManager(){
			complete = new Signal();
			_loadedAssets = new Vector.<Asset>();
			preloadAssets();
		}
		
		private function preloadAssets():void{
			for each(var image:XML in _assets.children()){
				loadAsset(image.@path);
				_totalAssets++;
			}
		}
		
		public static function getAssetByName(name:String):DisplayObject{
			var displayObj:DisplayObject;
			for each(var obj:Asset in _loadedAssets){
				if(obj.name == name){
					displayObj  = new Bitmap(Bitmap(obj.image).bitmapData.clone());//clone
					break;	
				}
			}
			return displayObj;
		}
		
		public static function getBitmapData(name:String):BitmapData{
			var displayObj:BitmapData;
			for each(var obj:Asset in _loadedAssets){
				if(obj.name == name){
					displayObj  =Bitmap(obj.image).bitmapData;
					break;	
				}
			}
			return displayObj;
			
		}
		
		public static function getBitmap(name:String,clone:Boolean=false):Bitmap{
			var displayObj:Bitmap;
			for each(var obj:Asset in _loadedAssets){
				if(obj.name == name){
					if(clone){
						displayObj = new Bitmap(Bitmap(obj.image).bitmapData.clone());
					}else{
						displayObj  =Bitmap(obj.image);//clone
					}
					break;	
				}
			}
			return displayObj;
			
		}
		
		private function onAssetLoaded(e:Event):void{
			_loadedAssets.push(new Asset(LoaderInfo(e.target).url,LoaderInfo(e.target).content));
			if(_totalAssets == _loadedAssets.length){
				//dispatchEvent(new Event(Event.COMPLETE));
				
				complete.dispatch();
			}
		}
		
		private function loadAsset(file:String):void{
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onAssetLoaded);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			
			var request:URLRequest = new URLRequest(file);
			loader.load(request);
		}
		
		private function ioErrorHandler(event:IOErrorEvent):void {
			trace("Unable to load file:(asset manager) "+LoaderInfo(event.target).url );
		}
	}


}