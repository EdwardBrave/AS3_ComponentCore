package assets.entities 
{
	import core.base.Container;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class TestEntity extends Container 
	{
		
		public function TestEntity() 
		{
			super();
			
		}
		
		override public function connect():void 
		{
			addEventListener("dead",onDead);
		}
		
		private function onDead(e:*):void
		{
			removeEventListener("dead",onDead);
			destruct();
		}
		
		override public function initGraphics():void 
		{
			_settings.color = _settings.color || 0xFF8000;
			graphics.beginFill(_settings.color);
			graphics.drawRect(0, 0, 100, 100);
			graphics.endFill();
		}
		
		override public function secondTick():void 
		{
			if (parent is Container)
			trace((parent as Container).getComponentName(this));
		}
		
	}

}