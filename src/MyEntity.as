package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class MyEntity extends Entity
	{
		[Embed(source = 'res/player.png')] private const PLAYER:Class;
		public function MyEntity()
		{
			Input.define("Left", 	Key.LEFT, 	Key.A);
			Input.define("Right", 	Key.RIGHT, 	Key.D);
			Input.define("Up", 		Key.UP, 	Key.W);
			Input.define("Down", 	Key.DOWN, 	Key.S);
			
			graphic = new Image(PLAYER);
		}

		override public function update():void
		{
			super.update();
			
			if (Input.check("Left")) 	{ x -= 5; }
			if (Input.check("Right"))	{ x += 5; }
			if (Input.check("Up")) 		{ y -= 5; }
			if (Input.check("Down")) 	{ y += 5; }
		}
		
		override public function added():void
		{
			// Called when added to the world
		}
	}
}