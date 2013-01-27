package
{
	import flash.display.Graphics;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class Card extends Entity
	{
		public var state:CardState = new CardState();
		private var nextState:CardState = null;
		
		// which card it is
		public var index:int = -1;
		
		// these are set in Deck.
		public var heartValue:int = 1;
		
		// TODO: There are 24 cards
		[Embed(source = 'res/card.png')] private const CARD:Class;
		public function Card(inindex:int)
		{
			graphic = getImageFromIndex();
			setHitbox((graphic as Image).width, (graphic as Image).height, (graphic as Image).width/2, (graphic as Image).height/2);
			(graphic as Image).centerOrigin();
		
			state = new IdleState();
			state.init(this);
			
			index = inindex;
		}
		
		private function getImageFromIndex():Image
		{
			return new Image(CARD);
		}

		override public function update():void
		{
			super.update();
			state.update();
			
			// Change states
			if (nextState != null)
			{
				state = nextState;
				state.init(this);
				nextState = null;
			}
			
		}
		
		override public function added():void
		{
			// Called when added to the world
		}
		
		public function switchtoState(inState:CardState):void 
		{
			nextState = inState;
		}
	}
}