package
{
	import flash.display.Graphics;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
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
		[Embed(source = 'res/card 00.png')] private const CARD0:Class;
		[Embed(source = 'res/card 01.png')] private const CARD1:Class;
		[Embed(source = 'res/card 02.png')] private const CARD2:Class;
		[Embed(source = 'res/card 03.png')] private const CARD3:Class;
		[Embed(source = 'res/card 04.png')] private const CARD4:Class;
		[Embed(source = 'res/card 05.png')] private const CARD5:Class;
		
		public function Card(inindex:int)
		{
			graphic = getImageFromIndex(inindex);
			setHitbox((graphic as Image).width, (graphic as Image).height, (graphic as Image).width/2, (graphic as Image).height/2);
			(graphic as Image).centerOrigin();
		
			state = new IdleState();
			state.init(this);
			
			index = inindex;
		}
		
		private function getImageFromIndex(inindex:int):Image
		{
			var thecard:int = inindex % 6;
			
			switch (thecard)
			{
				case 0:
					return new Image(CARD0);
					break;
				case 1:
					return new Image(CARD1);
					break;
				case 2:
					return new Image(CARD2);
					break;
				case 3:
					return new Image(CARD3);
					break;
				case 4:
					return new Image(CARD4);
					break;
				case 5:
					return new Image(CARD5);
					break;
			}
			
			return new Image(CARD5);
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
		
		override public function render():void 
		{
			super.render();
			Draw.text(heartValue.toString(),x-10,y + 30)
		}
	}
}