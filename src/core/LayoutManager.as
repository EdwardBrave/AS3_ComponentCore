package core 
{
	import core.utils.Layout;
	import flash.display.GraphicsTrianglePath;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class LayoutManager
	{
		private static var _stage:Stage;
		
		private static var layouts:Vector.<Layout> = new Vector.<Layout>();
		
		internal static function onLayoutsRender():void
		{
			if (layouts)
				for each(var layout:Layout in layouts)
					layout.renderBase();
		}
		
		internal static function onScreenResize(e:Event):void
		{
			if (layouts)
				for each(var layout:Layout in layouts)
					layout.resizeBase();
		}
		
		internal static function addOnStage(newStage:Stage):void
		{
			if (_stage)
				_stage.removeEventListener(Event.RESIZE, onScreenResize);
			_stage = newStage;
			_stage.scaleMode = StageScaleMode.NO_SCALE;
			_stage.align = StageAlign.TOP_LEFT;
			var count:int = 0;
			for (var index:int = 0; index < layouts.length; index++ )
				_stage.addChildAt(layouts[index], index);
			_stage.addEventListener(Event.RESIZE, onScreenResize);
		}
		
		public static function addLayout(position:int = -1):Layout
		{
			position = (0 < position && position < layouts.length) ? position: layouts.length;
			layouts.splice(position, 0, new Layout);
			if (EventManager.stage)
				EventManager.stage.addChildAt(layouts[position],position);
			return layouts[position];
		}
		
		public static function getLayoutIndex(layout:Layout):uint
		{
			return layouts.indexOf(layout);
		}
		
		public static function getLayout(position:uint):Layout
		{
			if (0 <= position && position < layouts.length)
				return layouts[position];
			return null;
		}
		
		public static function removeLayout(layout:Layout):Boolean
		{
			return removeLayoutByIndex(layouts.indexOf(layout));
		}
		
		public static function removeLayoutByIndex(position:int):Boolean
		{
			if (0 <= position && position < layouts.length)
			{
				if (EventManager.stage)
					EventManager.stage.removeChildAt(position);
				layouts[position].destruct();
				layouts.removeAt(position);
				return true;
			}
			return false;
		}
		
		public static function clearLayouts(indexes:Array = null):void
		{
			if (indexes)
				for each(var index:int in indexes)
					if (0 <= index && index < layouts.length)
						layouts[index].clear();
			else
				for each(var layout:Layout in layouts)
					layout.clear();
		}
	}

}