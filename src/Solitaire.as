package
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	// TODO: Solitaire needs to place cards on the board using a deck
	
	public class Solitaire extends World
	{
		public var board:Board = new Board();
		public var deck:Deck = new Deck();
		
		public function Solitaire()
		{
		}
		
		override public function update():void
		{
			super.update();
		}
		
		override public function begin():void
		{
			// Called when World starts up
			initBoard();
		}
		
		public function initBoard():void 
		{
				for (var i:int = 0; i < 24 ; i++) 
				{
					// Put the cards in the right spot
					// TODO: could prols add em one at a time and make em look more pretty
					var nextCard:Card = deck.getNextCard();
					board.addCard(nextCard);
					add(nextCard)
					
				}
		}
		
		override public function render():void {
			
			board.render();
			super.render();
		}
	}
}