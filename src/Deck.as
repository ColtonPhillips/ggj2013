package
{
	import net.flashpunk.FP;
	
	public class Deck
	{
		public var cards:Array = new Array();
		public var randomCards:Array = new Array();
		
		public function Deck()
		{
			init();
			assignValues();
		}

		// First 4 cards must be 1 valued
		public function init():void 
		{
			for (var i:int = 0; i < 24; i++)
			{
				cards.push(new Card(i));
			}

			while (cards.length != 0 )
			{
				var indexToUse:int = FP.rand(cards.length);
				randomCards.push(cards.splice(indexToUse, 1)[0]);
			}
			
			cards = randomCards;
		}
		
		public function assignValues():void 
		{
			var values:Array = new Array( 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3 );
			var randomValues:Array = new Array();
			
			while (values.length != 0 )
			{
				var indexToUse:int = FP.rand(values.length);
				randomValues.push(values.splice(indexToUse, 1)[0]);
			}
			
			for (var i:int; i < 20; i++) 
			{
				(cards[i] as Card).heartValue = randomValues[i];
			}
			// last 4 are 1's
		}
		
		public function getNextCard():Card
		{
			return cards.pop();
		}	
	}
}