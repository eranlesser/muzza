package views.components
{
	import flash.display.Graphics;
	import flash.display.Shape;

	public class ArrowShape extends Shape
	{
		public function ArrowShape()
		{
			var g:Graphics = graphics;
			g.beginFill(0x000000);
			g.moveTo(-15, -10);
			g.lineTo(5, -10);
			g.lineTo(5, -20);
			g.lineTo(15, 0);
			g.lineTo(5, 20);
			g.lineTo(5, 10);
			g.lineTo(-15, 10);
			g.lineTo(-15, -10);
			g.endFill();
		}
	}
}