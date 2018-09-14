package assets.components 
{
	import core.base.Component;
	import core.base.Container;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class TestComponent extends Component 
	{
		
		public function TestComponent() 
		{
			super();
			
		}
		
		override public function secondTick():void 
		{
			if (_parent is Container)
			trace((_parent as Container).getComponentName(this));
		}
		
	}

}