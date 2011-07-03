package br.eng.mosaic.pigeon.web.entities.background
	
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	
	public class Avatar extends Entity 	{
		
		[Embed(source = 'br/eng/mosaic/pigeon/web/assets/picture_of_avatar.png')] private const IMAGE:Class;
		
		public function Avatar(x:Number=0, y:Number=0, url:String=null, graphic:Graphic=null, mask:Mask=null){
			//super(x, y, graphic, mask);
			super(x, y, graphic, mask);
			var image:Image = new Image(IMAGE);
			this.graphic = image;
			this.setHitboxTo(image);
			
			
			if(url){
				loadImage(url);
			}
			
			
		}
		
		private var loader:URLLoader;
		
		private function loadImage(url:String):void{
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, loaderComplete);
			
			loader.dataFormat=URLLoaderDataFormat.BINARY;
			//loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, loaderComplete);
			
			
			loader.load(new URLRequest(url) );
		}
		
		
		public function loaderComplete(e:Event):void{
			var bytes:ByteArray = loader.data as ByteArray;
			
			var l:Loader = new Loader();
			
			
			l.loadBytes(bytes);
			
			l.contentLoaderInfo.addEventListener(Event.COMPLETE, function (event:Event):void{
				var obj:Bitmap = l.content as Bitmap;
				var image:net.flashpunk.graphics.Image = new net.flashpunk.graphics.Image(obj.bitmapData);
				var posX:int = x+(width-image.width)/2;
				var posY:int = y +(height-image.height)/2;
				var et:Entity = new Entity(posX, posY, image);
				
				FP.world.add(et);
				
			});
			
			
			
		}
	}
}