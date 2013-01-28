package
{
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.tweens.misc.VarTween;
	
	// Card is just, ya know, doing some floating.
	public class MovingState extends CardState
	{
		public var tweenie:VarTween = new VarTween();
		public var targetX:int = 50;
		public var targetY:int = 100;
		
		// needs a target x and y
		override public function MovingState(xtarin:int, ytarin:int)
		{
			targetX = xtarin;
			targetY = ytarin;
		}

		override public function update():void
		{
			// Move towards target
			card.moveTowards(targetX, targetY, 8);
			// when you get there, switch to IdleState
			if (card.x == targetX && card.y == targetY)
			{
				card.switchtoState(new IdleState());
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