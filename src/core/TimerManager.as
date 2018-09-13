package core 
{
	import core.utils.MultiTimer;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class TimerManager 
	{
		private static var timers:Array;
		
		public static function addTimerListener(func:Function,delay:uint = 1000,position:int = -1):Boolean{
			if (!timers)
				timers = new Array();
			if (!timers[delay])
				timers[delay] = new MultiTimer(delay);
			return timers[delay].functions.forceAddFunc(func,position);
		}
		
		public static function removeTimerListener(func:Function,delay:uint = 1000):Boolean{
			if (timers && timers[delay]){
				var result:Boolean = timers[delay].functions.removeFunc(func);
				if (result && timers[delay].functions.length <= 0){
					timers[delay].erase();
					delete timers[delay];
				}
				return result;
			}
			return false;
		}
	
		
	}

}