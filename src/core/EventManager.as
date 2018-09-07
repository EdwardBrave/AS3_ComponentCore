package core 
{

	import core.utils.FunctionList;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public final class EventManager
	{
		private static var _stage:Stage;
		
		public static const ENTER_FRAME:String = Event.ENTER_FRAME;
		public static const KEY_UP:String = KeyboardEvent.KEY_UP;
		public static const KEY_DOWN:String = KeyboardEvent.KEY_DOWN;
		
		public static function setStage(mainStage:Stage):void
		{
			if (_stage){
				_stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				_stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
				_stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			}
			_stage = mainStage;
			onFrameFunctions = onFrameFunctions || new FunctionList();
			_stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			if (onKeyUpFunctions)
				_stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			if (onKeyDownFunctions)
				_stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			LayoutManager.addOnStage(_stage);
		}
		
		internal static function get stage():Stage
		{
			return _stage;
		}
		
		private static var onFrameFunctions:FunctionList;
		private static var onKeyUpFunctions:FunctionList;
		private static var onKeyDownFunctions:FunctionList;
		
		private static function getEventVector(event:String):*
		{
			switch (event)
			{
				case ENTER_FRAME: 
					return onFrameFunctions = onFrameFunctions || new FunctionList();
				case KEY_UP:
					if (!onKeyUpFunctions && _stage)
						_stage.addEventListener(KEY_UP, onKeyUp); 
					return onKeyUpFunctions = onKeyUpFunctions || new FunctionList();
				case KEY_DOWN:
					if (!onKeyDownFunctions && _stage)
						_stage.addEventListener(KEY_DOWN, onKeyDown); 
					return onKeyDownFunctions = onKeyDownFunctions || new FunctionList();
				default:
					return false;
			}
		}
		
		public static function addEventListener(event:String, func:Function, position:uint = undefined):Boolean
		{
			var functions:* = getEventVector(event);
			if (functions !== false)
				return functions.forceAddFunc(func,position);
			return false;
		}
		
		public static function removeEventListener(event:String, func:Function):Boolean
		{
			var functions:* = getEventVector(event);
			if (functions !== false)
				return functions.removeFunc(func); 
			return false;
		}
		
		private static function onEnterFrame(e:Event):void
		{
			for each(var func:Function in onFrameFunctions.functions)
				func();
			
			LayoutManager.onLayoutsRender();
		}
		
		private static function onKeyUp(e:KeyboardEvent):void
		{
			for each(var func:Function in onKeyUpFunctions.functions)
				func(e);
		}
		
		private static function onKeyDown(e:KeyboardEvent):void
		{
			for each(var func:Function in onKeyDownFunctions.functions)
				func(e);
		}
	}

}

