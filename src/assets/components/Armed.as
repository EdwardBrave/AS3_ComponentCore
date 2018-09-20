package assets.components 
{
	import assets.CollisionEvent;
	import assets.DamageEvent;
	import core.base.Component;
	import core.packs.DamageObject;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class Armed extends Component 
	{
		
		public function Armed() 
		{
			super();
			_settings.collisionTriger = [ -1];
			_settings.damage = new DamageObject(0);
		}
		
		override public function connect():void 
		{
			_parent.addEventListener(CollisionEvent.COLLISION, onCollision);
		}
		
		private function onCollision(e:CollisionEvent):void
		{
			if (_settings.collisionTriger.indexOf(e.collisionType) != -1)
				e.object.dispatchEvent(new DamageEvent(DamageEvent.SET_DAMAGE,false,false,_settings.damage));
		}
		
		override public function disconnect():void 
		{
			_parent.removeEventListener(CollisionEvent.COLLISION, onCollision);
		}
		
	}

}