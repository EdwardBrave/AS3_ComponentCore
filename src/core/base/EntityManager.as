package core.base 
{
	import core.Data;
	import core.packs.PrototypeObject;
	import core.packs.EntityObject;
	import flash.display.DisplayObject;
	import flash.utils.getDefinitionByName;
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class EntityManager 
	{
		private static var _entityList:Object = new Object();
		
		public static function loadEntity(name:String, data:EntityObject, isChild:Boolean = false):IComponent
		{
			if (!isChild && _entityList[name])
				return _entityList[name];
			
			var buildTree:PrototypeObject;
			switch(data.sysType){
				case EntityObject.ENTITY:
					buildTree = Data.entities[data.sID];
					break;
				case EntityObject.COMPONENT:
					buildTree = Data.components[data.sID];
					break;
				case EntityObject.GUI_ENTITY:
					buildTree = Data.guiEntities[data.sID];
					break;
				case EntityObject.GUI_COMPONENT:
					buildTree = Data.guiComponents[data.sID];
					break;
				default:
					return null;
			}
			var entityClass:Class = getDefinitionByName(buildTree.classType) as Class;
			var entity:IComponent = new entityClass();
			entity.refreshSettings(buildTree.settings);
			if (!isChild)
				_entityList[name] = entity;
			if (data.uID >= 0)
				entity.uID = data.uID;
			
			if (entity is ComponentList){
				for each (var componentsList:Object in [buildTree.components, buildTree.children])
					for (var componentName:String in componentsList)
					{
						var component:EntityObject = componentsList[componentName];
						var newComponent:IComponent = loadEntity(componentName, component, true);
						if (newComponent is DisplayObject){
							(newComponent as DisplayObject).x = component.x;
							(newComponent as DisplayObject).y = component.y;
						}
						newComponent.refreshSettings(component.settings);
						(entity as ComponentList).addComponent(newComponent);
					}
			}
			return entity;
		}
		
		public static function refreshMemory():void
		{
			for each(var entity:IComponent in _entityList){
				if (entity.getParent() == null)
					removeEntity(entity);
			}
		}
		
		public static function getEntity(name:String):IComponent
		{
			return _entityList[name];
		}
		
		public static function getEntityName(entity:IComponent):String
		{
			for (var name:String in _entityList)
				if (_entityList[name] === entity)
					return name;
			return "";
		}
		
		public static function reconnectEntity(entity:IComponent, newParent:ComponentList):void
		{
			var oldParent:* = entity.getParent();
			var name:String = "";
			if (oldParent && oldParent is ComponentList){
				name = (oldParent as ComponentList).getComponentName(entity);
				(oldParent as ComponentList).disconnectComponent(entity);
			}
			if (newParent)
				newParent.addComponent(entity,name);
		}
		
		public static function removeEntityByName(name:String):void 
		{
			var entity:IComponent = _entityList[name] as IComponent;
			if (entity){
				entity.destruct();
				delete _entityList[name];
			}
		}
		
		public static function removeEntity(entity:*):void
		{
			var name:String = getEntityName(entity);
			if (name){
				entity.destruct();
				delete _entityList[name];
			}
			
		}
		

		
		
		
		
		
	}

}