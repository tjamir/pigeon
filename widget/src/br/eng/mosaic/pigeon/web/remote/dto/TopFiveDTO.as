package br.eng.mosaic.pigeon.web.remote.dto
{
	import flash.utils.ByteArray;
	
	public class TopFiveDTO
	{
		
		private var score:int;
		private var photo:String;
		
		public function getScore():int{
			return score;
		}
		
		public function getPhoto():String{
			return photo;
		}

		public function setScore(score:int){
			this.score = score;
		}
		
		public function setPhoto(photo:String){
			this.photo = photo;
		}
		
		public function TopFiveDTO()
		{
			
		}
	}
}