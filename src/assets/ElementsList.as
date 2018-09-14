package assets 
{
	import assets.components.ComponentsList;
	import assets.entities.EntitiesList;
	import assets.guiComponents.GuiComponentsList;
	import assets.guiEntities.GuiEntitiesList;
	import flash.utils.getDefinitionByName;
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class ElementsList 
	{
		public static function getClass(name:String):Class
		{
			ComponentsList;
			EntitiesList;
			GuiComponentsList;
			GuiEntitiesList;
			return getDefinitionByName(name) as Class;
		}
		
		
		
		
	}

}