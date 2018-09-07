package test 
{
	import core.base.Component;
	import core.base.Container;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class TComponent extends Component 
	{
		
		public function TComponent() 
		{
			super();
			
		}
		
		override public function update():void 
		{
			trace("child_UPDATE");
		}
		
		override public function secondTick():void 
		{
			trace("child_SECOND_TICK");
		}
		
		override public function destruct():void 
		{
			super.destruct();
			trace("child_DESTRUCT");
		}
	}

}