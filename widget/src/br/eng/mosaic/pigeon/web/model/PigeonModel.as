package br.eng.mosaic.pigeon.web.model
{
	
	import br.eng.mosaic.pigeon.web.*;
	
	public class PigeonModel
	{

		private var userMessage:String;

		//5 position array of TopFiveDTO objects
		private var _topFive:Array = new Array();		
		private var _userID:String;
	
		private static var instance:PigeonModel = new PigeonModel();
		
		public function PigeonModel(){}
		
		public static function getInstance():PigeonModel{
			return instance;
		}
		
		public function get topFive():Array{
			return _topFive;
		}
		
		public function get score():int{
			return ScoreManager.getInstance().getScore();
		}
		
		public function get userID():String{
			return _userID;
		}
		
		public function getUserMessage():String{
			return userMessage;
		}
		
		public function setUserMessage(userMessage:String){
			this.userMessage = userMessage;
		}
		
		public function set topFive(topFive:Array):void{
			this._topFive = topFive;
		}
		
		public function set userID(userID:String):void{
			this._userID = userID;
		}
	}
}

