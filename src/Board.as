package
{
	import net.flashpunk.utils.Draw;
	public class Board 
	{	
		// A board needs a position, so you can fucking place the cards. 
		// I have a feeling this is going to be grody cause of reasons.
		
		// Index: -1 no card
		//        else: Heart Value
		
		
		// FUCK ! marta made me code fast this is all her fault she should work as a 
		// producer at inlight.
		
		public var chinceX:Array = new Array(1, 2, 3, 2, 1, 3, 3, 1, 2, 4, 2, 0, 0, 1, 3, 4, 4, 3, 1, 0, 0, 4, 4, 0);
		public var chinceY:Array = new Array(2, 1, 2, 3, 1, 1, 3, 3, 0, 2, 4, 2, 1, 0, 0, 1, 3, 4, 4, 3, 0, 0, 4, 4);
		
		
		public static var width:int = 500;
		public static var height:int = 600;
		
		public static var x:int = 0;
		public static var y:int = 0;
		
		public var cards:Array = new Array();
		public function Board()
		{
			for (var i:int = 0; i < 5; i++) 
			{
				cards[i] = new Array ();
				
				for (var j:int = 0; j < 5; j++) 
				{
					cards[i][j] = null;
				}
			}
			
		}
		
		public function addCard(card:Card):void 
		{
			var nextX:int = chinceX.splice(0, 1);
			var nextY:int = chinceY.splice(0, 1); 
			
			cards[nextX][nextY] = card;
			
			card.x = boardSpaceToWorld(nextX,nextY)[0] + width/5/2;
			card.y = boardSpaceToWorld(nextX,nextY)[1] + height/5/2;
		}
		// eh, hopefully truncates how we like it!
		public static function worldSpaceToBoard(xin:int, yin:int):Array
		{
			var xIndex:int = ((xin - x) / (width / 5));
			var yIndex:int = ((yin - y) / (height / 5));
			return new Array(xIndex,yIndex);
		}
		
		// For card placement. top left of the goy.
		public static function boardSpaceToWorld(xIndex:int, yIndex:int):Array
		{
			var xout:int = xIndex  * (width / 5) + x;
			var yout:int = yIndex * (height / 5) + y;
			return new Array(xout, yout);
		}
		
		public function isValidMove(xIndex:int, yIndex:int, targetX:int, targetY:int):Boolean
		{
			return true;
			
			if (cards[targetX][targetY] is Card)
			{
				return false;
			}
			
			// there are four cases
			var card:Card = cards[xIndex][yIndex];
			
			if (xIndex == targetX - 2 && yIndex == targetY)
			{
				if (!(cards[xIndex+1][yIndex] is Card )|| card.heartValue < (cards[xIndex+1][yIndex] as Card).heartValue)
				{
					return false;
				}
				// Remove middle card
				cards[xIndex + 1][yIndex] = null;
				return true;
				
			}
			if (xIndex == targetX + 2 && yIndex == targetY)
			{
				return true;
			}
			if (xIndex == targetX && yIndex == targetY - 2)
			{
				return true;
				//
			}
			if (xIndex == targetX && yIndex == targetY + 2)
			{
				return true;
			}
				
			return false;
		}
		
		public function render():void {
			Draw.rect(x,y,width,height,0x000000);
		}
	}
}