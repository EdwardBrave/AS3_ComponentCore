package core 
{
	import assets.CollisionEvent;
	import assets.components.Collider;
	import core.EventManager;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class CollisionManager 
	{
		private static var colliders:Vector.<Collider>;
		
		public static var _collisionList:Object;
		
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
			
			for (var count:String in colliders){
				var currentType:Array = _collisionList[colliders[count].collisionType];
				var currentCollider:Collider = colliders[count];
				var currentColliderParent:DisplayObject = (currentCollider) ? currentCollider.getParent(): null;
				if ( !currentType || !currentColliderParent){
					colliders.removeAt(int (count));
					continue;
				}
				for (var i:int = int(count) - 1; i >= 0; i-- ){
					if (currentType.indexOf(colliders[i].collisionType) != -1)
					{
						var newCollider:Collider = colliders[i];
						var newColliderParent:DisplayObject = (newCollider) ? newCollider.getParent(): null;
						if (newColliderParent && newColliderParent != currentColliderParent && isIntersects(currentColliderParent,newColliderParent)){
							if (colliders.indexOf(newCollider) != -1 && colliders.indexOf(currentCollider) != -1)
								currentColliderParent.dispatchEvent(new CollisionEvent(CollisionEvent.COLLISION, false, false, newColliderParent,newCollider.collisionType));
							if (colliders.indexOf(newCollider) != -1 && colliders.indexOf(currentCollider) != -1)
								newColliderParent.dispatchEvent(new CollisionEvent(CollisionEvent.COLLISION, false, false, currentColliderParent,currentCollider.collisionType));
						}
					}
				}	
			}
		}
		
		private static function isIntersects(collider1:DisplayObject, collider2:DisplayObject):Boolean
		{
			if (!collider1.hitTestObject(collider2))
				return false; 
			var coords:Point = collider1.parent.localToGlobal(new Point(collider1.x,collider1.y));
			var objCoords:Point = collider2.parent.localToGlobal(new Point(collider2.x, collider2.y));
			objCoords.x -= coords.x;
			objCoords.y -= coords.y;
			var container:Sprite = new Sprite();
			var obj1Data:BitmapData = new BitmapData(collider1.width, collider1.height,true,0x00000000);
			var obj2Data:BitmapData = new BitmapData(collider2.width, collider2.height,true,0x00000000);
			obj1Data.draw(collider1);
			obj2Data.draw(collider2);
			var obj1:Bitmap = new Bitmap(obj1Data);
			var obj2:Bitmap = new Bitmap(obj2Data);
			container.addChild(obj1);
			obj2.x = objCoords.x;
			obj2.y = objCoords.y;
			container.addChild(obj2);
			container.cacheAsBitmap = true;
			obj1.cacheAsBitmap = true;
			obj2.cacheAsBitmap = true;
			obj1.mask = obj2;
			var result:BitmapData = new BitmapData(container.width, container.height,true,0x00000000);
			result.draw(container);
			var rect:Rectangle = result.getColorBoundsRect(0xFF000000, 0x00000000, false);
			if (rect.x == 0 && rect.y == 0 && rect.width == 0 && rect.height == 0)
				return false;
			return true;
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