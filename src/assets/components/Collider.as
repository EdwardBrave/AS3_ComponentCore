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
			var collisionList:Object = CollisionManager._collisionList[_settings.type];
			if (_settings.solid || !( collisionList && collisionList.indexOf(e.collisionType) != -1))
				return;
			var position:Point = centerPoint(_parent);
			if (e.object.width <= 0 || e.object.height <= 0)
				return;
			var colliderPosition:Point = centerPoint(e.object);
			position = new Point(position.x - colliderPosition.x, position.y - colliderPosition.y);
			var limit:Number = Math.abs(e.object.height/e.object.width * position.x);
			if ( -limit < position.y && position.y < limit){
				_parent.x = e.object.x + ((position.x >= 0) ? e.object.width + 1 : -(_parent.width + 1));
				_parent.dispatchEvent(new MoveEvent(MoveEvent.REFLECT,false,false,Vector2.RIGHT));
			}
			else{
				_parent.y = e.object.y + ((position.y >= 0) ? e.object.height + 1 : -(_parent.height + 1));
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