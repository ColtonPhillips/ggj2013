package
{
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	// Card is just, ya know, sitting there.
	public class IdleState extends CardState
	{
		override public function IdleState()
		{
			
		}

		override public function update():void
		{
			if (Input.mousePressed && card.collidePoint(card.x, card.y, Input.mouseX, Input.mouseY))
			{
				card.switchtoState(new ClickedState());
			}
		}
	}
}