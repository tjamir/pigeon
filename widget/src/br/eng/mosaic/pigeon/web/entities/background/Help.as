package br.eng.mosaic.pigeon.web.entities.background
	
{
	import br.eng.mosaic.pigeon.web.world.*;
	
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	public class Help extends Entity 	{
		
		[Embed(source = 'br/eng/mosaic/pigeon/web/assets/help.png')] private const IMAGE:Class;
		
		public function Help(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null){
			
			super(x, y, graphic, mask);
			
			this.graphic = new Image(IMAGE);
			
			this.setHitboxTo(this.graphic);

	
		}
		
		public override function update():void{
			if(Input.mousePressed&&this.collidePoint(x, y, Input.mouseX+42, Input.mouseY+42)){
				var request:URLRequest = new URLRequest("http://www.youtube.com/watch?v=7PGLdk6FHnY");
				navigateToURL(request, "_blank");
			}
		}
	}
}