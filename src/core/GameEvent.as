package core 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class GameEvent extends Event 
	{
		public static const START:String = "startGame";
		public static const GAME_OVER:String = "gameOver";
		public static const GAME_WIN:String = "gameVin";
		public function GameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
	}

}