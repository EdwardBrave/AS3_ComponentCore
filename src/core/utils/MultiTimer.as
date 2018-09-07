package core.utils 
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class MultiTimer extends Timer 
	{
		public var functions:FunctionList;
		
		public function MultiTimer(delay:Number, repeatCount:int = 0):void
		{
			super(delay,repeatCount);
			functions = new FunctionList();
			addEventListener(TimerEvent.TIMER, onTimer);
			this.start();
		}
		
		public function onTimer(e:TimerEvent):void
		{
			for each(var func:Function in functions.functions)
				func();
		}
		
		public function erase():void
		{
			this.stop();
			removeEventListener(TimerEvent.TIMER, onTimer);
			functions.erase();
		}
		
	}

}