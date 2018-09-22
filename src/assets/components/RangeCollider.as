package assets.components 
{
	import assets.CollisionEvent;
	import assets.MoveEvent;
	import core.CollisionManager;
	import core.utils.Vector2;
	import flash.display.DisplayObject;
	import flash.geom.Point;
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class RangeCollider extends Collider 
	{
		
		public function RangeCollider() 
		{
			super();
		}
		
		override protected function onCollision(e:CollisionEvent):void 
		{
			var collisionList:Object = CollisionManager._collisionList[_settings.type];
			if (_settings.solid || !( collisionList && collisionList.indexOf(e.collisionType) != -1))
				return;	
			var isNormalise:Boolean = (e.object.width > 0 || e.object.height > 0);
			var angle:int;
			var position:Point = centerPoint(_parent);
			var colliderPosition:Point = centerPoint(e.object);
			position = new Point(position.x - colliderPosition.x, position.y - colliderPosition.y);
			var limit:Number = Math.abs(e.object.height/e.object.width * position.x);
			if ( -limit < position.y && position.y < limit){
				if (isNormalise)
					_parent.x = e.object.x + ((position.x >= 0) ? e.object.width + 1 : -(_parent.width + 1));
				if (position.x >= 0)
					angle = 280 + 160 * (1 - (centerPoint(_parent).y - (e.object.y - _parent.height / 2) ) / (_parent.height + e.object.height));
				else
					angle = 100 + 160 * (centerPoint(_parent).y - (e.object.y - _parent.height / 2) ) / (_parent.height + e.object.height); 	
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE, false, false, Vector2.getAngleVector(angle)));
			}
			else{
				if (isNormalise)
					_parent.y = e.object.y + ((position.y >= 0) ? e.object.height + 1 : -(_parent.height + 1));
				if (position.y >= 0)
					angle = 190 + 160 * (centerPoint(_parent).x - (e.object.x - _parent.width/2) )/(_parent.width + e.object.width); 
				else
					angle = 10 + 160 * (1 - (centerPoint(_parent).x - (e.object.x - _parent.width/2) )/(_parent.width + e.object.width)); 
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,Vector2.getAngleVector(angle)));
			}
			
			function centerPoint(obj:DisplayObject):Point
			{
				var center:Point = new Point();
				center.x = obj.x + obj.width / 2;
				center.y = obj.y + obj.height / 2;
				return center;
			}
		}
		
	}

}