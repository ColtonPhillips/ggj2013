package
{
	import net.flashpunk.FP;
	
	public class CardState
	{
		public var card:Card = null;
		
		public function CardState()
		{
		}

		public function update():void
		{
			
		}
		
		public function init(cardin:Card):void 
		{
			card = cardin;
		}
	}
}