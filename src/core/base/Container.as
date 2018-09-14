package core.base 
{
	import core.EventManager;
	import core.TimerManager;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class Container extends ComponentList implements IComponent
	{
		protected var _settings:Object;
		
		public function getParent():*
		{
			return parent;
		}
		
		private var _uID:int;
		
		public function set uID(id:int):void
		{
			if (id >= 0)
				_uID = id;
		}
		
		public function get uID():int
		{
			return _uID;
		}
		
		public function Container():void 
		{
			super();
		}
		
		override public final function connectBase(e:Event = null):void
		{
			connectToEvents();
			connect();
			for each( var component:IComponent in _components)
				if (component is Container)
					(component as Container).connectBase();
				else
					component.connect();
		}
		
		override public final function disconnectBase(e:Event = null):void
		{
			disconnectFromEvents();
			disconnect();
			for each( var component:IComponent in _components)
				if (component is Container)
					(component as Container).disconnectBase();
				else
					component.disconnect();
		}
		
		private final function connectToEvents():void
		{
			if (!(parent is Container)){
				EventManager.addEventListener(EventManager.ENTER_FRAME, updateBase);
				TimerManager.addTimerListener(secondTickBase);
			}
			removeEventListener(Event.ADDED_TO_STAGE, connectBase);
			addEventListener(Event.REMOVED_FROM_STAGE, disconnectBase);
		}
		
		private final function disconnectFromEvents():void
		{
			EventManager.removeEventListener(EventManager.ENTER_FRAME, updateBase);
			TimerManager.removeTimerListener(secondTickBase);
			removeEventListener(Event.REMOVED_FROM_STAGE, disconnectBase);
			addEventListener(Event.ADDED_TO_STAGE, connectBase);
		}
		
		internal final function updateBase():void
		{
			preUpdate();
			for each( var component:IComponent in _components)
				if (component is Container)
					(component as Container).updateBase();
				else
					component.update();
			update();
		}
		
		internal final function secondTickBase():void
		{
			preSecondTick();
			for each( var component:IComponent in _components)
				if (component is Container)
					(component as Container).secondTickBase();
				else
					component.secondTick();
			secondTick();
		}
		
		public function refreshSettings(settings:Object):void
		{
			if (settings != null){
				if (!_settings)
					_settings = new Object();
				for( var key:String in settings)
					_settings[key] = settings[key];
			}
		}
		
		public function setParent(container:ComponentList):void
		{
			if (parent != container)
			{
				if (parent)
					parent.removeChild(this);
				if (container)
					container.addChild(this);
				
			}
		}
		
		override public function connect():void
		{
			
		}
		
		override public function disconnect():void
		{
			
		}
		
		public function update():void
		{
			
		}
		
		public function preUpdate():void
		{
			
		}
		
		public function preSecondTick():void
		{
			
		}
		
		public function secondTick():void
		{
			
		}
		
		override public function destruct():void
		{
			EventManager.removeEventListener(EventManager.ENTER_FRAME, updateBase);
			TimerManager.removeTimerListener(secondTickBase);
			super.destruct();
		}
	}
}