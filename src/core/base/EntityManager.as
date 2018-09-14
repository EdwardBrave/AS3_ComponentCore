package core.base 
{
	import assets.components.*;
	import assets.entities.*;
	import assets.guiComponents.*;
	import assets.guiEntities.*;
	import assets.ElementsList;
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
			var folder:String = "assets.";
			var buildTree:PrototypeObject;
			switch(data.sysType){
				case EntityObject.ENTITY:
					buildTree = Data.entities[data.sID];
					folder += "entities.";
					break;
				case EntityObject.COMPONENT:
					buildTree = Data.components[data.sID];
					folder += "components.";
					break;
				case EntityObject.GUI_ENTITY:
					buildTree = Data.guiEntities[data.sID];
					folder += "guiEntities.";
					break;
				case EntityObject.GUI_COMPONENT:
					buildTree = Data.guiComponents[data.sID];
					folder += "guiComponents.";
					break;
				default:
					return null;
			}
			var entityClass:Class;
			try{
				entityClass = ElementsList.getClass(folder + buildTree.classType);
			}
			catch (err:Error){
				return null;
			}
			var entity:IComponent = new entityClass();
			entity.refreshSettings(buildTree.settings);
			entity.refreshSettings(data.settings);
			if (!isChild)
				_entityList[name] = entity;
			if (data.uID >= 0)
				entity.uID = data.uID;
			
			if (entity is DisplayObject)
			{
				(entity as DisplayObject).x = data.x;
				(entity as DisplayObject).y = data.y;
			}
				
			if (entity is ComponentList){
				for each (var componentsList:Object in [buildTree.components, buildTree.children])
					for (var componentName:String in componentsList)
					{
						var newComponent:IComponent = loadEntity(componentName, componentsList[componentName], true);
						if (newComponent)
							(entity as ComponentList).addComponent(newComponent, componentName);
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
		
		public static function removeEntityByName(name:String):void 
		{
			var entity:IComponent = _entityList[name] as IComponent;
			if (entity){
				entity.destruct();
				delete _entityList[name];
			}
		}
		
		public static function removeEntity(entity:IComponent):void
		{
			var name:String = getEntityName(entity);
			if (name){
				entity.destruct();
				delete _entityList[name];
			}
			
		}
		

		
		
		
		
		
	}

}