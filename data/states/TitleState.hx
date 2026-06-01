import hxvlc.flixel.FlxVideoSprite;
import flixel.FlxCamera;

var video:FlxVideoSprite;
var videoCamera:FlxCamera;

/*
function postCreate() {
    if (!skippedIntro)
    {
        videoCamera = new FlxCamera();
        videoCamera.bgColor = 0;
        FlxG.cameras.add(videoCamera, false);
        video = new FlxVideoSprite(FlxAxes.X, FlxAxes.Y);
        video.bitmap.onEndReached.add(closeVideo);
        video.cameras = [videoCamera];
        add(video);
        if (video.load(Paths.video("v4_startup"))) {
            new FlxTimer().start(0.001, function(tmr:FlxTimer) {
                video.play();
            });
        }
    }
}

function closeVideo() {
    remove(video);
    videoCamera.visible = false;
}
    */