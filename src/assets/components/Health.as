package assets.components 
{
	import assets.DamageEvent;
	import core.base.Component;
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class Health extends Component 
	{
		public static const HP_CHANGED:String = "hitPointsChanged";
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
			setTimeout(function ():void
			{
				_parent.dispatchEvent(new Event("dead"));
			}, 1);
			_parent.dispatchEvent(new Event(HP_CHANGED));
		}
		
		override public function disconnect():void 
		{
			_parent.removeEventListener(DamageEvent.SET_DAMAGE,onDamage);
		}
		
	}

}