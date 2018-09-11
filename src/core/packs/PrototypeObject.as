package core.packs 
{
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class PrototypeObject 
	{
		public var sID:uint;
		public var classType:String;
		public var settings:Object;
		public var components:Object; // of RoomObjct
		public var children:Object; // of RoomObjct
		
		public function PrototypeObject(sID:uint, classType:String, settings:Object = null, components:Object = null, children:Object = null) 
		{
			this.sID = sID;
			this.classType = classType;
			this.settings = settings || {};
			this.components = components || {};
			this.children = children || {};
		}
		
	}

}