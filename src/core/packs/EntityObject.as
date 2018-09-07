package core.packs 
{
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class EntityObject
	{
		public static var LAYOUT = "layout";
		public static var ENTITY = "entity";
		public static var COMPONENT = "component";
		public static var GUI_ENTITY = "guiEntity";
		public static var GUI_COMPONENT = "guiComponent";
		
		public var sID: uint;
		public var uID: int;
		public var sysType: String; //layout, entity, component, guiEntity, guiComponent
		public var x: Number;
		public var y: Number;
		public var settings:Object;
		
		public function EntityObject(sID: uint, sysType: String, uID: int = -1, x:Number = 0, y:Number = 0, settings:Object = {}); 
		{
			this.sID = sID;
			this.uID = uID;
			this.sysType = sysType;
			this.x = x;
			this.y = y;
			this.settings = settings;
			
		}
		
	}

}