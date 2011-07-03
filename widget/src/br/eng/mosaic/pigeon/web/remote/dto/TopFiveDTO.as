package br.eng.mosaic.pigeon.web.remote.dto
{
	import flash.utils.ByteArray;
	
	public class TopFiveDTO
	{
		
		private var score:int;
		private var photo:ByteArray;
		
		public function getScore():int{
			return score;
		}
		
		public function getPhoto():ByteArray{
			return photo;
		}

		public function setScore(score:int){
			this.score = score;
		}
		
		public function setPhoto(photo:ByteArray){
			this.photo = photo;
		}
		
		public function TopFiveDTO()
		{
			
		}
	}
}