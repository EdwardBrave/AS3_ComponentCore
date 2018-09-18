package assets.components 
{
	import assets.MoveEvent;
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
			_parent.addEventListener(MoveEvent.START_MOVE,onStartMove);
			if (!_settings.isContinue)
				_parent.addEventListener(MoveEvent.END_MOVE,onEndMove);
		}
		
		override public function disconnect():void 
		{
			_parent.removeEventListener(MoveEvent.START_MOVE,onStartMove);
			_parent.removeEventListener(MoveEvent.END_MOVE,onEndMove);
		}
		
		private function onStartMove(e:MoveEvent):void
		{
			_movement.addVector(e.move);
		}
		
		private function onEndMove(e:MoveEvent):void
		{
			_movement.addVector(e.move.inverce);
		}
		
		
		
		override public function update():void 
		{
			_parent.x += _movement.x * _settings.speed;
			_parent.y += _movement.y * _settings.speed;
		}
	}

}