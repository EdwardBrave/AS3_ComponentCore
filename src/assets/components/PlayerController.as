package assets.components 
{
	import assets.MoveEvent;
	import core.EventManager;
	import core.base.Component;
	import core.utils.Vector2;
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
		
		
		private var pressedKeys:uint = 0x00;
		
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
			if (((0xFF - pressedKeys) & _settings.activeKeys & 0x1) && e.keyCode == 87){
				pressedKeys |= 0x11;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,Vector2.UP));
			}
			else if (((0xFF - pressedKeys) & _settings.activeKeys & 0x2) && e.keyCode == 83){
				pressedKeys |= 0x22;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,Vector2.DOWN));
			}
			else if (((0xFF - pressedKeys) & _settings.activeKeys & 0x4) && e.keyCode == 65){
				pressedKeys |= 0x44;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,Vector2.LEFT));
			}
			else if (((0xFF - pressedKeys) & _settings.activeKeys & 0x8) && e.keyCode == 68){
				pressedKeys |= 0x88;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,Vector2.RIGHT));
			}
			else if (((0xFF - pressedKeys) & _settings.activeKeys & 0x10) && e.keyCode == 38){
				pressedKeys |= 0x11;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,Vector2.UP));
			}
			else if (((0xFF - pressedKeys) & _settings.activeKeys & 0x20) && e.keyCode == 40){
				pressedKeys |= 0x22;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,Vector2.DOWN));
			}
			else if (((0xFF - pressedKeys) & _settings.activeKeys & 0x40) && e.keyCode == 37){
				pressedKeys |= 0x44;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,Vector2.LEFT));
			}
			else if (((0xFF - pressedKeys) & _settings.activeKeys & 0x80) && e.keyCode == 39){
				pressedKeys |= 0x88;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,Vector2.RIGHT));
			}
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			if ((pressedKeys & _settings.activeKeys & 0x1) && e.keyCode == 87){
				pressedKeys &= 0xEE;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.STOP,false,false,Vector2.UP));
			}
			else if ((pressedKeys & _settings.activeKeys & 0x2) && e.keyCode == 83){
				pressedKeys &= 0xDD;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.STOP,false,false,Vector2.DOWN));
			}
			else if ((pressedKeys & _settings.activeKeys & 0x4) && e.keyCode == 65){
				pressedKeys &= 0xBB;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.STOP,false,false,Vector2.LEFT));
			}
			else if ((pressedKeys & _settings.activeKeys & 0x8) && e.keyCode == 68){
				pressedKeys &= 0x77;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.STOP,false,false,Vector2.RIGHT));
			}
			else if ((pressedKeys & _settings.activeKeys & 0x10) && e.keyCode == 38){
				pressedKeys &= 0xEE;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.STOP,false,false,Vector2.UP));
			}
			else if ((pressedKeys & _settings.activeKeys & 0x20) && e.keyCode == 40){
				pressedKeys &= 0xDD;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.STOP,false,false,Vector2.DOWN));
			}
			else if ((pressedKeys & _settings.activeKeys & 0x40) && e.keyCode == 37){
				pressedKeys &= 0xBB;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.STOP,false,false,Vector2.LEFT));
			}
			else if ((pressedKeys & _settings.activeKeys & 0x80) && e.keyCode == 39){
				pressedKeys &= 0x77;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.STOP,false,false,Vector2.RIGHT));
			}
		}
		
	}

}