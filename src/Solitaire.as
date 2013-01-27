package
{
	import net.flashpunk.World;
	public class Solitaire extends World
	{
		public function Solitaire()
		{
			add(new Card);
		}
		override public function update():void
		{
			super.update();
		}
		
		override public function begin():void
		{
			// Called when World starts up
		}
	}
}