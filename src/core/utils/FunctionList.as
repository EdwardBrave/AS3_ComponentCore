package core.utils 
{
	/**
	 * ...
	 * @author EdwardBrave
	 */
	public class FunctionList
	{
		private var _functions:Vector.<Function>;
		
		public function get functions():Vector.<Function>{
			return _functions;
		}
		
		public function get length():uint{
			return _functions.length;
		}
		
		public function FunctionList(length:uint = 0, fixed:Boolean = false):void
		{
			_functions = new Vector.<Function>(length,fixed);
		}
		
		public function addFunc(func:Function,position:int = -1):Boolean{
			if (_functions.indexOf(func) == -1){
				position = (0 <= position && position < _functions.length) ? position: _functions.length;
				_functions.splice(position, 0, func);
				return true;
			}
			return false;
		}
		
		public function forceAddFunc(func:Function,position:int = -1):Boolean{
			if (_functions.indexOf(func) != -1)
				removeFunc(func);
			position = (0 <= position && position < _functions.length) ? position: _functions.length;
			_functions.splice(position, 0, func);
			return true;
		}
		
		public function SetFuncPos(func:Function,position:uint):Boolean{
			if (_functions.indexOf(func) != -1){
				removeFunc(func);
				position = (position < _functions.length) ? position: _functions.length;
				_functions.splice(position, 0, func);
				return true;
			}
			return false;
		}
		
		public function removeFunc(func:Function):Boolean{
			var pos:int = _functions.indexOf(func);
			if (pos != -1){
				_functions.removeAt(pos);
				return true;
			}
			return false;
		}
		
		public function erase():void{
			_functions.splice(0, _functions.length);
		}
	}

}