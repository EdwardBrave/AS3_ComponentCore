package assets.guiEntities 
{
	import core.base.Container;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class Button extends Container 
	{
		public static const DISABLED:String = "disabled";
		public static const NORMAL:String = "normal";
		public static const ENABLED:String = "enabled";
		
		public static const DISABLED_CLICK:String = "disabledClick";
		public static const NORMAL_CLICK:String = "normalClick";
		public static const ENABLED_CLICK:String = "enabledClick";
		
		private var _state:String;
		private var currColor:uint;
		
		public function set state(newState:String):void
		{
			_state = newState;
			if (_state == DISABLED)
				currColor = _settings.disabledColor;
			else if(_state == NORMAL)	
				currColor = _settings.color;
			else if(_state == ENABLED)	
				currColor = _settings.overColor;
			redraw();
		}
		
		public function get state():String
		{
			return _state;
		}
		
		public function Button() 
		{
			super();
			_settings.disabledColor = 0x7C7C7C;
			_settings.color = 0x13F107;
			_settings.overColor = 0xB5FF51;
			_settings.width = 100;
			_settings.height = 25;
			_settings.state = NORMAL;
			
			_settings.onDisabledClick = null;
			_settings.onClick = null;
			_settings.onEnabledClick = null;
		}
		
		override public function refreshSettings(settings:Object):void 
		{
			super.refreshSettings(settings);
			state = _settings.state;
		}
		
		override public function connect():void 
		{
			super.connect();
			addEventListener(MouseEvent.CLICK, onClick);
			addEventListener(MouseEvent.MOUSE_OVER, onOver);
			addEventListener(MouseEvent.MOUSE_OUT, onOut);
		}
		
		private function onOver(e:MouseEvent):void
		{
			currColor = _settings.overColor;
			redraw();
		}
		
		private function onOut(e:MouseEvent):void
		{
			currColor = _settings.color;
			redraw();
		}
		
		private function onClick(e:MouseEvent):void
		{
			if (_state == DISABLED){
				dispatchEvent(new Event(DISABLED_CLICK));
				if (_settings.onDisabledClick)
					_settings.onDisabledClick();
			}
			else if (_state == NORMAL){
				dispatchEvent(new Event(NORMAL_CLICK));
				if (_settings.onClick)
					_settings.onClick();
			}
			else if(_state == ENABLED){
				dispatchEvent(new Event(ENABLED_CLICK));
				if (_settings.onEnabledClick)
					_settings.onEnabledClick();
			}
		}
		
		override public function initGraphics():void 
		{
			redraw();
		}
		
		public function redraw():void
		{
			graphics.beginFill(currColor);
			graphics.drawRect(0, 0, _settings.width, _settings.height);
			graphics.endFill();
		}
		
		override public function disconnect():void 
		{
			removeEventListener(MouseEvent.CLICK, onClick);
			removeEventListener(MouseEvent.MOUSE_OVER, onOver);
			removeEventListener(MouseEvent.MOUSE_OUT, onOut);
		}
		
	}

}