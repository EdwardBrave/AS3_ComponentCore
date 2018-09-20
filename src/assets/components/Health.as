package assets.components 
{
	import assets.DamageEvent;
	import core.base.Component;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class Health extends Component 
	{
		
		public function Health() 
		{
			super();
			_settings.health = 1.;
			_settings.isArmored = false;
		}
		
		override public function connect():void 
		{
			_parent.addEventListener(DamageEvent.SET_DAMAGE,onDamage);
		}
		
		private function onDamage(e:DamageEvent):void
		{
			_settings.health -= e.damage.damage * ((_settings.isArmored == e.damage.antiArmor) ? 1. : 0.5);
			if (_settings.health <= 0)
				_parent.dispatchEvent(new Event("dead"));
		}
		
		override public function disconnect():void 
		{
			_parent.removeEventListener(DamageEvent.SET_DAMAGE,onDamage);
		}
		
	}

}