package assets 
{
	import core.packs.DamageObject;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class DamageEvent extends Event 
	{
		public static const SET_DAMAGE:String = "setDamage";
		
		public var damage:DamageObject;
		public function DamageEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false, damage:DamageObject = null) 
		{
			super(type, bubbles, cancelable);
			this.damage = damage || DamageObject(0);
		}
		
	}

}