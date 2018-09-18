package assets.components 
{
	import assets.MoveEvent;
	import core.base.Component;
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class Movement extends Component 
	{
		private var _movement:uint = 0x00;
		public function Movement() 
		{
			super();
			_settings.speed = 5;
			_settings.isContinue = false;
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
			if (_settings.isContinue)
				_movement = 0;
			if (e.data == MoveEvent.UP)
				_movement |= 0x01;
			else if (e.data == MoveEvent.DOWN)
				_movement |= 0x02;
			else if (e.data == MoveEvent.LEFT)
				_movement |= 0x04;
			else if (e.data == MoveEvent.RIGHT)
				_movement |= 0x08;
		}
		
		private function onEndMove(e:MoveEvent):void
		{
			if (e.data == MoveEvent.UP)
				_movement &= 0xFE;
			else if (e.data == MoveEvent.DOWN)
				_movement &= 0xFD;
			else if (e.data == MoveEvent.LEFT)
				_movement &= 0xFB;
			else if (e.data == MoveEvent.RIGHT)
				_movement &= 0xF7;
		}
		
		
		
		override public function update():void 
		{
			if (_movement & 0x01)
				_parent.y -= _settings.speed; 
			else if (_movement & 0x02)
				_parent.y += _settings.speed;
			if (_movement & 0x04)
				_parent.x -= _settings.speed;
			else if (_movement & 0x08)
				_parent.x += _settings.speed;
		}
	}

}