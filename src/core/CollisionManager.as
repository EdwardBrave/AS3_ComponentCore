package core 
{
	import assets.CollisionEvent;
	import assets.components.Collider;
	import core.EventManager;
	import flash.display.DisplayObject;
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class CollisionManager 
	{
		private static var colliders:Vector.<Collider>;
		
		private static var _collisionList:Object;
		
		/**
		 * иницыализует коллизию
		 * @param	collisionList - объект с картой розрешенных коллизий
		 * collisionList = {int:[int,int,int] ... }
		 */
		public static function init(collisionList:Object):void
		{
			colliders = new Vector.<Collider>();
			_collisionList = collisionList;
			EventManager.addEventListener(EventManager.ENTER_FRAME, collisionCheck);
		}
		
		private static function collisionCheck():void
		{
			if (colliders.length <= 1)
				return;
			
			for (var count:int = colliders.length - 1; count >= 0; count--){
				var currentType:Array = _collisionList[colliders[count].collisionType];
				var currentCollider:DisplayObject = colliders[count].getParent();
				if (!currentCollider || !currentType){
					colliders.removeAt(count);
					continue;
				}
				for (var i:int = count - 1; i >= 0; i-- ){
					if (currentType.indexOf(colliders[i].collisionType) != -1)
					{
						var newCollider:DisplayObject = colliders[i].getParent();
						if (newCollider && currentCollider.hitTestObject(newCollider)){
							currentCollider.dispatchEvent(new CollisionEvent(CollisionEvent.COLLISION, false, false, newCollider,colliders[count].collisionType));
							newCollider.dispatchEvent(new CollisionEvent(CollisionEvent.COLLISION, false, false, currentCollider,colliders[i].collisionType));
						}
					}
				}	
			}
		}
		
		public static function addCollider(collider:Collider):void
		{
			if (collider && colliders.indexOf(collider) == -1)
				colliders.push(collider);
		}
		
		public static function removeCollider(collider:Collider):void
		{
			if (collider){
				var pos:int = colliders.indexOf(collider);
				if (pos != -1)
					colliders.removeAt(pos);
			}
		}
		
	}

}