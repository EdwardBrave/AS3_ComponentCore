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
			id: {
				fields:{
					{   //entity = type +"_"+ entityID +"-"+ uID 
						entityName: RoomObject;
					}
				}
			}
		}*/
		
		public static var entities:Array = new Array();
		/*{
			entityID: PrototipeObject
			entityID: PrototipeObject
		}*/
		
		public static var components:Array = new Array();
		//{
			//componentID:{
				//classType: String,
				//settings: {}
			//}
		//}
		
		public static var guiEntities:Array = new Array();
		/*{
			entityID:PrototipeObject
			entityID:PrototipeObject
		}*/
		
		public static var guiComponents:Array = new Array();
		//{
			//componentID:{
				//classType: String,
				//settings: {}
			//}
		//}
		
		public static var graphics:Object = new Object();
		
		//public static var sounds:*;
		
	}

}