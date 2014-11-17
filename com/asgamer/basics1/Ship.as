

package com.asgamer.basics1{
	
	import flash.display.MovieClip;	
	import flash.display.Stage;
	import com.senocular.utils.KeyObject;
	import flash.ui.Keyboard;
	import flash.events.Event;
	
	public class Ship extends MovieClip	{
		
		private var stageRef:Stage;
		private var key:KeyObject;
		
		public function Ship(stageRef:Stage)
		{
			this.stageRef = stageRef;
			key = new KeyObject(stageRef);
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		
		public function loop(e:Event) : void
		{
			if (key.isDown(Keyboard.LEFT))
				x -= 2;
			else if (key.isDown(Keyboard.RIGHT))
				x += 2;
			
			if (key.isDown(Keyboard.UP))
				y -= 2;
			else if (key.isDown(Keyboard.DOWN))
				y += 2;
		}
		
	}
	
}

