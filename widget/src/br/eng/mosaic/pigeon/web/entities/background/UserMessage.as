package br.eng.mosaic.pigeon.web.entities.background
	
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class UserMessage extends Entity 	{
		
		[Embed(source = 'br/eng/mosaic/pigeon/web/assets/messege_box.png')] private const IMAGE:Class;
		
		private var showed:Boolean = true;
		
		public function isShowed():Boolean{
			return showed;
		}
		
		public function setShow(showed:Boolean){
			this.showed = showed;
			if (showed){
				this.y = FP.height - 100;
			} else {
				this.y = FP.height - 30;
			}
		}
		
		public function UserMessage(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null){
			super(x, y, graphic, mask);
			
			this.graphic = new Image(IMAGE);
			
			this.setHitboxTo(this.graphic);
			
			//super(x, y, graphic, mask);
			
		}
	}
	}