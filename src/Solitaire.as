package
{
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
			
		}
		
		override public function render():void {
			super.render();
			board.render();
		}
	}
}