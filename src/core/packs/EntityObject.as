package core.packs 
{
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class EntityObject
	{
		public static const LAYOUT:String = "layout";
		public static const ENTITY:String = "entity";
		public static const COMPONENT:String = "component";
		public static const GUI_ENTITY:String = "guiEntity";
		public static const GUI_COMPONENT:String = "guiComponent";
		
		public var sID: uint;
		public var uID: int;
		public var sysType: String; //layout, entity, component, guiEntity, guiComponent
		public var x: Number;
		public var y: Number;
		public var settings:Object;
		
		public function EntityObject(sID: uint, sysType: String, uID: int = -1, x:Number = 0, y:Number = 0, settings:Object = null) 
		{
			this.sID = sID;
			this.uID = uID;
			this.sysType = sysType;
			this.x = x;
			this.y = y;
			this.settings = settings || {};
			
		}
		
	}

}