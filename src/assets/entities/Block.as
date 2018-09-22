package assets.entities 
{
	import core.base.Container;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class Block extends Container 
	{
		
		public function Block() 
		{
			super();
			_settings.color = 0x00FB00;
			_settings.width = 50;
			_settings.height = 50;
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
			graphics.beginFill(_settings.color);
			graphics.drawRect(0, 0, _settings.width, _settings.height);
			graphics.endFill();
		}
		
		
	}

}