package assets 
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class CollisionEvent extends Event 
	{
		public static const COLLISION:String = "collision";
		public var object:DisplayObject;
		public var collisionType:int;
		
		public function CollisionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, object:DisplayObject = null, collisionType:int = -1) 
		{
			super(type, bubbles, cancelable);
			this.object = object;
			this.collisionType = collisionType;
		}
		
	}

}