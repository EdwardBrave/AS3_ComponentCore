package assets.components 
{
	import assets.MoveEvent;
	import core.EventManager;
	import core.GameEvent;
	import core.base.Component;
	import core.utils.Vector2;
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class Movement extends Component 
	{
		private var _movement:Vector2;
		public function Movement() 
		{
			super();
			_settings.speed = 5;
			_settings.isContinue = false;
			_movement = Vector2.NULL;
		}
		
		override public function connect():void 
		{
			_parent.addEventListener(MoveEvent.START_MOVE, onStartMove);
			_parent.addEventListener(MoveEvent.REFLECT,onReflect);
			if (!_settings.isContinue)
				_parent.addEventListener(MoveEvent.STOP, onStop);
			EventManager.stage.addEventListener(GameEvent.GAME_WIN, onStop);
		}
		
		override public function disconnect():void 
		{
			_parent.removeEventListener(MoveEvent.START_MOVE, onStartMove);
			_parent.removeEventListener(MoveEvent.REFLECT,onReflect);
			_parent.removeEventListener(MoveEvent.STOP, onStop);
			EventManager.stage.removeEventListener(GameEvent.GAME_WIN, onStop);
		}
		
		private function onStartMove(e:MoveEvent):void
		{
			_movement = e.move;
		
		}	
		private function onReflect(e:MoveEvent):void
		{
			if (_settings.isContinue){
				if (e.move.x)
					_movement.x *= -1;
				if (e.move.y)
					_movement.y *= -1;
			}
			else 
				_movement = Vector2.NULL;
		}
		
		private function onStop(e:*):void
		{
			_movement = Vector2.NULL;
		}
		
		
		
		override public function update():void 
		{
			_parent.x += _movement.x * _settings.speed;
			_parent.y += _movement.y * _settings.speed;
		}
	}

}