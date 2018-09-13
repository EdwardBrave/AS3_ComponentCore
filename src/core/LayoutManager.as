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
		
		private static var _layouts:Vector.<Layout> = new Vector.<Layout>();
		
		internal static function onLayoutsRender():void
		{
			if (_layouts)
				for each(var layout:Layout in _layouts.slice())
					layout.renderBase();
		}
		
		private static function onScreenResize(e:Event):void
		{
			if (_layouts)
				for each(var layout:Layout in _layouts.slice())
					layout.resizeBase();
		}
		
		internal static function addOnStage(newStage:Stage):void
		{
			if (_stage == newStage)
				return;
			if (_stage)
				_stage.removeEventListener(Event.RESIZE, onScreenResize);
			_stage = newStage;
			_stage.scaleMode = StageScaleMode.NO_SCALE;
			_stage.align = StageAlign.TOP_LEFT;
			for (var index:int = 0; index < _layouts.length; index++ )
				_stage.addChildAt(_layouts[index], index);
			_stage.addEventListener(Event.RESIZE, onScreenResize);
		}
		
		public static function addLayout(position:int = -1):Layout
		{
			position = (0 < position && position < _layouts.length) ? position: _layouts.length;
			_layouts.splice(position, 0, new Layout);
			if (_stage)
				_stage.addChildAt(_layouts[position],position);
			return _layouts[position];
		}
		
		public static function getLayoutIndex(layout:Layout):uint
		{
			return _layouts.indexOf(layout);
		}
		
		public static function getLayout(position:uint):Layout
		{
			if (0 <= position && position < _layouts.length)
				return _layouts[position];
			return null;
		}
		
		public static function removeLayout(layout:Layout):Boolean
		{
			return removeLayoutByIndex(_layouts.indexOf(layout));
		}
		
		public static function removeLayoutByIndex(position:int):Boolean
		{
			if (0 <= position && position < _layouts.length)
			{
				if (_stage)
					_stage.removeChildAt(position);
				_layouts[position].destruct();
				_layouts.removeAt(position);
				return true;
			}
			return false;
		}
		
		public static function clearLayouts(indexes:Array = null):void
		{
			if (indexes){
				var list:Array = new Array();
				for each(var elem:int in indexes)
					if(0 <= elem && elem < _layouts.length && list.indexOf(elem) == -1)
						list.push(elem);
				for each(var index:int in list)
						_layouts[index].clear();
			}
			else
				for each(var layout:Layout in _layouts.slice())
					layout.clear();
		}
	}

}