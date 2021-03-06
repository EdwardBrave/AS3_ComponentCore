package core.base 
{
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class Component implements IComponent
	{
		protected var _parent:ComponentList;
		
		protected var _settings:Object;
		
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
		
		public function Component() 
		{
			_settings = new Object();
		}
		
		public function refreshSettings(settings:Object):void
		{
			if (settings != null){
				for( var key:String in settings)
					_settings[key] = settings[key];
			}
		}
		
		public final function getParent():*
		{
			return _parent;
		}
		
		public final function setParent(container:ComponentList):void
		{
			if(_parent != container){
				if (_parent)
					disconnect();
				_parent = container;
				if (_parent)
					connect();
			}
		}
		
		public function connect():void
		{
			
		}
		
		public function disconnect():void
		{
			
		}
		
		public function update():void
		{
			
		}
		
		public function secondTick():void
		{
			
		}
		
		public function destruct():void
		{
			setParent(null);
		}
		
	}

}