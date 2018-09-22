package assets.entities 
{
	import assets.MoveEvent;
	import core.EventManager;
	import core.GameEvent;
	import core.base.Container;
	import core.utils.Vector2;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class Ball extends Container 
	{
		
		public function Ball() 
		{
			super();
			_settings.color = 0xF82F1F;
			_settings.radius = 25;
		}
		
		
		override public function connect():void 
		{
			addEventListener("dead", onDead);
			EventManager.stage.addEventListener(GameEvent.START,onStart);
		}
		
		private function onStart(e:*):void
		{
			removeEventListener(GameEvent.START,onStart);
			dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,Vector2.UP));
		}
		
		private function onDead(e:*):void
		{
			destruct();
		}
		
		override public function disconnect():void 
		{
			removeEventListener("dead", onDead);
			EventManager.stage.removeEventListener(GameEvent.START,onStart);
		}
		
		override public function initGraphics():void 
		{
			graphics.beginFill(_settings.color);
			graphics.drawCircle(_settings.radius, _settings.radius, _settings.radius);
			graphics.endFill();
		}
		
	}

}