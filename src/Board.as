package
{
	import net.flashpunk.utils.Draw;
	public class Board 
	{	
		// A board needs a position, so you can fucking place the cards. 
		// I have a feeling this is going to be grody cause of reasons.
		
		// Index: -1 no card
		//        else: Heart Value
		
		public var height:int = 400;
		public var width:int = 400;
		public var x:int = 10;
		public var y:int = 40;
		
		private var boardIndex:Array = new Array();
		public function Board()
		{
			for (var i = 0; i < 5; i++) 
			{
				boardIndex[i] = new Array ();
				
				for (var j = 0; j < 5; j++) 
				{
					boardIndex[i][j] = -1;
				}
			}
			
		}
		
		public function render():void {
			Draw.rect(x,y,width,height);
		}
		
	}
}