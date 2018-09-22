package assets.entities 
{
	import assets.components.Health;
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
			addEventListener("dead", onDead);
			addEventListener(Health.HP_CHANGED,colorise);
		}
		
		private function colorise(e:*):void
		{
			graphics.clear();
			_settings.color -= (_settings.color & 0xFF0000) ? 0x300000: 0;
			_settings.color -= (_settings.color & 0xFF00) ? 0x3000: 0;
			_settings.color -= (_settings.color & 0xFF) ? 0x30: 0;
			graphics.beginFill(_settings.color);
			graphics.drawRect(0, 0, _settings.width, _settings.height);
			graphics.endFill();
		}
		
		private function onDead(e:*):void
		{
			removeEventListener(Health.HP_CHANGED,colorise);
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