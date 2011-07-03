package br.eng.mosaic.pigeon.web.model
{
	
	import br.eng.mosaic.pigeon.web.*;
	
	public class PigeonModel
	{
		//5 position array of TopFiveDTO objects
		private var topFive:Array = new Array[5];
		private var userID:String;
	
		private static var instance:PigeonModel = new PigeonModel();
		
		public function PigeonModel(){}
		
		public static function getInstance():PigeonModel{
			return instance;
		}
		
		public function getTopFive():Array{
			return topFive;
		}
		
		public function getScore():int{
			return ScoreManager.getInstance().getScore();
		}
		
		public function getUserID():String{
			return userID;
		}
		
		public function setTopFive(topFive:Array){
			this.topFive = topFive;
		}
		
		public function setUserID(userID:String){
			this.userID = userID;
		}
	}
}

