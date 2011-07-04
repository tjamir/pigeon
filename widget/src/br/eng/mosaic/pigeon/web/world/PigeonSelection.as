package br.eng.mosaic.pigeon.web.world 
{
	import br.eng.mosaic.pigeon.web.entities.Cursor;
	import br.eng.mosaic.pigeon.web.entities.FacebookConfig;
	import br.eng.mosaic.pigeon.web.entities.PlayButton;
	import br.eng.mosaic.pigeon.web.entities.background.*;
	import br.eng.mosaic.pigeon.web.entities.background.selection.*;
	import br.eng.mosaic.pigeon.web.entities.background.transition.*;
	import br.eng.mosaic.pigeon.web.model.PigeonModel;
	
	import com.facebook.graph.Facebook;
	
	import flash.text.TextField;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import punk.ui.*;
	import punk.ui.skins.WhiteAfterlife;
	
	/**
	 * ...
	 * @author Kellyton Brito
	 */
	public class PigeonSelection extends World {
		
		public static var pontuacao:int = 0;
		var mensagem = "";
		var textoDoUsuario:Text;
		var userTextEntity:Entity ;
		public var cursor:Cursor=new Cursor;
		
		private var backButton:BackToStart;
		
		private var level:int;
		
		private var messageBorder:UserMessage;
		private var textArea:PunkTextArea;
		
		//public static var cursor:Cursor=new Cursor;
		
		[Embed(source = 'br/eng/mosaic/pigeon/web/assets/mosaic_pigeon_snd_menu5.mp3')]
		private static const BKG_MUSIC:Class;
		
		
		public static var bkg_music:Sfx= null;
		
		
		var go:Go;
		
		var sigeon:SigeonSelection;
		
		private function createBackground(){			
			add(new Bg());
			add(new BgSelection());
			//add(new OpeningScreen());
			//add(new PlayButton(FP.width/2, FP.height*2/3));
			
			messageBorder = new UserMessage();
			messageBorder.x = FP.width/2 - 165;// - obj.width/2;
			messageBorder.y = FP.height - 100; //obj.height;
			add(messageBorder);
			
			/*var obj:Entity;
			obj = new UserMessage();
			obj.x = FP.width/2 - 165;
			obj.y = FP.height - 100; //obj.height;
			add(obj);*/
			 
			//add (new Points(250,30));
			//add (new Figeon(250, 120));
			
			//TODO ajeitar para aparecer bonitinho
			//add (new Back(272, 380));
			//add (new Separator(280 + 67, 380));
			
			//go = new Go(415, 380);
			//add(go);
			
			//TODO Ajeitar a posição para aparecer bonitinho
/*			add(new Avatar(450, 20));
			add(new Avatar(550, 20));
			add(new Avatar(650, 20));
			add(new Avatar(450, 150));
			add(new Avatar(550, 150)); */
			
			//add(new Star(210,10));
			
			add (new Help(635,420));
			
			add (new FacebookButton(20, FP.height * 1.8/3));
			add (new Twitter(20, FP.height * 1.8/3 + 70));
			//add (new Pause(100, FP.height*1/2 + 240));
			
			backButton = new BackToStart(20, FP.height*1/2 + 240);
			add (backButton);
			
			sigeon = new SigeonSelection(100, 200);
			add(sigeon);
			//add (new SigeonSelection(100, 200));
			add (new FigeonSelection(290, 300));
			add (new FigeanSelection(500, 200));
			
		}
		
		override public function begin():void 
		{
			createBackground();
			
			//textArea = new PunkTextArea(PigeonModel.getInstance().getUserMessage(), FP.width/2 - 150, FP.height - 65, 300, 65, new WhiteAfterlife);
			textArea = new PunkTextArea(PigeonModel.getInstance().getUserMessage(), FP.width/2 - 150, FP.height - 65, 300, 65, new WhiteAfterlife);
			
			add(textArea); 
			
			if(!bkg_music){
				bkg_music=new Sfx(BKG_MUSIC);
			}
			if (!bkg_music.playing){
				bkg_music.loop(0.5, 1);
			}
			
			add(cursor);
			
			
			super.begin();
		}
		
		public override function end():void{
			bkg_music.stop();
			PigeonModel.getInstance().setUserMessage(textArea.text);
		}
		
		public function PigeonSelection() {
			super();
		}
		
		public function startGame():void{
			//FP.world = new MyWorld;
		}
		
		override public function update():void {
			super.update();
			
			if(Input.mousePressed&&backButton.collidePoint(backButton.x, backButton.y, Input.mouseX+44, Input.mouseY+44)){
				FP.world = new TelaInicial();
			}
			
			//Show/hide the text area
			if(Input.mousePressed&&messageBorder.collidePoint(messageBorder.x, messageBorder.y, Input.mouseX+42, Input.mouseY+42)){
				messageBorder.setShow(!messageBorder.isShowed());
				//Show
				if (messageBorder.isShowed()){
					textArea.visible = true;
				} else { //Hide
					textArea.visible = false;
				} 
			}
			
			//if(Input.mousePressed&&playButton.collidePoint(playButton.x, playButton.y, Input.mouseX+42, Input.mouseY+42)){
				//PigeonModel.getInstance().setUserMessage(textArea.text);
			//}
			
			this.bringForward(cursor);
			
		}
		
	}
	
}