package
{
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.tweens.misc.VarTween;
	
	// Card has been clicked
	public class ClickedState extends CardState
	{
		public var tweenie:VarTween = new VarTween();
		
		override public function ClickedState()
		{
		}

		override public function update():void
		{
			// Click on the card to move to idle
			
			if (Input.mousePressed && card.collidePoint(card.x, card.y, FP.world.mouseX, FP.world.mouseY))
			{
				card.visible = false;
				card.switchtoState(new IdleState());
				return;
			}
			
			else if (Input.mousePressed )
			{
				if ((FP.world as Solitaire).board.isValidMove(Board.worldSpaceToBoard(card.x, 9001)[0], Board.worldSpaceToBoard(9001, card.y)[1], Board.worldSpaceToBoard(FP.world.mouseX, 9001)[0], Board.worldSpaceToBoard(9001, FP.world.mouseY)[1]))
				{
					FP.console.log(Board.worldSpaceToBoard(FP.world.mouseX, FP.world.mouseY)[1]);
					card.switchtoState(new MovingState(FP.world.mouseX, FP.world.mouseY));
				
				}
				else
				{
					card.visible = false;
				//	card.switchtoState(new IdleState());
				}
				
				}
			
		}
		
		override public function init(cardin:Card):void 
		{
			super.init(cardin);
			
			tweenie.tween(card.graphic, "scale", 1.2, 0.2);
			FP.world.addTween(tweenie,true)	
		}
	}
}