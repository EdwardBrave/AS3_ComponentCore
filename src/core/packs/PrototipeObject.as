package core.packs 
{
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class PrototipeObject 
	{
		public var sID:uint;
		public var classType:String;
		public var settings:Object;
		public var components:Object; // of RoomObjct
		public var children:Object; // of RoomObjct
		
		public function PrototipeObject(sID:uint, classType:String, settings:Object = {}, components:Object = {}, children:Object = {}) 
		{
			this.sID = sID;
			this.classType = classType;
			this.settings = settings;
			this.components = components;
			this.children = children;
		}
		
	}

}