package core.packs 
{
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class DamageObject 
	{
		public var damage:int;
		public var antiArmor:Boolean;
		public var deceleration: Number;
		
		public function DamageObject(damage:int, antiArmor:Boolean = false, deceleration:Number = 0.0) 
		{
			this.damage = damage;
			this.antiArmor = antiArmor;
			this.deceleration = deceleration;
		}
		
	}

}