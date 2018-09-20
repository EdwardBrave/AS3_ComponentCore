package assets.components 
{
	import assets.CollisionEvent;
	import assets.MoveEvent;
	import core.CollisionManager;
	import core.base.Component;
	import core.utils.Vector2;
	import flash.display.DisplayObject;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class Collider extends Component 
	{
		
		public function get collisionType():int
		{
			return _settings.type;
		}
		
		public function Collider() 
		{
			super();
			_settings.type = 0;
			_settings.solid = false;
		}
		
		override public function connect():void 
		{
			CollisionManager.addCollider(this);
			_parent.addEventListener(CollisionEvent.COLLISION,onCollision);
		}
		
		protected function onCollision (e:CollisionEvent):void
		{
			if (_settings.solid)
				return;
			var position:Vector2 = Vector2.getVectorByPoints(centerPoint(_parent),centerPoint(e.object));
			var angle:int = position.angle;
			if (angle < 45 || angle >= 315){
				_parent.x = e.object.x - _parent.width - 1;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.REFLECT,false,false,Vector2.RIGHT));
			}
			else if (angle < 135){
				_parent.y = e.object.y + e.object.height + 1;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.REFLECT,false,false,Vector2.UP));
			}
			else if (angle < 225){
				_parent.x = e.object.x + e.object.width + 1;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.REFLECT,false,false,Vector2.RIGHT));
			}
			else{
				_parent.y = e.object.y - _parent.height -1;
				_parent.dispatchEvent(new MoveEvent(MoveEvent.REFLECT,false,false,Vector2.UP));
			}
			
			function centerPoint(obj:DisplayObject):Point
			{
				var center:Point = new Point();
				center.x = obj.x + obj.width / 2;
				center.y = obj.y + obj.height / 2;
				return center;
			}
		}
		
		override public function disconnect():void 
		{
			_parent.removeEventListener(CollisionEvent.COLLISION,onCollision);
			CollisionManager.removeCollider(this);
		}
	}

}