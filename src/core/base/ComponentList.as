package core.base 
{
	import core.utils.Layout;
	import flash.utils.getQualifiedClassName;
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class ComponentList extends Layout 
	{
		protected var _components:Object;
		
		public function ComponentList() 
		{
			_components = new Object();
			super();
		}
		
		protected function generateName(item:*):String
		{
			if (!item)
				throw new Error("undefined has no properties.", 1010);
			var name:String = getQualifiedClassName(item);
			name = name.substring(name.lastIndexOf(":") + 1);
			var counter:int = -1;
			var temp:int = 0;
			for (var _name:String in _components){
				if (_name.indexOf(name) != -1){
					temp = int(_name.substring(_name.lastIndexOf("-")+1));
					counter = (counter < temp) ? temp : counter;
				}
			}
			name += "-" + (counter+1);
			return name;
		}
		
		public final function addComponent(component:IComponent, name:String = ""):ComponentList
		{
			if (!component)
				return this;
			if (getComponentName(component)){
				if (name)
					return setComponentName(component, name);
				else 
					return this;
			}
			if (!name)
				name = generateName(component);
			if (_components[name])
				throw new Error("Component \"" + name+"\" is already defined.", 1038);
			_components[name] = component;
			component.setParent(this);
			return this;
		}
		
		public final function setComponentName(component:IComponent, name:String):ComponentList
		{
			if (_components[name] === component)
				return this;
			var oldName:String = getComponentName(component);
			if (!oldName || !name)
				return this;
			delete _components[oldName];
			if (_components[name])
				throw new Error("Component \"" + name+"\" is already defined.", 1038);
			_components[name] = component;
			return this;
		}
		
		public final function getComponent(name:String):IComponent
		{
			return _components[name] as IComponent;
		}
		
		public final function getComponentName(component:IComponent):String
		{
			for (var name:String in _components)
				if (_components[name] === component)
					return name;
			return "";
		}
		
		public final function disconnectComponentByName(name:String):IComponent
		{
			var outComponent:IComponent = _components[name];
			if (outComponent)
			{
				outComponent.setParent(null);
				delete _components[name];
			}
			return outComponent;
		}
		
		public final function disconnectComponent(component:IComponent):String
		{
			var name:String = getComponentName(component);
			if (name)
			{
				component.setParent(null);
				delete _components[name];
			}
			return name;
		}
		
		public final function removeComponentByName(name:String):ComponentList
		{
			if (_components[name])
			{
				_components[name].destruct();
				delete _components[name];
			}
			return this;
		}
		
		public final function removeComponent(component:IComponent):ComponentList
		{
			var name:String = getComponentName(component);
			if (name)
			{
				_components[name].destruct();
				delete _components[name];
			}
			return this;
		}
		
		override public function destruct():void
		{
			for each(var component:IComponent in _components)
				removeComponent(component);
			super.destruct();
		}
		
	}

}