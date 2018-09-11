package core.base 
{
	import core.Data;
	import core.LayoutManager;
	import core.packs.PrototypeObject;
	import core.packs.EntityObject;
	import core.utils.Layout;
	import flash.display.DisplayObject;
	import flash.utils.getDefinitionByName;
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class WindowManager 
	{
		private static var _windowList:Object = new Object();
		
		private static var windowLayout:Layout;  
		
		public static function loadWindow(windowName:String):IComponent
		{
			var data:EntityObject = Data.windows[windowName];
			if (data)
				return EntityManager.loadEntity(windowName, data);
			return null;
		}
		
		public static function showWindowByName(name:String):IComponent
		{
			return showWindow(loadWindow(name));
		}
		
		public static function showWindow(entity:IComponent):IComponent
		{
			if (!entity || !EntityManager.getEntityName(entity))
				return null;
			if (!windowLayout)
				windowLayout = LayoutManager.addLayout();
			if (entity.getParent() == null){
				windowLayout.addChild(entity as DisplayObject);
				return entity;
			}
			return null;
		}
		
		public static function closeWindowByName(name:String):Boolean
		{
			var entity:IComponent = EntityManager.getEntity(name);
			if (entity)
				return closeWindow(entity);
			return false;
		}
		
		public static function closeWindow(entity:IComponent):Boolean
		{
			if (entity && entity.getParent() == windowLayout){
				windowLayout.removeChild(entity as DisplayObject);
				return true;
			}
			return false;
		}
		
	}

}