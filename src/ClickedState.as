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
			if (Input.mousePressed && card.collidePoint(card.x, card.y, Input.mouseX, Input.mouseY))
			{
				card.switchtoState(new IdleState());
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