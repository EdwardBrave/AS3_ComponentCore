package assets.guiEntities 
{
	import core.base.Container;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class Label extends Container 
	{
		public var label:TextField;
		public function Label() 
		{
			super();
			_settings.color = 0x000000;
			_settings.text = "";
			_settings.font = "";
			_settings.size = 20;
			_settings.width = 0;
			_settings.height = 0;
		}
		
		override public function initGraphics():void 
		{
			label = new TextField();
			label.text = _settings.text;
			label.setTextFormat(new TextFormat(_settings.font, _settings.size, _settings.color,null,null,null,null,null,"center"));
			addChild(label);
		}
		
		override public function connect():void 
		{
			if (_settings.width == 0)
				_settings.width = parent.width;
			if (_settings.height == 0)
				_settings.height = parent.height;
			label.width = _settings.width;
			label.height = _settings.height;
		}
		
		override public function destruct():void 
		{
			removeChild(label);
			label = null;
			super.destruct();
		} 
		
	}

}