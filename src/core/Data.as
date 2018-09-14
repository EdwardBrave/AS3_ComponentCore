package core 
{
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public final class Data 
	{
		public static var gameRooms:Array = new Array();
		/*{
			roomId: {
				fields:[
					{   //entityName = type +"_"+ entityID +"-"+ uID 
						entityName: EntityObject;
					}
					{   //entityName = type +"_"+ entityID +"-"+ uID 
						entityName: EntityObject;
					}
				]
			}
		}*/
		
		public static var windows:Object = new Object();
		/*
			windowName: EntityObject;
			windowName: EntityObject;
			windowName: EntityObject;
		*/
		
		public static var entities:Array = new Array();
		/*{
			entityID: PrototipeObject
			entityID: PrototipeObject
		}*/
		
		public static var components:Array = new Array();
		/*{
			componentID: PrototipeObject
			componentID: PrototipeObject
		}*/
		
		public static var guiEntities:Array = new Array();
		/*{
			entityID:PrototipeObject
			entityID:PrototipeObject
		}*/
		
		public static var guiComponents:Array = new Array();
		/*{
			componentID: PrototipeObject
			componentID: PrototipeObject
		}*/
		
		public static var graphics:Object = new Object();
		
		//public static var sounds:*;
		
	}

}