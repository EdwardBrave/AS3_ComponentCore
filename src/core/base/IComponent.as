package core.base 
{
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public interface IComponent 
	{
		function set uID(id:int):void;
		
		function get uID():int;
		
		function refreshSettings(settings:Object):void;
		
		function getParent():*;
		
		function setParent(container:ComponentList):void;
		
		function connect():void;
		
		function disconnect():void;
		
		function update():void;
		
		function secondTick():void;
		
		function destruct():void;
	}
	
}