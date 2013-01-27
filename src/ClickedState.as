package
{
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	// Card has been clicked
	public class ClickedState extends CardState
	{
		override public function ClickedState()
		{
			
		}

		override public function update():void
		{
			
			if (Input.mousePressed && card.collidePoint(card.x, card.y, Input.mouseX, Input.mouseY))
			{
				card.switchtoState(new IdleState());
			}
		}
	}
}