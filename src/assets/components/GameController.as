package assets.components 
{
	import core.EventManager;
	import core.GameEvent;
	import core.base.Component;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class GameController extends Component 
	{
		
		public function GameController() 
		{
			super();
			_settings.event = "";
			_settings.dispatch = "";
		}
		
		override public function connect():void 
		{
			if (_settings.event && _settings.dispatch)
			_parent.addEventListener(_settings.event,function ():void{
				EventManager.stage.dispatchEvent(new Event(_settings.dispatch));
			});
		}
	
		override public function disconnect():void 
		{
		}
	}

}