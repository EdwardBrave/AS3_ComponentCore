package assets 
{
	import flash.events.DataEvent;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class MoveEvent extends DataEvent 
	{
		
	//TYPE___________________________________________________________
	
		public static const START_MOVE:String = "startMove";
		public static const END_MOVE:String = "endMove";
	//---------------------------------------------------------------	
		
	//DATA___________________________________________________________
	
		public static const UP:String = "up";
		public static const DOWN:String = "down";
		public static const LEFT:String = "left";
		public static const RIGHT:String = "right";
		
		public static const JUMP:String = "jump";
		public static const SIT:String = "sit";	
	//----------------------------------------------------------------
		
		public function MoveEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, data:String = "") 
		{
			super(type, bubbles, cancelable, data);
			
		}
		
	}

}