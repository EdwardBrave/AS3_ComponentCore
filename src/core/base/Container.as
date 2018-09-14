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
			_settings = new Object();
			super();
		}
		
		override protected final function connectBase(e:Event = null):void
		{
			super.connectBase();
			if (!(parent is Container)){
				EventManager.addEventListener(EventManager.ENTER_FRAME, updateBase);
				TimerManager.addTimerListener(secondTickBase);
			}
			for each( var component:IComponent in _components)
				if (!(component is Container))
					component.connect();
		}
		
		override protected final function disconnectBase(e:Event = null):void
		{
			super.disconnectBase();
			EventManager.removeEventListener(EventManager.ENTER_FRAME, updateBase);
			TimerManager.removeTimerListener(secondTickBase);
			for each( var component:IComponent in _components)
				if (!(component is Container))
					component.disconnect();
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
		
		public function preUpdate():void
		{
			
		}
		
		public function update():void
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