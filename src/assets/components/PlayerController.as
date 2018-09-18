package assets.components 
{
	import assets.MoveEvent;
	import core.EventManager;
	import core.base.Component;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class PlayerController extends Component 
	{
		public static const ALL:uint = 0x3FF;
		public static const KEYS:uint = 0xF;
		public static const ARROWS:uint = 0xF0;
		public static const VERTICAL_ARROWS:uint = 0x3;
		public static const VERTICAL_KEYS:uint = 0x30;
		public static const HORISONTAL_ARROWS:uint = 0xC;
		public static const HORISONTAL_KEYS:uint = 0xC0;
		public static const SPACE:uint = 0x100;
		public static const SHIFT:uint = 0x200;
		
		
		
		public function PlayerController() 
		{
			super();
			_settings.activeKeys = 0x00;
		}
		
		override public function connect():void 
		{
			EventManager.addEventListener(EventManager.KEY_UP, onKeyUp);
			EventManager.addEventListener(EventManager.KEY_DOWN, onKeyDown);
		}
		
		override public function disconnect():void 
		{
			EventManager.removeEventListener(EventManager.KEY_UP, onKeyUp);
			EventManager.removeEventListener(EventManager.KEY_DOWN, onKeyDown);
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			if ((_settings.activeKeys & 0x1) && e.keyCode == 87)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,MoveEvent.UP));
			else if ((_settings.activeKeys & 0x2) && e.keyCode == 83)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,MoveEvent.DOWN));
			else if ((_settings.activeKeys & 0x4) && e.keyCode == 65)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,MoveEvent.LEFT));
			else if ((_settings.activeKeys & 0x8) && e.keyCode == 68)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,MoveEvent.RIGHT));
			else if ((_settings.activeKeys & 0x10) && e.keyCode == 38)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,MoveEvent.UP));
			else if ((_settings.activeKeys & 0x20) && e.keyCode == 40)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,MoveEvent.DOWN));
			else if ((_settings.activeKeys & 0x40) && e.keyCode == 37)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,MoveEvent.LEFT));
			else if ((_settings.activeKeys & 0x80) && e.keyCode == 39)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,MoveEvent.RIGHT));
			else if ((_settings.activeKeys & 0x100) && e.keyCode ==32)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,MoveEvent.JUMP));
			else if ((_settings.activeKeys & 0x200) && e.keyCode == 16)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,MoveEvent.SIT));
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			if ((_settings.activeKeys & 0x1) && e.keyCode == 87)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.END_MOVE,false,false,MoveEvent.UP));
			else if ((_settings.activeKeys & 0x2) && e.keyCode == 83)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.END_MOVE,false,false,MoveEvent.DOWN));
			else if ((_settings.activeKeys & 0x4) && e.keyCode == 65)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.END_MOVE,false,false,MoveEvent.LEFT));
			else if ((_settings.activeKeys & 0x8) && e.keyCode == 68)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.END_MOVE,false,false,MoveEvent.RIGHT));
			else if ((_settings.activeKeys & 0x10) && e.keyCode == 38)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.END_MOVE,false,false,MoveEvent.UP));
			else if ((_settings.activeKeys & 0x20) && e.keyCode == 40)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.END_MOVE,false,false,MoveEvent.DOWN));
			else if ((_settings.activeKeys & 0x40) && e.keyCode == 37)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.END_MOVE,false,false,MoveEvent.LEFT));
			else if ((_settings.activeKeys & 0x80) && e.keyCode == 39)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.END_MOVE,false,false,MoveEvent.RIGHT));
			else if ((_settings.activeKeys & 0x100) && e.keyCode ==32)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.END_MOVE,false,false,MoveEvent.JUMP));
			else if ((_settings.activeKeys & 0x200) && e.keyCode == 16)
				_parent.dispatchEvent(new MoveEvent(MoveEvent.END_MOVE,false,false,MoveEvent.SIT));
		}
		
	}

}