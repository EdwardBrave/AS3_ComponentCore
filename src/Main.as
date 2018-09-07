package
{
	import core.EventManager;
	import core.LayoutManager;
	import core.TimerManager;
	import core.base.Component;
	import core.base.Container;
	import core.base.IComponent;
	import core.utils.Layout;
	import flash.display.BlendMode;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import test.TComponent;
	import test.TContainer;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private var Lred:Layout;
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			EventManager.setStage(stage);
			// entry point
			TimerManager.addTimerListener(onTimer)
			Lred = LayoutManager.addLayout();
			Lred.graphics.beginFill(0xFF0000);
			Lred.graphics.drawRect(0, 0, 300, 300);
			Lred.graphics.endFill();
			
			var Lnew:TContainer = new TContainer();
			var comp:IComponent =  new TComponent();
			var comp2:IComponent =  new TComponent();
			Lnew.addComponent(comp)
			.addComponent(comp)
			.addComponent(comp2)
			.addComponent(comp)
			.addComponent(new TComponent())
			.addComponent(comp, "temp")
			.setComponentName(comp, "qwerty")
			.removeComponentByName("temp")
			.removeComponentByName("qwerty")
			.removeComponent(comp2)
			.removeComponent(comp)
			.addComponent(new TComponent())
			.addComponent(new TComponent())
			.addComponent(new TComponent());
			var sss:TContainer = new TContainer();
			this.addChild(sss);
			sss.destruct();
			this.addChild(sss);
			
		}
		private var time:uint = 0; 
		private function onTimer():void{
			trace(time++);
		}  
	}
	
}