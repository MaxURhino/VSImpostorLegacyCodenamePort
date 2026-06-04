import flixel.util.FlxColor;
import funkin.game.HudCamera;
import flixel.FlxCamera;
import flixel.FlxObject;
import flixel.math.FlxPoint;
import funkin.game.Stage;
import funkin.game.cutscenes.Cutscene;
import hxvlc.flixel.FlxVideo;
import funkin.game.cutscenes.ScriptedCutscene;
import funkin.game.cutscenes.VideoCutscene;
import hxvlc.flixel.FlxVideoSprite;
import haxe.io.FPHelper;
import funkin.backend.assets.ModsFolder;
import funkin.backend.MusicBeatState;

var videoCamera: FlxCamera;

public var skippable: Bool = true;
public static var ended: Bool = false;

function create() {
    if (!ended) {
        videoCamera = new FlxCamera();
        videoCamera.bgColor = 0;
        FlxG.cameras.add(videoCamera, false);

        video = new FlxVideoSprite(FlxAxes.X, FlxAxes.Y);
        video.bitmap.onEndReached.add(close);
        //trace(video.bitmap.onEndReached);
        video.cameras = [videoCamera];

        add(video);

        playvideo('intro');
        skippedIntro = false;
    }
}

function playvideo(videoname)
{
    //trace('playvide');
    if (video.load('mods/' + ModsFolder.currentModFolder + '/videos/' + videoname + '.mp4'))
        new FlxTimer().start(0.001, function(tmr:FlxTimer) {
            video.play();
        });
}

function close()
{
    video.stop();
    remove(video);
    videoCamera.visible = false;
    ended = true;
    //trace(ended);
    FlxG.switchState(new TitleState());
}

function postUpdate() {
    if (!ended) {
        video.screenCenter(FlxAxes.XY);
        video.setGraphicSize(FlxG.width, FlxG.height);
        if (video.bitmap.isPlaying && controls.ACCEPT) {
            close();
        }
    }
}