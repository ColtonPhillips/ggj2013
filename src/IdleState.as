package
{
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.tweens.misc.VarTween;
	
	// Card is just, ya know, sitting there.
	public class IdleState extends CardState
	{
		public var tweenie:VarTween = new VarTween();

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
		
		override public function init(cardin:Card):void 
		{
			super.init(cardin);
			tweenie.tween(card.graphic, "scale", 1, 0.2);
			FP.world.addTween(tweenie, true);
			
		}
	}
}