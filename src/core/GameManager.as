package core 
{
	import core.base.EntityManager;
	import core.base.IComponent;
	import core.utils.Layout;
	import core.packs.EntityObject;
	import flash.display.DisplayObject;
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class GameManager 
	{
		private static var _currentRoom:int;
		
		public static function get currentRoom():int
		{
			return _currentRoom;
		}  
		
		public static function loadGameRoom(roomID:uint,startOnLoad:Boolean = true):void
		{
			var gameRoom:Object = Data.gameRooms[roomID];
			for (var field:int = 0; field < gameRoom.fields.lenght; field++)
			{
				for (var entityName:String in gameRoom.fields[field])
					EntityManager.loadEntity(entityName, gameRoom.fields[field][entityName]);
			}
			if (startOnLoad)
				startGameRoom(roomID);
		}
		
		public static function startGameRoom(roomID:int):void
		{
			var gameRoom:Object = Data.gameRooms[roomID];
			LayoutManager.clearLayouts();
			for (var field:int = 0; field < gameRoom.fields.lenght; field++)
			{
				var layout:Layout = LayoutManager.getLayout(field);
				if (!layout)
					layout = LayoutManager.addLayout(field);
				
				for (var entityName:String in gameRoom.fields[field])
				{
					var entity:EntityObject = gameRoom.fields[field][entityName];
					var newEntity:IComponent = EntityManager.getEntity(entityName);
					newEntity.refreshSettings(entity.settings);
					newEntity.x = entity.x;
					newEntity.y = entity.y;
					layout.addChild(newEntity);
				}
			}
		}
		
		public static function refreshMemory():void
		{
			
		}
		
	}

}