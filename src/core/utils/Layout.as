package core.utils
{
	import core.base.Container;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class Layout extends Sprite
	{
		
		public function Layout():void
		{
			super();
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initGraphics();
			connectBase();
		}
		
		public function connectBase(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, connectBase);
			var lenght:int = numChildren;
			var sprite:DisplayObject;
			connect();
			for (var index:int = 0; index < lenght; index++)
			{
				sprite = getChildAt(index);
				if (sprite is Layout)
					(sprite as Layout).connectBase();
			}
			addEventListener(Event.REMOVED_FROM_STAGE, disconnectBase);
		}
		
		public function disconnectBase(e:Event = null):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, disconnectBase);
			var lenght:int = numChildren;
			var sprite:DisplayObject;
			disconnect();
			for (var index:int = 0; index < lenght; index++)
			{
				sprite = getChildAt(index);
				if (sprite is Layout)
					(sprite as Layout).disconnectBase();
			}
			addEventListener(Event.ADDED_TO_STAGE, connectBase);
		}
		
		public final function renderBase():void
		{
			var lenght:int = numChildren;
			var sprite:DisplayObject;
			rendering();
			for (var index:int = 0; index < lenght; index++)
			{
				sprite = getChildAt(index);
				if (sprite is Layout)
					(sprite as Layout).renderBase();
			}
			postRendering();
		}
		
		public final function resizeBase():void
		{
			var lenght:int = numChildren;
			var sprite:DisplayObject;
			onResize();
			for (var index:int = 0; index < lenght; index++)
			{
				sprite = getChildAt(index);
				if (sprite is Layout)
					(sprite as Layout).resizeBase();
			}
		}
		
		public function initGraphics():void
		{
		
		}
		
		public function connect():void
		{
		
		}
		
		public function disconnect():void
		{
		
		}
		
		public function rendering():void
		{
		
		}
		
		public function postRendering():void
		{
		
		}
		
		public function onResize():void
		{
		
		}
		
		public function clear():void
		{
			graphics.clear();
			var lenght:int = numChildren;
			for (var index:int = lenght - 1; index >= 0; index--)
				removeChild(getChildAt(index));
		}
		
		public function destruct():void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			removeEventListener(Event.REMOVED_FROM_STAGE, disconnectBase);
			removeEventListener(Event.ADDED_TO_STAGE, connectBase);
			disconnect();
			graphics.clear();
			var lenght:int = numChildren;
			var sprite:DisplayObject;
			for (var index:int = lenght - 1; index >= 0; index--)
			{
				sprite = getChildAt(index);
				if (sprite is Layout)
					(sprite as Layout).destruct();
				else
					removeChild(sprite);
			}
			if (parent)
				parent.removeChild(this);
		}
	
	}

}