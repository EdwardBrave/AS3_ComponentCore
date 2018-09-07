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
			
		}
		
		public function refreshSettings(settings:Object):void
		{
			
		}
		
		public function getParent():*
		{
			return _parent;
		}
		
		public function setParent(container:ComponentList):void
		{
			if(_parent != container){
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