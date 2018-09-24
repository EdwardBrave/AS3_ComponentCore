package
{
	import assets.components.PlayerController;
	import core.Data;
	import core.EventManager;
	import core.GameEvent;
	import core.GameManager;
	import core.LayoutManager;
	import core.base.Container;
	import core.base.EntityManager;
	import core.base.IComponent;
	import core.base.WindowManager;
	import core.packs.DamageObject;
	import core.packs.EntityObject;
	import core.packs.PrototypeObject;
	import core.utils.Layout;
	import core.utils.Vector2;
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	
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
		private function init(e:Event = null):void 
		{
			Data.gameRooms[0] = new Object();
			Data.gameRooms[0].fields = new Array();
			Data.gameRooms[0].fields[0] = {
				bttn:new EntityObject(0, EntityObject.GUI_ENTITY, 1, 300, 260,{width:200, height:80, onClick: gotoGameRoom})
				
			};
			
			Data.windows.loose = new EntityObject(2, EntityObject.GUI_ENTITY, 1, 300, 260, {width:200, height:80, onClick: gotoGameRoom});
			Data.windows.win = new EntityObject(3, EntityObject.GUI_ENTITY, 1, 300, 260, {width:200, height:80, onClick: gotoGameRoom});
			
			Data.guiEntities[0] = new PrototypeObject(0, "Button",{},{},
				{
					label:new EntityObject(1, EntityObject.GUI_ENTITY, 1, 0, 20,{size: 30, text:"START GAME"})
				}
			);
			
			Data.guiEntities[1] = new PrototypeObject(1, "Label");
			
			Data.guiEntities[2] = new PrototypeObject(0, "Button",{color:0xFF4A4A, overColor:0xFF8C8C},{},
				{
					label:new EntityObject(1, EntityObject.GUI_ENTITY, 1, 0, 20,{size: 30, text:"YOU LOOSE"})
				}
			);
			
			Data.guiEntities[3] = new PrototypeObject(0, "Button",{},{},
				{
					label:new EntityObject(1, EntityObject.GUI_ENTITY, 1, 0, 20,{size: 30, text:"YOU WIN"})
				}
			);
			
			Data.gameRooms[1] = new Object();
			Data.gameRooms[1].fields = new Array();
			Data.gameRooms[1].fields[0] = {
				wallTop:new EntityObject(0, EntityObject.ENTITY, 1, 0, 0,{width:800,height:20}),
				wallLeft:new EntityObject(0, EntityObject.ENTITY, 2, 0, 0,{width:20,height:600}),
				wallRight:new EntityObject(0, EntityObject.ENTITY, 3, 780, 0,{width:20,height:600}),
				wallBottom:new EntityObject(1, EntityObject.ENTITY, 3, 20, 580,{width:760,height:20})
			};
			
			Data.gameRooms[1].fields[1] = {};
			
			Data.gameRooms[1].fields[2] = {
				ball:new EntityObject(2, EntityObject.ENTITY, 1, 375, 460),
				raket:new EntityObject(4, EntityObject.ENTITY,1,325,540,{width:150,height:30})
			};
			
			Data.entities[0] = new PrototypeObject(0, "Block", {color:0x552B00},
				{
					collider:new EntityObject(0, EntityObject.COMPONENT,-1,0,0,{type : 0})
				}
			);
			
			Data.entities[1] = new PrototypeObject(1, "Block", {color:0xFF7575},
				{
					collider: new EntityObject(0, EntityObject.COMPONENT, -1, 0, 0, {type : 0}),
					armed: new EntityObject(1, EntityObject.COMPONENT,-1,0,0,{damage: new DamageObject(100), collisionTriger:[1]})
				}
			);
			
			Data.entities[2] = new PrototypeObject(2, "Ball",{},
				{
					collider: new EntityObject(0, EntityObject.COMPONENT, -1, 0, 0, {type : 1, solid: false}),
					rangeCollider: new EntityObject(2, EntityObject.COMPONENT, -1, 0, 0, {type : 2, solid: false}),
					armed: new EntityObject(1, EntityObject.COMPONENT, -1, 0, 0, {collisionTriger:[3]}),
					health: new EntityObject(3, EntityObject.COMPONENT),
					gameController: new EntityObject(4, EntityObject.COMPONENT),
					movement: new EntityObject(5,EntityObject.COMPONENT,-1,0,0,{speed:10})
				}
			);
			
			Data.entities[3] = new PrototypeObject(3, "Block",{},
				{
					collider:new EntityObject(0, EntityObject.COMPONENT, -1, 0, 0, {type : 3}),
					health: new EntityObject(3, EntityObject.COMPONENT)
				}
				
			);
			
			Data.entities[4] = new PrototypeObject(4, "Block", {color:0x7171FF},
				{
					collider: new EntityObject(0, EntityObject.COMPONENT, -1, 0, 0, {type : 4, solid: true}),
					collider2: new EntityObject(0, EntityObject.COMPONENT, -1, 0, 0, {type : 5, solid: false}),
					movement: new EntityObject(5, EntityObject.COMPONENT,-1,0,0,{isContinue: false,speed:7}),
					playerController: new EntityObject(6, EntityObject.COMPONENT)
				}
				
			);
			
			Data.components[0] = new PrototypeObject(0, "Collider", {solid: true});
			Data.components[1] = new PrototypeObject(1, "Armed", {damage: new DamageObject(1)});
			Data.components[2] = new PrototypeObject(2, "RangeCollider", {solid: true});
			Data.components[3] = new PrototypeObject(3, "Health", {health: 2});
			Data.components[4] = new PrototypeObject(4, "GameController", {event:"dead", dispatch:GameEvent.GAME_OVER});
			Data.components[5] = new PrototypeObject(5, "Movement", {isContinue: true}),
			Data.components[6] = new PrototypeObject(6, "PlayerController",{activeKeys: PlayerController.HORISONTAL_ARROWS | PlayerController.HORISONTAL_KEYS})
			
			var collisionList:Object = {0:[1, 5], 1:[0, 1, 3], 2:[4], 3:[1], 4:[2], 5:[0]};
			
			var dx:int = 30;
			var dy:int = 30;
			var count:int = 0;
			while (dy + 50 < 400)
			{
				while(dx + 50 < 770){
					Data.gameRooms[1].fields[1]["block" + count] = new EntityObject(3, EntityObject.ENTITY, count++, dx, dy);
					dx += 55;
				}
				dy += 55;
				dx = 30;
			}
			
			GameManager.initGame(stage,collisionList);
			GameManager.loadGameRoom(0);
			
			//LayoutManager.getLayout(1).addEventListener(Event.REMOVED,onLayoutChange);
		}
		
		public var reverce:Boolean = false;
		
		private var gameRoom:int = 0;
		public function gotoGameRoom(e:* = null):void
		{
			gameRoom = ++gameRoom % 2;
			GameManager.loadGameRoom(gameRoom);
			
			if (gameRoom == 1) {
				LayoutManager.getLayout(1).addEventListener(Event.REMOVED,onLayoutChange);
				EventManager.addEventListener(EventManager.KEY_DOWN, gameStart);
				stage.addEventListener(GameEvent.GAME_OVER,gameLoose);
			}
		}
		
		public function gameLoose(e:*):void
		{
			WindowManager.loadWindow("loose");
			WindowManager.showWindowByName("loose");
		}
		
		public function onLayoutChange(e:Event):void
		{
			
			if (e.currentTarget.numChildren <= 1){
				e.currentTarget.removeEventListener(Event.REMOVED,onLayoutChange);
				stage.dispatchEvent(new GameEvent(GameEvent.GAME_WIN));
				WindowManager.loadWindow("win");
				WindowManager.showWindowByName("win");
			}
			
		}
		
		public function gameStart(e:*):void
		{
			stage.dispatchEvent(new GameEvent(GameEvent.START));
			EventManager.removeEventListener(EventManager.KEY_DOWN, gameStart);
		}
		
	}
	
}