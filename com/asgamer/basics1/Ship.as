

package com.asgamer.basics1
{
	
	import flash.display.MovieClip;	
	import flash.display.Stage;
	import com.senocular.utils.KeyObject;
	import flash.ui.Keyboard;
	import flash.events.Event;
	
	public class Ship extends MovieClip	
	{
		
		private var stageRef:Stage;
		private var key:KeyObject;
		private var speed:Number = 0.5;
		private var vx:Number = 0;
		private var vy:Number = 0;
		private var friction:Number = 0.93;
		private var maxspeed:Number = 8;

		
		public function Ship(stageRef:Stage)
		{
			this.stageRef = stageRef;
			key = new KeyObject(stageRef);
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		
		public function loop(e:Event) : void
		{
			//keypresses
			if (key.isDown(Keyboard.LEFT))
				vx -= 2;
			else if (key.isDown(Keyboard.RIGHT))
				vx += 2;
			else
				vx *= friction;
			
			if (key.isDown(Keyboard.UP))
				vy -= 2;
			else if (key.isDown(Keyboard.DOWN))
				vy += 2;
			else
				vy *= friction;
			
			//update position
			x += vx;
			y += vy;
			
			rotation = vx;
			//speed adjustment
			if (vx > maxspeed)
				vx = maxspeed;
			else if (vx < -maxspeed)
				vx = -maxspeed;
			
			if (vy > maxspeed)
				vy = maxspeed;
			else if (vy < -maxspeed)
				vy = -maxspeed;
			
			//ship appearance
			rotation = vx;
			scaleX = (maxspeed - Math.abs(vx))/(maxspeed*4) + 0.75;
			
			//stay inside screen
			if (x > stageRef.stageWidth)
			{
				x = stageRef.stageWidth;
				vx = -vx;
			}
			else if (x < 0)
			{
				x = 0;
				vx = -vx;
			}
			
			if (y > stageRef.stageHeight)
			{
				y = stageRef.stageHeight;
				vy = -vy;
			}
			else if (y < 0)
			{
				y = 0;
				vy = -vy;
			}
			
			
		}
		
	}
	
}

