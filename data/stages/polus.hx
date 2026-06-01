var u = false;
var r = 0;
var shot = false;
var agent = 1;
var health = 0;
var xx = 470.0;
var yy = 250.0;
var xx2 = 820.0;
var yy2 = 250.0;
var ofs = 20.0;
var followchars = true;
var del = 0;
var del2 = 0;

function onCreate():Void
{
	
}

function onUpdate(elapsed:Float):Void
{
	if (del > 0)
		del--;
	if (del2 > 0)
		del2--;
	
	if (followchars)
	{
		if (!mustHitSection)
		{
			setProperty("defaultCamZoom", 0.75);
			
			var anim = getProperty("dad.animation.curAnim.name");
			
			if (anim == "singLEFT")
				triggerEvent("Camera Follow Pos", Std.string(xx - ofs), Std.string(yy));
			if (anim == "singRIGHT")
				triggerEvent("Camera Follow Pos", Std.string(xx + ofs), Std.string(yy));
			if (anim == "singUP")
				triggerEvent("Camera Follow Pos", Std.string(xx), Std.string(yy - ofs));
			if (anim == "singDOWN")
				triggerEvent("Camera Follow Pos", Std.string(xx), Std.string(yy + ofs));
			
			if (anim == "singLEFT-alt")
				triggerEvent("Camera Follow Pos", Std.string(xx - ofs), Std.string(yy));
			if (anim == "singRIGHT-alt")
				triggerEvent("Camera Follow Pos", Std.string(xx + ofs), Std.string(yy));
			if (anim == "singUP-alt")
				triggerEvent("Camera Follow Pos", Std.string(xx), Std.string(yy - ofs));
			if (anim == "singDOWN-alt")
				triggerEvent("Camera Follow Pos", Std.string(xx), Std.string(yy + ofs));
			
			if (anim == "idle-alt" || anim == "idle")
				triggerEvent("Camera Follow Pos", Std.string(xx), Std.string(yy));
		}
		else
		{
			setProperty("defaultCamZoom", 0.75);
			
			var anim2 = getProperty("boyfriend.animation.curAnim.name");
			
			if (anim2 == "singLEFT")
				triggerEvent("Camera Follow Pos", Std.string(xx2 - ofs), Std.string(yy2));
			if (anim2 == "singRIGHT")
				triggerEvent("Camera Follow Pos", Std.string(xx2 + ofs), Std.string(yy2));
			if (anim2 == "singUP")
				triggerEvent("Camera Follow Pos", Std.string(xx2), Std.string(yy2 - ofs));
			if (anim2 == "singDOWN")
				triggerEvent("Camera Follow Pos", Std.string(xx2), Std.string(yy2 + ofs));
			
			if (anim2 == "idle-alt" || anim2 == "idle")
				triggerEvent("Camera Follow Pos", Std.string(xx2), Std.string(yy2));
		}
	}
	else
	{
		triggerEvent("Camera Follow Pos", "", "");
	}
}