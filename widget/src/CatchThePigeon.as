
package
{
	import br.eng.mosaic.pigeon.web.model.PigeonModel;
	import br.eng.mosaic.pigeon.web.remote.FbHandler;
	import br.eng.mosaic.pigeon.web.remote.Service;
	import br.eng.mosaic.pigeon.web.remote.dto.TopFiveDTO;
	import br.eng.mosaic.pigeon.web.remote.dto.UserInfo;
	import br.eng.mosaic.pigeon.web.world.*;
	
	import com.adobe.serialization.json.JSON;
	
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.net.FileFilter;
	import flash.system.Security;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	
	public class CatchThePigeon extends Engine
	{
		private var _service:Service;
		
		public var userName:String;
		
		public var userinfo:UserInfo;
		
		
		public static var engine:CatchThePigeon;
		
		public var soundVolume:Number;
		
		public var soundEnabled:Boolean=true;
		
		
		public var message:String;
		
		private var _model:PigeonModel;
		
		
		
		
		public function CatchThePigeon()
		{
			super(760,600, 60, false);
			Mouse.hide();
			FP.world = new TelaInicial;
			var parameters:Object=this.root.loaderInfo.parameters;
			//FP.world = new PigeonSelection;
			//FP.world = new MyWorld;
			if(parameters.userid){
				PigeonModel.getInstance().userID = parameters.userid;
			}
			engine=this;
		}
	
		public function get service():Service
		{
			_service= new Service();
			return _service;
		}
		
		public function set service(value:Service):void
		{
			_service = value;
		}
		
		override public function init():void {
		
		Security.allowDomain("http://www.mosaic.eng.br");
			if(service){
				service.topFive().addResponder(new Responder(usernameResult, communcationFault));
			}
		}
		
		private function communcationFault(faultEvent:FaultEvent):void
		{
			
		}
		
		private function usernameResult(resultEvent:ResultEvent):void
		{
			var resultString:String=resultEvent.result.html.body.p as String;
			
			
			var object:Object=JSON.decode(resultString);
//			userinfo =new UserInfo(object);
			var topFive:Object = object.sucess.topfive;
			
			for(var i:int=0;i<5;i++){
				if(topFive[i]){
					var player:TopFiveDTO=new TopFiveDTO();
					player.setScore(topFive[i].score);
					player.setPhoto(topFive[i].url);
					PigeonModel.getInstance().topFive[i]=player;
				}
			}
			
			if(FP.world is TelaInicial){
				TelaInicial(FP.world).initAvatar();
			}
			
			
			
		}
		
		public override function update():void{
			if(Input.mouseFlashX>0 && Input.mouseFlashX<FP.width &&
				Input.mouseFlashY>0 && Input.mouseFlashY<FP.height){
				Mouse.hide();
			}
			super.update();
		}
		
	}
	
}