package assets 
{
	import core.utils.Vector2;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class MoveEvent extends Event 
	{
		
	//TYPE___________________________________________________________
	
		public static const START_MOVE:String = "startMove";
		public static const END_MOVE:String = "endMove";
		
		public var move:Vector2;
		
		public function MoveEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, move:Vector2 = null) 
		{
			super(type, bubbles, cancelable);
			this.move = move || Vector2.NULL; 
			
		}
		
	}

}