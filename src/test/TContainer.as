package test 
{
	import core.base.Container;
	import core.utils.Layout;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class TContainer extends Container 
	{
		private var color:uint;
		public function TContainer() 
		{
			trace(">>TContainer");
			super();
		}
		
		override public function initGraphics():void
		{
			trace(">>initGraphics");
			graphics.beginFill(0x00FF00, 1);
			graphics.drawRect(0, 0, 100, 100);
			graphics.endFill();
		}
		
		override public function onResize():void
		{
			trace(">>onResize");
			scaleX = (stage.stageWidth/width) / 2;
		}
		
		override public function update(): void
		{
			color += 1;
			trace(">>update");
		}
		
		override public function preUpdate():void 
		{
			trace(">>preUpdate");
		}
		
		override public function secondTick():void
		{
			color *= 0x10;
			trace(">>secondTick");
		}
		
		override public function preSecondTick():void 
		{
			trace(">>PREsecondTick");
		}
		
		override public function rendering():void
		{
			trace(">>rendering");
			var tWidth:int = width;
			var tHeight:int = height;
			graphics.clear();
			graphics.beginFill(color, 1);
			graphics.drawRect(0, 0, tWidth, tHeight);
			graphics.endFill();
		}
		
	}

}