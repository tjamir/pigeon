package br.eng.mosaic.pigeon.web.world 
{
	import br.eng.mosaic.pigeon.web.entities.Cursor;
	import br.eng.mosaic.pigeon.web.entities.FacebookConfig;
	import br.eng.mosaic.pigeon.web.entities.PlayButton;
	import br.eng.mosaic.pigeon.web.entities.background.*;
	
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
	import punk.ui.skins.*;
	
	/**
	 * ...
	 * @author Kellyton Brito
	 */
	public class  TelaInicial extends World {
		
		public static var pontuacao:int = 0;
		public var mensagem:String = "";
		public var textoDoUsuario:Text;
		public var userTextEntity:Entity ;
		public var cursor:Cursor=new Cursor;
		
		private var textArea:PunkTextArea;
		
		private var textLength:int = 140; //#CTP
		private var hashtagLength:int = 4; //#CTP
		private var highScoreLength:int = 4; //#top5
		
		[Embed(source = 'br/eng/mosaic/pigeon/web/assets/mosaic_pigeon_snd_menu5.mp3')]
		private static const BKG_MUSIC:Class;
		public static var bkg_music : Sfx = new Sfx(BKG_MUSIC);
		
		{
			PigeonSelection.bkg_music = bkg_music;
			TransitionScreen.bkg_music = bkg_music;
		}
		
		private function createBackground():void{
			var obj:Entity;
			
			add(new Bg());
			add(new OpeningScreen());
			add(new PlayButton(FP.width/2 -33, FP.height*2/3 -18));
			
			obj = new UserMessage();
			obj.x = FP.width/2 - 165;// - obj.width/2;
			obj.y = FP.height - 100; //obj.height;
			add(obj);
			
			add(new Avatar(150, 20));
			add(new Avatar(250, 20));
			add(new Avatar(350, 20));
			add(new Avatar(450, 20));
			add(new Avatar(550, 20));
			
			add(new Star(210,10));
			
			add (new Help(620,415));
			
			add (new Twitter(20, FP.height * 1/2));
			add (new FacebookButton(20, FP.height * 1/2 + 70));
			//add (new Pause(100, FP.height*1/2 + 240));
			
		}
		
		
		private const initText:String="<Put Message Here>";
		
		override public function begin():void 
		{
			createBackground();
			
			textArea = new PunkTextArea(initText, FP.width/2 - 160, FP.height - 65, 300, 65, new WhiteAfterlife);
			
			add(textArea); 
			
			// COlocar a musica de novo
			if (!bkg_music.playing){
				bkg_music.loop(0.5, 1);
			}
			
			add(cursor);
	
			
			super.begin();
		}
		
		override public function end():void{
			if(textArea.text != initText){
				CatchThePigeon(FP.engine).message=textArea.text;	
			}else{
				CatchThePigeon(FP.engine).message=null;
			}
		}
	
		
		public function TelaInicial() {
			
		}
		
		 public function startGame():void{
				//FP.world = new MyWorld;
			//FP.world = new Scenario1;
			 //FP.world = new Scenario2;
			 //FP.world = new Scenario3;
		}
		
		override public function update():void {
			super.update();
			
			
			mensagem = Input.keyString;
			
			if (textArea.text.length > (textLength - hashtagLength)){
				textArea.text = textArea.text.substr(0, textLength - hashtagLength);
			}
			
			this.bringForward(cursor);
			
		}
		
	}
	
}