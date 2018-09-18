package core.utils 
{
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class Vector2 
	{
		public static const UP:Vector2 = new Vector2(0,-1); 
		public static const DOWN:Vector2 = new Vector2(0,1); 
		public static const LEFT:Vector2 = new Vector2(-1,0); 
		public static const RIGHT:Vector2 = new Vector2(1,0);
		public static const NULL:Vector2 = new Vector2(0,0);
		public var x:Number;
		public var y:Number;
		public function Vector2(x:Number, y:Number):void
		{
			this.x = x;
			this.y = y;
		}
		
		public static function normaliseAngle(newAngle:Number):Number
		{
			if (newAngle < 0)
				newAngle += 360;
			else if (newAngle >= 360)
				newAngle -= 360;	
			return newAngle;
		}
		
		public function get angle():Number
		{
			return normaliseAngle(180 + Math.atan2(y, -x) * 180 / Math.PI);
		}
		
		public function set angle(newAngle:Number):void
		{
			newAngle = normaliseAngle(newAngle);
			var rad:Number = (newAngle - 180) * (Math.PI / 180);
			x = Math.cos( -rad);
			y = Math.sin( -rad);
		}
		
		public function addVector(vector:Vector2):void
		{
			x += vector.x;
			y += vector.y;
		}
		
		public function get inverce():Vector2
		{
			return new Vector2(-this.x,-this.y);
		}
		
		public static function getAngleVector(newAngle:Number):Vector2
		{
			newAngle = normaliseAngle(newAngle);
			var rad:Number = (newAngle - 180) * (Math.PI / 180);
			return new Vector2(-Math.cos(rad),-Math.sin(rad));
		}
		
		public function get isNull():Boolean
		{
			return (x == 0 && y == 0);
		}
		
		public function addAngle(newAngle:Number):void
		{
			this.angle = angle - normaliseAngle(newAngle);
		}
		
		public static function getDeltaVector(vector1:Vector2, vector2:Vector2):Vector2
		{
			if (vector1.isNull != vector2.isNull)
				return getAngleVector(vector1.angle - vector2.angle);
			return vector1;
		}
		
	}

}