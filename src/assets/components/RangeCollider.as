package assets.components 
{
	import assets.CollisionEvent;
	import assets.MoveEvent;
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
			if (_settings.solid)
				return;
			var position:Vector2 = Vector2.getVectorByPoints(centerPoint(_parent),centerPoint(e.object));
			var angle:int = position.angle;
			if (angle < 45 || angle >= 315){	
				angle = 100 + 160 * (centerPoint(_parent).y - (e.object.y - _parent.height / 2) ) / (_parent.height + e.object.height); 
				_parent.x = e.object.x - _parent.width - 1;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,Vector2.getAngleVector(angle)));
			}
			else if (angle < 135){
				angle = 190 + 160 * (centerPoint(_parent).x - (e.object.x - _parent.width/2) )/(_parent.width + e.object.width); 
				_parent.y = e.object.y + e.object.height + 1;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,Vector2.getAngleVector(angle)));
			}
			else if (angle < 225){
				angle = 280 + 160 * (1 - (centerPoint(_parent).y - (e.object.y - _parent.height / 2) ) / (_parent.height + e.object.height)); 
				_parent.x = e.object.x + e.object.width + 1;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.START_MOVE,false,false,Vector2.getAngleVector(angle)));
			}
			else{
				angle = 10 + 160 * (1 - (centerPoint(_parent).x - (e.object.x - _parent.width/2) )/(_parent.width + e.object.width)); 
				_parent.y = e.object.y - _parent.height -1;
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